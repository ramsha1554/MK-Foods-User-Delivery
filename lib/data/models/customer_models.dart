// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'common_models.dart';

part 'customer_models.freezed.dart';
part 'customer_models.g.dart';

// ──────────────────────────────────────────────
//  Address
// ──────────────────────────────────────────────

@freezed
class SaveAddressRequest with _$SaveAddressRequest {
  const factory SaveAddressRequest({
    required String label,
    @JsonKey(name: 'fullAddress') required String fullAddress,
    required String street,
    required String city,
    required String postcode,
    required double longitude,
    required double latitude,
    @JsonKey(name: 'isDefault') @Default(false) bool isDefault,
    @JsonKey(name: 'deliveryInstructions') String? deliveryInstructions,
  }) = _SaveAddressRequest;

  factory SaveAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$SaveAddressRequestFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    @JsonKey(name: '_id') required String id,
    String? user,
    required String label,
    @JsonKey(name: 'fullAddress') required String fullAddress,
    String? street,
    String? city,
    String? postcode,
    GeoPoint? location,
    @JsonKey(name: 'isDefault') required bool isDefault,
    @JsonKey(name: 'deliveryInstructions') String? deliveryInstructions,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

// ──────────────────────────────────────────────
//  Restaurant
// ──────────────────────────────────────────────

@freezed
class DayHours with _$DayHours {
  const factory DayHours({
    @JsonKey(name: 'isOpen') required bool isOpen,
    String? open,
    String? close,
  }) = _DayHours;

  factory DayHours.fromJson(Map<String, dynamic> json) =>
      _$DayHoursFromJson(json);
}

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    @JsonKey(name: '_id') required String id,
    dynamic owner,
    required String name,
    String? description,
    @JsonKey(name: 'cuisineType') List<String>? cuisineType,
    String? phone,
    String? email,
    RestaurantAddress? address,
    GeoPoint? location,
    String? logo,
    @JsonKey(name: 'coverImage') String? coverImage,
    @JsonKey(name: 'minimumOrder') double? minimumOrder,
    @JsonKey(name: 'deliveryFee') double? deliveryFee,
    @JsonKey(name: 'preparationTime') int? preparationTime,
    @JsonKey(name: 'operatingHours') Map<String, DayHours>? operatingHours,
    String? status,
    @JsonKey(name: 'isOpen') bool? isOpen,
    @JsonKey(name: 'isBusy') bool? isBusy,
    @JsonKey(name: 'averageRating') double? averageRating,
    @JsonKey(name: 'totalRatings') int? totalRatings,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}

@freezed
class MenuItem with _$MenuItem {
  const factory MenuItem({
    @JsonKey(name: '_id') required String id,
    required String name,
    String? description,
    required double price,
    @JsonKey(name: 'isAvailable') @Default(true) bool isAvailable,
    String? image,
    @JsonKey(name: 'sortOrder') int? sortOrder,
  }) = _MenuItem;

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);
}

@freezed
class MenuCategory with _$MenuCategory {
  const factory MenuCategory({
    @JsonKey(name: '_id') required String id,
    required String name,
    String? description,
    @JsonKey(name: 'sortOrder') int? sortOrder,
    required List<MenuItem> items,
  }) = _MenuCategory;

  factory MenuCategory.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryFromJson(json);
}

@freezed
class RestaurantDetail with _$RestaurantDetail {
  const factory RestaurantDetail({
    required Restaurant restaurant,
    required List<MenuCategory> menu,
  }) = _RestaurantDetail;

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDetailFromJson(json);
}

// ──────────────────────────────────────────────
//  Order
// ──────────────────────────────────────────────

@freezed
class OrderItemInput with _$OrderItemInput {
  const factory OrderItemInput({
    @JsonKey(name: 'menuItemId') required String menuItemId,
    required int quantity,
  }) = _OrderItemInput;

  factory OrderItemInput.fromJson(Map<String, dynamic> json) =>
      _$OrderItemInputFromJson(json);
}

@freezed
class PlaceOrderRequest with _$PlaceOrderRequest {
  const factory PlaceOrderRequest({
    @JsonKey(name: 'restaurantId') required String restaurantId,
    required List<OrderItemInput> items,
    @JsonKey(name: 'deliveryAddress')
    required DeliveryAddressDetail deliveryAddress,
    @JsonKey(name: 'paymentMethod') required String paymentMethod,
    @JsonKey(name: 'stripePaymentIntentId', includeIfNull: false) String? stripePaymentIntentId,
    @JsonKey(name: 'specialInstructions', includeIfNull: false) String? specialInstructions,
  }) = _PlaceOrderRequest;

