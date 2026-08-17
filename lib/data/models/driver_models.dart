// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'common_models.dart';

part 'driver_models.freezed.dart';
part 'driver_models.g.dart';

// ──────────────────────────────────────────────
//  Driver Profile & Registration
// ──────────────────────────────────────────────

@freezed
class RegisterDriverRequest with _$RegisterDriverRequest {
  const factory RegisterDriverRequest({
    @JsonKey(includeIfNull: false) String? name,
    @JsonKey(name: 'vehicleType', includeIfNull: false) String? vehicleType,
  }) = _RegisterDriverRequest;

  factory RegisterDriverRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterDriverRequestFromJson(json);
}

@freezed
class DriverProfile with _$DriverProfile {
  const factory DriverProfile({
    @JsonKey(name: '_id') required String id,
    String? phone,
    String? name,
    String? role,
    @JsonKey(name: 'driverStatus') String? driverStatus,
    @JsonKey(name: 'vehicleType') String? vehicleType,
    @JsonKey(name: 'isVerified') bool? isVerified,
    @JsonKey(name: 'isActive') bool? isActive,
  }) = _DriverProfile;

  factory DriverProfile.fromJson(Map<String, dynamic> json) =>
      _$DriverProfileFromJson(json);
}

// ──────────────────────────────────────────────
//  Documents
// ──────────────────────────────────────────────

@freezed
class Document with _$Document {
  const factory Document({
    @JsonKey(name: '_id') required String id,
    String? driver,
    String? type,
    @JsonKey(name: 'fileUrl') String? fileUrl,
    @JsonKey(name: 'originalName') String? originalName,
    String? status,
    @JsonKey(name: 'adminNote') String? adminNote,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  }) = _Document;

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);
}

// ──────────────────────────────────────────────
//  Online Status
// ──────────────────────────────────────────────

@freezed
class ToggleOnlineResponse with _$ToggleOnlineResponse {
  const factory ToggleOnlineResponse({
    @JsonKey(name: 'isOnline') required bool isOnline,
  }) = _ToggleOnlineResponse;

  factory ToggleOnlineResponse.fromJson(Map<String, dynamic> json) =>
      _$ToggleOnlineResponseFromJson(json);
}

// ──────────────────────────────────────────────
//  Location
// ──────────────────────────────────────────────

@freezed
class LocationUpdateRequest with _$LocationUpdateRequest {
  const factory LocationUpdateRequest({
    required double longitude,
    required double latitude,
  }) = _LocationUpdateRequest;

  factory LocationUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$LocationUpdateRequestFromJson(json);
}

@freezed
class LocationUpdateResponse with _$LocationUpdateResponse {
  const factory LocationUpdateResponse({
    @JsonKey(name: 'currentLocation') GeoPoint? currentLocation,
  }) = _LocationUpdateResponse;

  factory LocationUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationUpdateResponseFromJson(json);
}

// ──────────────────────────────────────────────
//  Driver Orders
// ──────────────────────────────────────────────

@freezed
class DriverOrderCustomer with _$DriverOrderCustomer {
  const factory DriverOrderCustomer({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? phone,
  }) = _DriverOrderCustomer;

  factory DriverOrderCustomer.fromJson(Map<String, dynamic> json) =>
      _$DriverOrderCustomerFromJson(json);
}

@freezed
class DriverOrderRestaurant with _$DriverOrderRestaurant {
  const factory DriverOrderRestaurant({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? phone,
    RestaurantAddress? address,
    GeoPoint? location,
  }) = _DriverOrderRestaurant;

  factory DriverOrderRestaurant.fromJson(Map<String, dynamic> json) =>
      _$DriverOrderRestaurantFromJson(json);
}

@freezed
class DriverActiveOrder with _$DriverActiveOrder {
  const factory DriverActiveOrder({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'orderNumber') required String orderNumber,
    DriverOrderCustomer? customer,
    DriverOrderRestaurant? restaurant,
    @JsonKey(name: 'deliveryAddress') DeliveryAddressInfo? deliveryAddress,
    String? status,
    double? total,
    @JsonKey(name: 'specialInstructions') String? specialInstructions,
  }) = _DriverActiveOrder;

  factory DriverActiveOrder.fromJson(Map<String, dynamic> json) =>
      _$DriverActiveOrderFromJson(json);
}

