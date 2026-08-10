


import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/locator.dart';
import '../../../../data/api/api_client.dart';
import '../../../../data/models/auth_models.dart';
import '../../../../data/repositories/customer_repository.dart';
import '../../../../data/services/auth_storage_service.dart';

enum AuthStatus { uninitialized, authenticated, unauthenticated, loading, error }

class AuthState {
  final AuthStatus status;
  final String? errorMessage;
  final User? user;
  final String? phone;

  const AuthState({
    this.status = AuthStatus.uninitialized,
    this.errorMessage,
    this.user,
    this.phone,
  });

  AuthState copyWith({
    AuthStatus? status,
    String? errorMessage,
    User? user,
    String? phone,
  }) {
    return AuthState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
      phone: phone ?? this.phone,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final CustomerRepository _repository;
  final AuthStorageService _storage;
  final ApiClient _apiClient;

  AuthNotifier(this._repository, this._storage, this._apiClient)
      : super(const AuthState()) {
    // The interceptor calls this when a request 401s and the refresh token
    // is also missing/expired, so the app falls back to the login flow the
    // same way an explicit logout does.
    _apiClient.onSessionExpired = _clearSession;
    _init();
  }
 

  Future<void> _init() async {
    if (_storage.isLoggedIn) {
      _apiClient.setToken(_storage.accessToken);
      state = state.copyWith(
        status: AuthStatus.authenticated,
        phone: _storage.userPhone,
        user: User(
          id: _storage.userId ?? '',
          phone: _storage.userPhone ?? '',
          name: _storage.userName,
          email: _storage.userEmail,
          role: 'customer',
          isVerified: true,
        ),
      );
      // Local cache can be stale (e.g. name/email changed on the backend
      // since the last login). Refresh from the server in the background
      // so the UI shows current data instead of whatever was cached.
      unawaited(_refreshProfileFromServer());
    } else {
      state = state.copyWith(status: AuthStatus.unauthenticated);
    }
  }

  Future<void> _refreshProfileFromServer() async {
    try {
      final freshUser = await _repository.getProfile();
      await _storage.saveAuth(
        accessToken: _storage.accessToken!,
        refreshToken: _storage.refreshToken!,
        userId: freshUser.id,
        phone: freshUser.phone,
        name: freshUser.name,
        email: freshUser.email,
      );
      state = state.copyWith(user: freshUser);
    } catch (_) {
      // Offline or the call failed — keep showing the cached data rather
      // than blocking startup or surfacing an error for a background sync.
    }
  }

  Future<void> requestOtp(String phone) async {
    state = state.copyWith(status: AuthStatus.loading, phone: phone);

    try {
      await _repository.requestOtp(
        RequestOtpRequest(phone: phone, role: 'customer'),
      );
      state = state.copyWith(status: AuthStatus.unauthenticated, phone: phone);
    } on Exception catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString().replaceAll('Exception: ', ''),
      );
    }
  }

  Future<bool> verifyOtp(String code) async {
    state = state.copyWith(status: AuthStatus.loading);

    try {
      final authData = await _repository.verifyOtp(
        VerifyOtpRequest(phone: state.phone!, code: code),
      );

      await _storage.saveAuth(
        accessToken: authData.accessToken,
        refreshToken: authData.refreshToken,
        userId: authData.user.id,
        phone: authData.user.phone,
        name: authData.user.name,
        email: authData.user.email,
      );

      _apiClient.setToken(authData.accessToken);

      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: authData.user,
      );

      return authData.user.isNewUser ?? false;
    } on Exception catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString().replaceAll('Exception: ', ''),
      );
      return false;
    }
  }

  Future<void> updateName(String name) async {
    await _storage.saveName(name);
    state = state.copyWith(
      user: state.user?.copyWith(name: name),
    );
  }

  Future<void> logout() async {
    await _clearSession();
  }

  Future<void> _clearSession() async {
    await _storage.clear();
    _apiClient.setToken(null);
    state = const AuthState(status: AuthStatus.unauthenticated);
  }
  Future<void> refreshAfterProfileUpdate(User updatedUser) async {
    if (updatedUser.name != null) {
      await _storage.saveName(updatedUser.name!);
    }
    if (updatedUser.email != null) {
      await _storage.saveEmail(updatedUser.email!);
    }
    state = state.copyWith(user: updatedUser);
  }

  void clearError() {
    state = state.copyWith(status: AuthStatus.unauthenticated, errorMessage: null);
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    locator<CustomerRepository>(),
    locator<AuthStorageService>(),
    locator<ApiClient>(),
  );
});