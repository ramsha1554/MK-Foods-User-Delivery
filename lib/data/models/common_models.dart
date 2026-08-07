// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_models.freezed.dart';
part 'common_models.g.dart';

@freezed
class GeoPoint with _$GeoPoint {
  const factory GeoPoint({
    required String type,
    required List<double> coordinates,
  }) = _GeoPoint;

  factory GeoPoint.fromJson(Map<String, dynamic> json) =>
      _$GeoPointFromJson(json);
}

@freezed
class DeliveryAddressInfo with _$DeliveryAddressInfo {
  const factory DeliveryAddressInfo({
    required String label,
    @JsonKey(name: 'fullAddress') required String fullAddress,
    GeoPoint? location,
    double? longitude,
    double? latitude,
  }) = _DeliveryAddressInfo;

  factory DeliveryAddressInfo.fromJson(Map<String, dynamic> json) =>
      _$DeliveryAddressInfoFromJson(json);
}

@freezed
class DeliveryAddressDetail with _$DeliveryAddressDetail {
  const factory DeliveryAddressDetail({
    required String label,
    @JsonKey(name: 'fullAddress') required String fullAddress,
    // GeoPoint? location,
    double? longitude,
    double? latitude,
    String? street,
    String? city,
    String? postcode,
    @JsonKey(name: 'deliveryInstructions') String? deliveryInstructions,
  }) = _DeliveryAddressDetail;

  factory DeliveryAddressDetail.fromJson(Map<String, dynamic> json) =>
      _$DeliveryAddressDetailFromJson(json);
}

@freezed
class RestaurantAddress with _$RestaurantAddress {
  const factory RestaurantAddress({
    String? street,
    String? city,
    String? postcode,
  }) = _RestaurantAddress;

  factory RestaurantAddress.fromJson(Map<String, dynamic> json) =>
      _$RestaurantAddressFromJson(json);
}
