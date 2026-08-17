// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GeoPoint _$GeoPointFromJson(Map<String, dynamic> json) {
  return _GeoPoint.fromJson(json);
}

/// @nodoc
mixin _$GeoPoint {
  String get type => throw _privateConstructorUsedError;
  List<double> get coordinates => throw _privateConstructorUsedError;

  /// Serializes this GeoPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeoPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeoPointCopyWith<GeoPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoPointCopyWith<$Res> {
  factory $GeoPointCopyWith(GeoPoint value, $Res Function(GeoPoint) then) =
      _$GeoPointCopyWithImpl<$Res, GeoPoint>;
  @useResult
  $Res call({String type, List<double> coordinates});
}

/// @nodoc
class _$GeoPointCopyWithImpl<$Res, $Val extends GeoPoint>
    implements $GeoPointCopyWith<$Res> {
  _$GeoPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeoPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? coordinates = null}) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            coordinates: null == coordinates
                ? _value.coordinates
                : coordinates // ignore: cast_nullable_to_non_nullable
                      as List<double>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GeoPointImplCopyWith<$Res>
    implements $GeoPointCopyWith<$Res> {
  factory _$$GeoPointImplCopyWith(
    _$GeoPointImpl value,
    $Res Function(_$GeoPointImpl) then,
  ) = __$$GeoPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, List<double> coordinates});
}

