import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/locator.dart';
import '../../../../data/models/customer_models.dart';
import '../../../../data/repositories/customer_repository.dart';

class OrdersState {
  final List<MyOrder> orders;
  final bool isLoading;
  final String? errorMessage;
  final String? cancellingOrderId;

  const OrdersState({
    this.orders = const [],
    this.isLoading = false,
    this.errorMessage,
    this.cancellingOrderId,
  });

  OrdersState copyWith({
    List<MyOrder>? orders,
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
    String? cancellingOrderId,
    bool clearCancelling = false,
  }) {
    return OrdersState(
      orders: orders ?? this.orders,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      cancellingOrderId: clearCancelling ? null : (cancellingOrderId ?? this.cancellingOrderId),
    );
  }
}

class OrdersNotifier extends StateNotifier<OrdersState> {
  final CustomerRepository _repository;

  OrdersNotifier(this._repository) : super(const OrdersState());

  Future<void> fetchOrders() async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final response = await _repository.getMyOrders();
      final list = (response.data as List<dynamic>)
          .map((e) => MyOrder.fromJson(e as Map<String, dynamic>))
          .toList();
      state = state.copyWith(orders: list, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString().replaceAll('Exception: ', ''),
      );
    }
  }

  Future<bool> cancelOrder(String orderId, {String? reason}) async {
    state = state.copyWith(cancellingOrderId: orderId);
    try {
      final updated = await _repository.cancelOrder(orderId, reason: reason);
      final orders = state.orders.map((o) {
        return o.id == orderId ? o.copyWith(status: updated.status) : o;
      }).toList();
      state = state.copyWith(orders: orders, clearCancelling: true);
      return true;
    } catch (e) {
      state = state.copyWith(
        errorMessage: e.toString().replaceAll('Exception: ', ''),
        clearCancelling: true,
      );
      return false;
    }
  }
}

final ordersProvider = StateNotifierProvider<OrdersNotifier, OrdersState>((ref) {
  return OrdersNotifier(locator<CustomerRepository>());
});

const cancellableStatuses = {'placed', 'confirmed', 'preparing'};
