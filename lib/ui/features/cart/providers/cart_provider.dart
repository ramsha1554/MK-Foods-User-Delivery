import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/customer_models.dart';

class CartItem {
  final MenuItem menuItem;
  final int quantity;

  const CartItem({required this.menuItem, this.quantity = 1});

  double get itemTotal => menuItem.price * quantity;

  CartItem copyWith({int? quantity}) {
    return CartItem(
      menuItem: menuItem,
      quantity: quantity ?? this.quantity,
    );
  }
}

class CartState {
  final String? restaurantId;
  final String? restaurantName;
  final double? minimumOrder;
  final double? deliveryFee;
  final List<CartItem> items;
  final String specialInstructions;

  const CartState({
    this.restaurantId,
    this.restaurantName,
    this.minimumOrder,
    this.deliveryFee,
    this.items = const [],
    this.specialInstructions = '',
  });

  bool get isEmpty => items.isEmpty;
  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);
  double get subtotal => items.fold(0, (sum, item) => sum + item.itemTotal);
  bool get isMinimumOrderMet =>
      minimumOrder == null || minimumOrder == 0 || subtotal >= minimumOrder!;

  CartState copyWith({
    String? restaurantId,
    String? restaurantName,
    double? minimumOrder,
    double? deliveryFee,
    List<CartItem>? items,
    String? specialInstructions,
  }) {
    return CartState(
      restaurantId: restaurantId ?? this.restaurantId,
      restaurantName: restaurantName ?? this.restaurantName,
      minimumOrder: minimumOrder ?? this.minimumOrder,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      items: items ?? this.items,
      specialInstructions: specialInstructions ?? this.specialInstructions,
    );
  }
}

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(const CartState());

  /// Returns true if adding this item would conflict with the restaurant
  /// already in the cart (i.e. cart is non-empty and belongs to a
  /// different restaurant). The UI should confirm with the user before
  /// calling [clearCart] and retrying.
  bool hasConflict(String restaurantId) {
    return state.restaurantId != null && state.restaurantId != restaurantId;
  }

  void addItem({
    required MenuItem menuItem,
    required String restaurantId,
    required String restaurantName,
    double? minimumOrder,
    double? deliveryFee,
  }) {
    final items = List<CartItem>.from(state.items);
    final index = items.indexWhere((c) => c.menuItem.id == menuItem.id);

    if (index >= 0) {
      items[index] = items[index].copyWith(quantity: items[index].quantity + 1);
    } else {
      items.add(CartItem(menuItem: menuItem));
    }

    state = state.copyWith(
      restaurantId: restaurantId,
      restaurantName: restaurantName,
      minimumOrder: minimumOrder,
      deliveryFee: deliveryFee,
      items: items,
    );
  }
  
  
  void removeItem(String menuItemId) {
    final items = state.items.where((c) => c.menuItem.id != menuItemId).toList();
    state = state.copyWith(items: items);
    if (items.isEmpty) clearCart();
  }

  void updateQuantity(String menuItemId, int quantity) {
    if (quantity <= 0) {
      removeItem(menuItemId);
      return;
    }
    final items = state.items.map((c) {
      return c.menuItem.id == menuItemId ? c.copyWith(quantity: quantity) : c;
    }).toList();
    state = state.copyWith(items: items);
  }

  void setInstructions(String instructions) {
    state = state.copyWith(specialInstructions: instructions);
  }

  void clearCart() {
    state = const CartState();
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier();
});