@freezed
class DriverOrderHistoryItem with _$DriverOrderHistoryItem {
  const factory DriverOrderHistoryItem({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'orderNumber') required String orderNumber,
    DriverOrderHistoryRestaurant? restaurant,
    String? status,
    double? total,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
  }) = _DriverOrderHistoryItem;

  factory DriverOrderHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$DriverOrderHistoryItemFromJson(json);
}

@freezed
class DriverOrderHistoryRestaurant with _$DriverOrderHistoryRestaurant {
  const factory DriverOrderHistoryRestaurant({
    @JsonKey(name: '_id') String? id,
    String? name,
  }) = _DriverOrderHistoryRestaurant;

  factory DriverOrderHistoryRestaurant.fromJson(Map<String, dynamic> json) =>
      _$DriverOrderHistoryRestaurantFromJson(json);
}

@freezed
class PickupResponse with _$PickupResponse {
  const factory PickupResponse({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'orderNumber') required String orderNumber,
    String? status,
    @JsonKey(name: 'statusHistory') List<OrderStatusLog>? statusHistory,
  }) = _PickupResponse;

  factory PickupResponse.fromJson(Map<String, dynamic> json) =>
      _$PickupResponseFromJson(json);
}

@freezed
class DeliverResponse with _$DeliverResponse {
  const factory DeliverResponse({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'orderNumber') required String orderNumber,
    String? status,
    @JsonKey(name: 'actualDeliveryTime') DateTime? actualDeliveryTime,
    @JsonKey(name: 'statusHistory') List<OrderStatusLog>? statusHistory,
  }) = _DeliverResponse;

  factory DeliverResponse.fromJson(Map<String, dynamic> json) =>
      _$DeliverResponseFromJson(json);
}

@freezed
class OrderStatusLog with _$OrderStatusLog {
  const factory OrderStatusLog({
    required String status,
    DateTime? timestamp,
    String? note,
  }) = _OrderStatusLog;

  factory OrderStatusLog.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusLogFromJson(json);
}

// ──────────────────────────────────────────────
//  Earnings
// ──────────────────────────────────────────────

@freezed
class EarningsSummary with _$EarningsSummary {
  const factory EarningsSummary({
    @JsonKey(name: 'totalDeliveries') required int totalDeliveries,
    @JsonKey(name: 'totalEarnings') required double totalEarnings,
    @JsonKey(name: 'todayDeliveries') required int todayDeliveries,
    @JsonKey(name: 'todayEarnings') required double todayEarnings,
  }) = _EarningsSummary;

  factory EarningsSummary.fromJson(Map<String, dynamic> json) =>
      _$EarningsSummaryFromJson(json);
}

@freezed
class EarningsOrder with _$EarningsOrder {
  const factory EarningsOrder({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'orderNumber') required String orderNumber,
    EarningsOrderRestaurant? restaurant,
    @JsonKey(name: 'deliveryFee') double? deliveryFee,
    @JsonKey(name: 'actualDeliveryTime') DateTime? actualDeliveryTime,
  }) = _EarningsOrder;

  factory EarningsOrder.fromJson(Map<String, dynamic> json) =>
      _$EarningsOrderFromJson(json);
}

@freezed
class EarningsOrderRestaurant with _$EarningsOrderRestaurant {
  const factory EarningsOrderRestaurant({
    @JsonKey(name: '_id') String? id,
    String? name,
  }) = _EarningsOrderRestaurant;

  factory EarningsOrderRestaurant.fromJson(Map<String, dynamic> json) =>
      _$EarningsOrderRestaurantFromJson(json);
}

@freezed
class DriverEarnings with _$DriverEarnings {
  const factory DriverEarnings({
    required List<EarningsOrder> orders,
    required int total,
    required int page,
    required int limit,
    required EarningsSummary summary,
  }) = _DriverEarnings;

  factory DriverEarnings.fromJson(Map<String, dynamic> json) =>
      _$DriverEarningsFromJson(json);
}