  factory PlaceOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderRequestFromJson(json);
}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    @JsonKey(name: 'menuItem') dynamic menuItemId,
    String? name,
    double? price,
    int? quantity,
    @JsonKey(name: 'itemTotal') double? itemTotal,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

@freezed
class OrderStatusHistory with _$OrderStatusHistory {
  const factory OrderStatusHistory({
    required String status,
    DateTime? timestamp,
    String? note,
  }) = _OrderStatusHistory;

  factory OrderStatusHistory.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusHistoryFromJson(json);
}

@freezed
class Order with _$Order {
  const factory Order({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'orderNumber') required String orderNumber,
    dynamic customer,
    dynamic restaurant,
    required List<OrderItem> items,
    double? subtotal,
    @JsonKey(name: 'deliveryFee') double? deliveryFee,
    @JsonKey(name: 'platformFee') double? platformFee,
    required double total,
    @JsonKey(name: 'paymentMethod') String? paymentMethod,
    @JsonKey(name: 'paymentStatus') String? paymentStatus,
    required String status,
    @JsonKey(name: 'statusHistory') List<OrderStatusHistory>? statusHistory,
    @JsonKey(name: 'deliveryAddress') DeliveryAddressInfo? deliveryAddress,
    @JsonKey(name: 'specialInstructions') String? specialInstructions,
    @JsonKey(name: 'cancellationReason') String? cancellationReason,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class MyOrder with _$MyOrder {
  const factory MyOrder({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'orderNumber') required String orderNumber,
    MyOrderRestaurant? restaurant,
    double? total,
    String? status,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
  }) = _MyOrder;

  factory MyOrder.fromJson(Map<String, dynamic> json) =>
      _$MyOrderFromJson(json);
}

@freezed
class MyOrderRestaurant with _$MyOrderRestaurant {
  const factory MyOrderRestaurant({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? logo,
  }) = _MyOrderRestaurant;

  factory MyOrderRestaurant.fromJson(Map<String, dynamic> json) =>
      _$MyOrderRestaurantFromJson(json);
}

@freezed
class CancelOrderRequest with _$CancelOrderRequest {
  const factory CancelOrderRequest({
    String? reason,
  }) = _CancelOrderRequest;

  factory CancelOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CancelOrderRequestFromJson(json);
}

// ──────────────────────────────────────────────
//  Payment
// ──────────────────────────────────────────────

@freezed
class CreatePaymentIntentRequest with _$CreatePaymentIntentRequest {
  const factory CreatePaymentIntentRequest({
    @JsonKey(name: 'orderId') required String orderId,
  }) = _CreatePaymentIntentRequest;

  factory CreatePaymentIntentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePaymentIntentRequestFromJson(json);
}

@freezed
class PaymentIntentResponse with _$PaymentIntentResponse {
  const factory PaymentIntentResponse({
    @JsonKey(name: 'clientSecret') required String clientSecret,
    @JsonKey(name: 'paymentIntentId') required String paymentIntentId,
  }) = _PaymentIntentResponse;

  factory PaymentIntentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentIntentResponseFromJson(json);
}

// ──────────────────────────────────────────────
//  Rating
// ──────────────────────────────────────────────

@freezed
class SubmitRatingRequest with _$SubmitRatingRequest {
  const factory SubmitRatingRequest({
    @JsonKey(name: 'orderId') required String orderId,
    @JsonKey(name: 'restaurantRating') required int restaurantRating,
    @JsonKey(name: 'driverRating') int? driverRating,
    String? comment,
  }) = _SubmitRatingRequest;

  factory SubmitRatingRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitRatingRequestFromJson(json);
}

@freezed
class RatingResponse with _$RatingResponse {
  const factory RatingResponse({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'order') String? orderId,
    String? customer,
    String? restaurant,
    String? driver,
    @JsonKey(name: 'restaurantRating') int? restaurantRating,
    @JsonKey(name: 'driverRating') int? driverRating,
    String? comment,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
  }) = _RatingResponse;

  factory RatingResponse.fromJson(Map<String, dynamic> json) =>
      _$RatingResponseFromJson(json);
}

// ──────────────────────────────────────────────
//  Update Profile
// ──────────────────────────────────────────────

@freezed
class UpdateProfileRequest with _$UpdateProfileRequest {
  const factory UpdateProfileRequest({
    String? name,
    String? email,
  }) = _UpdateProfileRequest;

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);
}