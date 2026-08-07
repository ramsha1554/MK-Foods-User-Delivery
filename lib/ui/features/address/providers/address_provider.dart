import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/locator.dart';
import '../../../../data/models/customer_models.dart';
import '../../../../data/repositories/customer_repository.dart';

class AddressState {
  final List<Address> addresses;
  final Address? defaultAddress;
  final bool isLoading;
  final bool isSaving;
  final bool isDeleting;
  final String? errorMessage;

  const AddressState({
    this.addresses = const [],
    this.defaultAddress,
    this.isLoading = false,
    this.isSaving = false,
    this.isDeleting = false,
    this.errorMessage,
  });

  AddressState copyWith({
    List<Address>? addresses,
    Address? defaultAddress,
    bool? isLoading,
    bool? isSaving,
    bool? isDeleting,
    String? errorMessage,
    bool clearError = false,
  }) {
    return AddressState(
      addresses: addresses ?? this.addresses,
      defaultAddress: defaultAddress ?? this.defaultAddress,
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
      isDeleting: isDeleting ?? this.isDeleting,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class AddressNotifier extends StateNotifier<AddressState> {
  final CustomerRepository _repository;

  AddressNotifier(this._repository) : super(const AddressState()) {
    fetchAddresses();
  }

  Future<void> fetchAddresses() async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final list = await _repository.getAddresses();
      Address? defaultAdd;
      for (final addr in list) {
        if (addr.isDefault) {
          defaultAdd = addr;
          break;
        }
      }
      defaultAdd ??= list.isNotEmpty ? list.first : null;

      state = state.copyWith(
        addresses: list,
        defaultAddress: defaultAdd,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString().replaceAll('Exception: ', ''),
      );
    }
  }

  Future<bool> saveAddress(SaveAddressRequest request) async {
    state = state.copyWith(isSaving: true, clearError: true);
    try {
      final saved = await _repository.saveAddress(request);
      final updatedList = List<Address>.from(state.addresses);
      
      if (saved.isDefault) {
        for (var i = 0; i < updatedList.length; i++) {
          updatedList[i] = updatedList[i].copyWith(isDefault: false);
        }
      }
      updatedList.add(saved);

      Address? newDefault = state.defaultAddress;
      if (saved.isDefault || updatedList.length == 1) {
        newDefault = saved;
      }

      state = state.copyWith(
        addresses: updatedList,
        defaultAddress: newDefault,
        isSaving: false,
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        isSaving: false,
        errorMessage: e.toString().replaceAll('Exception: ', ''),
      );
      return false;
    }
  }

  Future<void> setDefaultAddress(String id) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final updated = await _repository.setDefaultAddress(id);
      final updatedList = state.addresses.map((addr) {
        if (addr.id == id) {
          return updated.copyWith(isDefault: true);
        }
        return addr.copyWith(isDefault: false);
      }).toList();

      state = state.copyWith(
        addresses: updatedList,
        defaultAddress: updated,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString().replaceAll('Exception: ', ''),
      );
    }
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }

  Future<bool> updateAddress(String id, SaveAddressRequest request) async {
    state = state.copyWith(isSaving: true, clearError: true);
    try {
      final updated = await _repository.updateAddress(id, request);
      final updatedList = state.addresses.map((addr) {
        if (addr.id == id) return updated;
        // If the updated address is now default, clear default on others
        if (updated.isDefault) return addr.copyWith(isDefault: false);
        return addr;
      }).toList();

      Address? newDefault = state.defaultAddress;
      if (updated.isDefault) {
        newDefault = updated;
      } else if (state.defaultAddress?.id == id && !updated.isDefault) {
        // Default was removed — promote first address
        newDefault = updatedList.firstWhere(
          (a) => a.isDefault,
          orElse: () => updatedList.first,
        );
      }

      state = state.copyWith(
        addresses: updatedList,
        defaultAddress: newDefault,
        isSaving: false,
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        isSaving: false,
        errorMessage: e.toString().replaceAll('Exception: ', ''),
      );
      return false;
    }
  }

  Future<bool> deleteAddress(String id) async {
    state = state.copyWith(isDeleting: true, clearError: true);
    try {
      await _repository.deleteAddress(id);
      final updatedList = state.addresses.where((a) => a.id != id).toList();

      Address? newDefault = state.defaultAddress;
      if (state.defaultAddress?.id == id) {
        // Deleted the default — promote the first remaining address
        newDefault = updatedList.isNotEmpty ? updatedList.first : null;
      }

      state = state.copyWith(
        addresses: updatedList,
        defaultAddress: newDefault,
        isDeleting: false,
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        isDeleting: false,
        errorMessage: e.toString().replaceAll('Exception: ', ''),
      );
      return false;
    }
  }
}

final addressProvider =
    StateNotifierProvider<AddressNotifier, AddressState>((ref) {
  return AddressNotifier(locator<CustomerRepository>());
});
