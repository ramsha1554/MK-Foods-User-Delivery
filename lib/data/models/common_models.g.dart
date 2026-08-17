// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeoPointImpl _$$GeoPointImplFromJson(Map<String, dynamic> json) =>
    _$GeoPointImpl(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$GeoPointImplToJson(_$GeoPointImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

_$DeliveryAddressInfoImpl _$$DeliveryAddressInfoImplFromJson(
  Map<String, dynamic> json,
) => _$DeliveryAddressInfoImpl(
  label: json['label'] as String,
  fullAddress: json['fullAddress'] as String,
  location: json['location'] == null
      ? null
      : GeoPoint.fromJson(json['location'] as Map<String, dynamic>),
  longitude: (json['longitude'] as num?)?.toDouble(),
  latitude: (json['latitude'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$DeliveryAddressInfoImplToJson(
  _$DeliveryAddressInfoImpl instance,
) => <String, dynamic>{
  'label': instance.label,
  'fullAddress': instance.fullAddress,
  'location': instance.location,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
};

_$DeliveryAddressDetailImpl _$$DeliveryAddressDetailImplFromJson(
  Map<String, dynamic> json,
) => _$DeliveryAddressDetailImpl(
  label: json['label'] as String,
  fullAddress: json['fullAddress'] as String,
  longitude: (json['longitude'] as num?)?.toDouble(),
  latitude: (json['latitude'] as num?)?.toDouble(),
  street: json['street'] as String?,
  city: json['city'] as String?,
  postcode: json['postcode'] as String?,
  deliveryInstructions: json['deliveryInstructions'] as String?,
);

Map<String, dynamic> _$$DeliveryAddressDetailImplToJson(
  _$DeliveryAddressDetailImpl instance,
) => <String, dynamic>{
  'label': instance.label,
  'fullAddress': instance.fullAddress,
  if (instance.longitude case final value?) 'longitude': value,
  if (instance.latitude case final value?) 'latitude': value,
  if (instance.street case final value?) 'street': value,
  if (instance.city case final value?) 'city': value,
  if (instance.postcode case final value?) 'postcode': value,
  if (instance.deliveryInstructions case final value?)
    'deliveryInstructions': value,
};

_$RestaurantAddressImpl _$$RestaurantAddressImplFromJson(
  Map<String, dynamic> json,
) => _$RestaurantAddressImpl(
  street: json['street'] as String?,
  city: json['city'] as String?,
  postcode: json['postcode'] as String?,
);

Map<String, dynamic> _$$RestaurantAddressImplToJson(
  _$RestaurantAddressImpl instance,
) => <String, dynamic>{
  'street': instance.street,
  'city': instance.city,
  'postcode': instance.postcode,
};
