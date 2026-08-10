

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persists the auth session.
///
/// Access/refresh tokens are sensitive and long-lived (refresh token: 30d
/// per the backend spec), so they live in [FlutterSecureStorage] (Keychain /
/// EncryptedSharedPreferences). Non-sensitive profile fields stay in
/// [SharedPreferences], unchanged from before.
class AuthStorageService {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userIdKey = 'user_id';
  static const String _userPhoneKey = 'user_phone';
  static const String _userNameKey = 'user_name';
  static const String _userEmailKey = 'user_email';

  final FlutterSecureStorage _secureStorage;

  AuthStorageService({FlutterSecureStorage? secureStorage})
      : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  String? _accessToken;
  String? _refreshToken;
  String? _userId;
  String? _userPhone;
  String? _userName;
  String? _userEmail;

  String? get accessToken => _accessToken;
  String? get userId => _userId;
  String? get userPhone => _userPhone;
  String? get userName => _userName;
  String? get userEmail => _userEmail;
  String? get refreshToken => _refreshToken;

  Future<void> init() async {
    _accessToken = await _secureStorage.read(key: _accessTokenKey);
    _refreshToken = await _secureStorage.read(key: _refreshTokenKey);

    final prefs = await SharedPreferences.getInstance();
    _userId = prefs.getString(_userIdKey);
    _userPhone = prefs.getString(_userPhoneKey);
    _userName = prefs.getString(_userNameKey);
    _userEmail = prefs.getString(_userEmailKey);
  }

  Future<void> saveAuth({
    required String accessToken,
    required String refreshToken,
    required String userId,
    required String phone,
    String? name,
    String? email,
  }) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _userId = userId;
    _userPhone = phone;
    _userName = name;
    _userEmail = email;

    await _secureStorage.write(key: _accessTokenKey, value: accessToken);
    await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
    await prefs.setString(_userPhoneKey, phone);

  
    if (name != null && name.isNotEmpty) {
      await prefs.setString(_userNameKey, name);
    } else {
      await prefs.remove(_userNameKey);
    }
    if (email != null && email.isNotEmpty) {
      await prefs.setString(_userEmailKey, email);
    } else {
      await prefs.remove(_userEmailKey);
    }
  }

  /// Updates only the token pair, used after a silent refresh. Leaves the
  /// rest of the persisted session (user id/phone/name) untouched.
  Future<void> updateTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;

    await _secureStorage.write(key: _accessTokenKey, value: accessToken);
    await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<void> saveName(String name) async {
    _userName = name;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userNameKey, name);
  }

  Future<void> saveEmail(String email) async {
    _userEmail = email;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userEmailKey, email);
  }

  bool get isLoggedIn => _accessToken != null;

  Future<void> clear() async {
    _accessToken = null;
    _refreshToken = null;
    _userId = null;
    _userPhone = null;
    _userName = null;
    _userEmail = null;

    await _secureStorage.delete(key: _accessTokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
    await prefs.remove(_userPhoneKey);
    await prefs.remove(_userNameKey);
    await prefs.remove(_userEmailKey);
  }
}