/// @nodoc
class __$$GeoPointImplCopyWithImpl<$Res>
    extends _$GeoPointCopyWithImpl<$Res, _$GeoPointImpl>
    implements _$$GeoPointImplCopyWith<$Res> {
  __$$GeoPointImplCopyWithImpl(
    _$GeoPointImpl _value,
    $Res Function(_$GeoPointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GeoPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? coordinates = null}) {
    return _then(
      _$GeoPointImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        coordinates: null == coordinates
            ? _value._coordinates
            : coordinates // ignore: cast_nullable_to_non_nullable
                  as List<double>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoPointImpl implements _GeoPoint {
  const _$GeoPointImpl({
    required this.type,
    required final List<double> coordinates,
  }) : _coordinates = coordinates;

  factory _$GeoPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoPointImplFromJson(json);

  @override
  final String type;
  final List<double> _coordinates;
  @override
  List<double> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  @override
  String toString() {
    return 'GeoPoint(type: $type, coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoPointImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(
              other._coordinates,
              _coordinates,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    const DeepCollectionEquality().hash(_coordinates),
  );

  /// Create a copy of GeoPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoPointImplCopyWith<_$GeoPointImpl> get copyWith =>
      __$$GeoPointImplCopyWithImpl<_$GeoPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoPointImplToJson(this);
  }
}

abstract class _GeoPoint implements GeoPoint {
  const factory _GeoPoint({
    required final String type,
    required final List<double> coordinates,
  }) = _$GeoPointImpl;

  factory _GeoPoint.fromJson(Map<String, dynamic> json) =
      _$GeoPointImpl.fromJson;

  @override
  String get type;
  @override
  List<double> get coordinates;

  /// Create a copy of GeoPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeoPointImplCopyWith<_$GeoPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryAddressInfo _$DeliveryAddressInfoFromJson(Map<String, dynamic> json) {
  return _DeliveryAddressInfo.fromJson(json);
}

/// @nodoc
mixin _$DeliveryAddressInfo {
  String get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullAddress')
  String get fullAddress => throw _privateConstructorUsedError;
  GeoPoint? get location => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;

  /// Serializes this DeliveryAddressInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryAddressInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryAddressInfoCopyWith<DeliveryAddressInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryAddressInfoCopyWith<$Res> {
  factory $DeliveryAddressInfoCopyWith(
    DeliveryAddressInfo value,
    $Res Function(DeliveryAddressInfo) then,
  ) = _$DeliveryAddressInfoCopyWithImpl<$Res, DeliveryAddressInfo>;
  @useResult
  $Res call({
    String label,
    @JsonKey(name: 'fullAddress') String fullAddress,
    GeoPoint? location,
    double? longitude,
    double? latitude,
  });

  $GeoPointCopyWith<$Res>? get location;
}

/// @nodoc
class _$DeliveryAddressInfoCopyWithImpl<$Res, $Val extends DeliveryAddressInfo>
    implements $DeliveryAddressInfoCopyWith<$Res> {
  _$DeliveryAddressInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryAddressInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? fullAddress = null,
    Object? location = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
  }) {
    return _then(
      _value.copyWith(
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            fullAddress: null == fullAddress
                ? _value.fullAddress
                : fullAddress // ignore: cast_nullable_to_non_nullable
                      as String,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as GeoPoint?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }

  /// Create a copy of DeliveryAddressInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoPointCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $GeoPointCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeliveryAddressInfoImplCopyWith<$Res>
    implements $DeliveryAddressInfoCopyWith<$Res> {
  factory _$$DeliveryAddressInfoImplCopyWith(
    _$DeliveryAddressInfoImpl value,
    $Res Function(_$DeliveryAddressInfoImpl) then,
  ) = __$$DeliveryAddressInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String label,
    @JsonKey(name: 'fullAddress') String fullAddress,
    GeoPoint? location,
    double? longitude,
    double? latitude,
  });

  @override
  $GeoPointCopyWith<$Res>? get location;
}

/// @nodoc
class __$$DeliveryAddressInfoImplCopyWithImpl<$Res>
    extends _$DeliveryAddressInfoCopyWithImpl<$Res, _$DeliveryAddressInfoImpl>
    implements _$$DeliveryAddressInfoImplCopyWith<$Res> {
  __$$DeliveryAddressInfoImplCopyWithImpl(
    _$DeliveryAddressInfoImpl _value,
    $Res Function(_$DeliveryAddressInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeliveryAddressInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? fullAddress = null,
    Object? location = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
  }) {
    return _then(
      _$DeliveryAddressInfoImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        fullAddress: null == fullAddress
            ? _value.fullAddress
            : fullAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as GeoPoint?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryAddressInfoImpl implements _DeliveryAddressInfo {
  const _$DeliveryAddressInfoImpl({
    required this.label,
    @JsonKey(name: 'fullAddress') required this.fullAddress,
    this.location,
    this.longitude,
    this.latitude,
  });

  factory _$DeliveryAddressInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryAddressInfoImplFromJson(json);

  @override
  final String label;
  @override
  @JsonKey(name: 'fullAddress')
  final String fullAddress;
  @override
  final GeoPoint? location;
  @override
  final double? longitude;
  @override
  final double? latitude;

  @override
  String toString() {
    return 'DeliveryAddressInfo(label: $label, fullAddress: $fullAddress, location: $location, longitude: $longitude, latitude: $latitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryAddressInfoImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    label,
    fullAddress,
    location,
    longitude,
    latitude,
  );

  /// Create a copy of DeliveryAddressInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryAddressInfoImplCopyWith<_$DeliveryAddressInfoImpl> get copyWith =>
      __$$DeliveryAddressInfoImplCopyWithImpl<_$DeliveryAddressInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryAddressInfoImplToJson(this);
  }
}

abstract class _DeliveryAddressInfo implements DeliveryAddressInfo {
  const factory _DeliveryAddressInfo({
    required final String label,
    @JsonKey(name: 'fullAddress') required final String fullAddress,
    final GeoPoint? location,
    final double? longitude,
    final double? latitude,
  }) = _$DeliveryAddressInfoImpl;

  factory _DeliveryAddressInfo.fromJson(Map<String, dynamic> json) =
      _$DeliveryAddressInfoImpl.fromJson;

  @override
  String get label;
  @override
  @JsonKey(name: 'fullAddress')
  String get fullAddress;
  @override
  GeoPoint? get location;
  @override
  double? get longitude;
  @override
  double? get latitude;

  /// Create a copy of DeliveryAddressInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryAddressInfoImplCopyWith<_$DeliveryAddressInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryAddressDetail _$DeliveryAddressDetailFromJson(
  Map<String, dynamic> json,
) {
  return _DeliveryAddressDetail.fromJson(json);
}

/// @nodoc
mixin _$DeliveryAddressDetail {
  String get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullAddress')
  String get fullAddress => throw _privateConstructorUsedError; // GeoPoint? location,
  @JsonKey(includeIfNull: false)
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get street => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get postcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryInstructions', includeIfNull: false)
  String? get deliveryInstructions => throw _privateConstructorUsedError;

  /// Serializes this DeliveryAddressDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryAddressDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryAddressDetailCopyWith<DeliveryAddressDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryAddressDetailCopyWith<$Res> {
  factory $DeliveryAddressDetailCopyWith(
    DeliveryAddressDetail value,
    $Res Function(DeliveryAddressDetail) then,
  ) = _$DeliveryAddressDetailCopyWithImpl<$Res, DeliveryAddressDetail>;
  @useResult
  $Res call({
    String label,
    @JsonKey(name: 'fullAddress') String fullAddress,
    @JsonKey(includeIfNull: false) double? longitude,
    @JsonKey(includeIfNull: false) double? latitude,
    @JsonKey(includeIfNull: false) String? street,
    @JsonKey(includeIfNull: false) String? city,
    @JsonKey(includeIfNull: false) String? postcode,
    @JsonKey(name: 'deliveryInstructions', includeIfNull: false)
    String? deliveryInstructions,
  });
}

/// @nodoc
class _$DeliveryAddressDetailCopyWithImpl<
  $Res,
  $Val extends DeliveryAddressDetail
>
    implements $DeliveryAddressDetailCopyWith<$Res> {
  _$DeliveryAddressDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryAddressDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? fullAddress = null,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? street = freezed,
    Object? city = freezed,
    Object? postcode = freezed,
    Object? deliveryInstructions = freezed,
  }) {
    return _then(
      _value.copyWith(
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            fullAddress: null == fullAddress
                ? _value.fullAddress
                : fullAddress // ignore: cast_nullable_to_non_nullable
                      as String,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            street: freezed == street
                ? _value.street
                : street // ignore: cast_nullable_to_non_nullable
                      as String?,
            city: freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String?,
            postcode: freezed == postcode
                ? _value.postcode
                : postcode // ignore: cast_nullable_to_non_nullable
                      as String?,
            deliveryInstructions: freezed == deliveryInstructions
                ? _value.deliveryInstructions
                : deliveryInstructions // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeliveryAddressDetailImplCopyWith<$Res>
    implements $DeliveryAddressDetailCopyWith<$Res> {
  factory _$$DeliveryAddressDetailImplCopyWith(
    _$DeliveryAddressDetailImpl value,
    $Res Function(_$DeliveryAddressDetailImpl) then,
  ) = __$$DeliveryAddressDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String label,
    @JsonKey(name: 'fullAddress') String fullAddress,
    @JsonKey(includeIfNull: false) double? longitude,
    @JsonKey(includeIfNull: false) double? latitude,
    @JsonKey(includeIfNull: false) String? street,
    @JsonKey(includeIfNull: false) String? city,
    @JsonKey(includeIfNull: false) String? postcode,
    @JsonKey(name: 'deliveryInstructions', includeIfNull: false)
    String? deliveryInstructions,
  });
}

/// @nodoc
class __$$DeliveryAddressDetailImplCopyWithImpl<$Res>
    extends
        _$DeliveryAddressDetailCopyWithImpl<$Res, _$DeliveryAddressDetailImpl>
    implements _$$DeliveryAddressDetailImplCopyWith<$Res> {
  __$$DeliveryAddressDetailImplCopyWithImpl(
    _$DeliveryAddressDetailImpl _value,
    $Res Function(_$DeliveryAddressDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeliveryAddressDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? fullAddress = null,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? street = freezed,
    Object? city = freezed,
    Object? postcode = freezed,
    Object? deliveryInstructions = freezed,
  }) {
    return _then(
      _$DeliveryAddressDetailImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        fullAddress: null == fullAddress
            ? _value.fullAddress
            : fullAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        street: freezed == street
            ? _value.street
            : street // ignore: cast_nullable_to_non_nullable
                  as String?,
        city: freezed == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String?,
        postcode: freezed == postcode
            ? _value.postcode
            : postcode // ignore: cast_nullable_to_non_nullable
                  as String?,
        deliveryInstructions: freezed == deliveryInstructions
            ? _value.deliveryInstructions
            : deliveryInstructions // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryAddressDetailImpl implements _DeliveryAddressDetail {
  const _$DeliveryAddressDetailImpl({
    required this.label,
    @JsonKey(name: 'fullAddress') required this.fullAddress,
    @JsonKey(includeIfNull: false) this.longitude,
    @JsonKey(includeIfNull: false) this.latitude,
    @JsonKey(includeIfNull: false) this.street,
    @JsonKey(includeIfNull: false) this.city,
    @JsonKey(includeIfNull: false) this.postcode,
    @JsonKey(name: 'deliveryInstructions', includeIfNull: false)
    this.deliveryInstructions,
  });

  factory _$DeliveryAddressDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryAddressDetailImplFromJson(json);

  @override
  final String label;
  @override
  @JsonKey(name: 'fullAddress')
  final String fullAddress;
  // GeoPoint? location,
  @override
  @JsonKey(includeIfNull: false)
  final double? longitude;
  @override
  @JsonKey(includeIfNull: false)
  final double? latitude;
  @override
  @JsonKey(includeIfNull: false)
  final String? street;
  @override
  @JsonKey(includeIfNull: false)
  final String? city;
  @override
  @JsonKey(includeIfNull: false)
  final String? postcode;
  @override
  @JsonKey(name: 'deliveryInstructions', includeIfNull: false)
  final String? deliveryInstructions;

  @override
  String toString() {
    return 'DeliveryAddressDetail(label: $label, fullAddress: $fullAddress, longitude: $longitude, latitude: $latitude, street: $street, city: $city, postcode: $postcode, deliveryInstructions: $deliveryInstructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryAddressDetailImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    label,
    fullAddress,
    longitude,
    latitude,
    street,
    city,
    postcode,
    deliveryInstructions,
  );

  /// Create a copy of DeliveryAddressDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryAddressDetailImplCopyWith<_$DeliveryAddressDetailImpl>
  get copyWith =>
      __$$DeliveryAddressDetailImplCopyWithImpl<_$DeliveryAddressDetailImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryAddressDetailImplToJson(this);
  }
}

abstract class _DeliveryAddressDetail implements DeliveryAddressDetail {
  const factory _DeliveryAddressDetail({
    required final String label,
    @JsonKey(name: 'fullAddress') required final String fullAddress,
    @JsonKey(includeIfNull: false) final double? longitude,
    @JsonKey(includeIfNull: false) final double? latitude,
    @JsonKey(includeIfNull: false) final String? street,
    @JsonKey(includeIfNull: false) final String? city,
    @JsonKey(includeIfNull: false) final String? postcode,
    @JsonKey(name: 'deliveryInstructions', includeIfNull: false)
    final String? deliveryInstructions,
  }) = _$DeliveryAddressDetailImpl;

  factory _DeliveryAddressDetail.fromJson(Map<String, dynamic> json) =
      _$DeliveryAddressDetailImpl.fromJson;

  @override
  String get label;
  @override
  @JsonKey(name: 'fullAddress')
  String get fullAddress; // GeoPoint? location,
  @override
  @JsonKey(includeIfNull: false)
  double? get longitude;
  @override
  @JsonKey(includeIfNull: false)
  double? get latitude;
  @override
  @JsonKey(includeIfNull: false)
  String? get street;
  @override
  @JsonKey(includeIfNull: false)
  String? get city;
  @override
  @JsonKey(includeIfNull: false)
  String? get postcode;
  @override
  @JsonKey(name: 'deliveryInstructions', includeIfNull: false)
  String? get deliveryInstructions;

  /// Create a copy of DeliveryAddressDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryAddressDetailImplCopyWith<_$DeliveryAddressDetailImpl>
  get copyWith => throw _privateConstructorUsedError;
}

RestaurantAddress _$RestaurantAddressFromJson(Map<String, dynamic> json) {
  return _RestaurantAddress.fromJson(json);
}

/// @nodoc
mixin _$RestaurantAddress {
  String? get street => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get postcode => throw _privateConstructorUsedError;

  /// Serializes this RestaurantAddress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantAddressCopyWith<RestaurantAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantAddressCopyWith<$Res> {
  factory $RestaurantAddressCopyWith(
    RestaurantAddress value,
    $Res Function(RestaurantAddress) then,
  ) = _$RestaurantAddressCopyWithImpl<$Res, RestaurantAddress>;
  @useResult
  $Res call({String? street, String? city, String? postcode});
}

/// @nodoc
class _$RestaurantAddressCopyWithImpl<$Res, $Val extends RestaurantAddress>
    implements $RestaurantAddressCopyWith<$Res> {
  _$RestaurantAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = freezed,
    Object? city = freezed,
    Object? postcode = freezed,
  }) {
    return _then(
      _value.copyWith(
            street: freezed == street
                ? _value.street
                : street // ignore: cast_nullable_to_non_nullable
                      as String?,
            city: freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String?,
            postcode: freezed == postcode
                ? _value.postcode
                : postcode // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RestaurantAddressImplCopyWith<$Res>
    implements $RestaurantAddressCopyWith<$Res> {
  factory _$$RestaurantAddressImplCopyWith(
    _$RestaurantAddressImpl value,
    $Res Function(_$RestaurantAddressImpl) then,
  ) = __$$RestaurantAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? street, String? city, String? postcode});
}

/// @nodoc
class __$$RestaurantAddressImplCopyWithImpl<$Res>
    extends _$RestaurantAddressCopyWithImpl<$Res, _$RestaurantAddressImpl>
    implements _$$RestaurantAddressImplCopyWith<$Res> {
  __$$RestaurantAddressImplCopyWithImpl(
    _$RestaurantAddressImpl _value,
    $Res Function(_$RestaurantAddressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RestaurantAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = freezed,
    Object? city = freezed,
    Object? postcode = freezed,
  }) {
    return _then(
      _$RestaurantAddressImpl(
        street: freezed == street
            ? _value.street
            : street // ignore: cast_nullable_to_non_nullable
                  as String?,
        city: freezed == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String?,
        postcode: freezed == postcode
            ? _value.postcode
            : postcode // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantAddressImpl implements _RestaurantAddress {
  const _$RestaurantAddressImpl({this.street, this.city, this.postcode});

  factory _$RestaurantAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantAddressImplFromJson(json);

  @override
  final String? street;
  @override
  final String? city;
  @override
  final String? postcode;

  @override
  String toString() {
    return 'RestaurantAddress(street: $street, city: $city, postcode: $postcode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantAddressImpl &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, street, city, postcode);

  /// Create a copy of RestaurantAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantAddressImplCopyWith<_$RestaurantAddressImpl> get copyWith =>
      __$$RestaurantAddressImplCopyWithImpl<_$RestaurantAddressImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantAddressImplToJson(this);
  }
}

abstract class _RestaurantAddress implements RestaurantAddress {
  const factory _RestaurantAddress({
    final String? street,
    final String? city,
    final String? postcode,
  }) = _$RestaurantAddressImpl;

  factory _RestaurantAddress.fromJson(Map<String, dynamic> json) =
      _$RestaurantAddressImpl.fromJson;

  @override
  String? get street;
  @override
  String? get city;
  @override
  String? get postcode;

  /// Create a copy of RestaurantAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantAddressImplCopyWith<_$RestaurantAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
