// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SaveAddressRequest _$SaveAddressRequestFromJson(Map<String, dynamic> json) {
  return _SaveAddressRequest.fromJson(json);
}

/// @nodoc
mixin _$SaveAddressRequest {
  String get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullAddress')
  String get fullAddress => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get postcode => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'isDefault')
  bool get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryInstructions', includeIfNull: false)
  String? get deliveryInstructions => throw _privateConstructorUsedError;

  /// Serializes this SaveAddressRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaveAddressRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaveAddressRequestCopyWith<SaveAddressRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveAddressRequestCopyWith<$Res> {
  factory $SaveAddressRequestCopyWith(
    SaveAddressRequest value,
    $Res Function(SaveAddressRequest) then,
  ) = _$SaveAddressRequestCopyWithImpl<$Res, SaveAddressRequest>;
  @useResult
  $Res call({
    String label,
    @JsonKey(name: 'fullAddress') String fullAddress,
    String street,
    String city,
    String postcode,
    double longitude,
    double latitude,
    @JsonKey(name: 'isDefault') bool isDefault,
    @JsonKey(name: 'deliveryInstructions', includeIfNull: false)
    String? deliveryInstructions,
  });
}

/// @nodoc
class _$SaveAddressRequestCopyWithImpl<$Res, $Val extends SaveAddressRequest>
    implements $SaveAddressRequestCopyWith<$Res> {
  _$SaveAddressRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaveAddressRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? fullAddress = null,
    Object? street = null,
    Object? city = null,
    Object? postcode = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? isDefault = null,
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
            street: null == street
                ? _value.street
                : street // ignore: cast_nullable_to_non_nullable
                      as String,
            city: null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String,
            postcode: null == postcode
                ? _value.postcode
                : postcode // ignore: cast_nullable_to_non_nullable
                      as String,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            isDefault: null == isDefault
                ? _value.isDefault
                : isDefault // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$SaveAddressRequestImplCopyWith<$Res>
    implements $SaveAddressRequestCopyWith<$Res> {
  factory _$$SaveAddressRequestImplCopyWith(
    _$SaveAddressRequestImpl value,
    $Res Function(_$SaveAddressRequestImpl) then,
  ) = __$$SaveAddressRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String label,
    @JsonKey(name: 'fullAddress') String fullAddress,
    String street,
    String city,
    String postcode,
    double longitude,
    double latitude,
    @JsonKey(name: 'isDefault') bool isDefault,
    @JsonKey(name: 'deliveryInstructions', includeIfNull: false)
    String? deliveryInstructions,
  });
}

/// @nodoc
class __$$SaveAddressRequestImplCopyWithImpl<$Res>
    extends _$SaveAddressRequestCopyWithImpl<$Res, _$SaveAddressRequestImpl>
    implements _$$SaveAddressRequestImplCopyWith<$Res> {
  __$$SaveAddressRequestImplCopyWithImpl(
    _$SaveAddressRequestImpl _value,
    $Res Function(_$SaveAddressRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SaveAddressRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? fullAddress = null,
    Object? street = null,
    Object? city = null,
    Object? postcode = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? isDefault = null,
    Object? deliveryInstructions = freezed,
  }) {
    return _then(
      _$SaveAddressRequestImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        fullAddress: null == fullAddress
            ? _value.fullAddress
            : fullAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        street: null == street
            ? _value.street
            : street // ignore: cast_nullable_to_non_nullable
                  as String,
        city: null == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String,
        postcode: null == postcode
            ? _value.postcode
            : postcode // ignore: cast_nullable_to_non_nullable
                  as String,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        isDefault: null == isDefault
            ? _value.isDefault
            : isDefault // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$SaveAddressRequestImpl implements _SaveAddressRequest {
  const _$SaveAddressRequestImpl({
    required this.label,
    @JsonKey(name: 'fullAddress') required this.fullAddress,
    required this.street,
    required this.city,
    required this.postcode,
    required this.longitude,
    required this.latitude,
    @JsonKey(name: 'isDefault') this.isDefault = false,
    @JsonKey(name: 'deliveryInstructions', includeIfNull: false)
    this.deliveryInstructions,
  });

  factory _$SaveAddressRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveAddressRequestImplFromJson(json);

  @override
  final String label;
  @override
  @JsonKey(name: 'fullAddress')
  final String fullAddress;
  @override
  final String street;
  @override
  final String city;
  @override
  final String postcode;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  @JsonKey(name: 'isDefault')
  final bool isDefault;
  @override
  @JsonKey(name: 'deliveryInstructions', includeIfNull: false)
  final String? deliveryInstructions;

  @override
  String toString() {
    return 'SaveAddressRequest(label: $label, fullAddress: $fullAddress, street: $street, city: $city, postcode: $postcode, longitude: $longitude, latitude: $latitude, isDefault: $isDefault, deliveryInstructions: $deliveryInstructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveAddressRequestImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    label,
    fullAddress,
    street,
    city,
    postcode,
    longitude,
    latitude,
    isDefault,
    deliveryInstructions,
  );

  /// Create a copy of SaveAddressRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveAddressRequestImplCopyWith<_$SaveAddressRequestImpl> get copyWith =>
      __$$SaveAddressRequestImplCopyWithImpl<_$SaveAddressRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveAddressRequestImplToJson(this);
  }
}

abstract class _SaveAddressRequest implements SaveAddressRequest {
  const factory _SaveAddressRequest({
    required final String label,
    @JsonKey(name: 'fullAddress') required final String fullAddress,
    required final String street,
    required final String city,
    required final String postcode,
    required final double longitude,
    required final double latitude,
    @JsonKey(name: 'isDefault') final bool isDefault,
    @JsonKey(name: 'deliveryInstructions', includeIfNull: false)
    final String? deliveryInstructions,
  }) = _$SaveAddressRequestImpl;

  factory _SaveAddressRequest.fromJson(Map<String, dynamic> json) =
      _$SaveAddressRequestImpl.fromJson;

  @override
  String get label;
  @override
  @JsonKey(name: 'fullAddress')
  String get fullAddress;
  @override
  String get street;
  @override
  String get city;
  @override
  String get postcode;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  @JsonKey(name: 'isDefault')
  bool get isDefault;
  @override
  @JsonKey(name: 'deliveryInstructions', includeIfNull: false)
  String? get deliveryInstructions;

  /// Create a copy of SaveAddressRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveAddressRequestImplCopyWith<_$SaveAddressRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullAddress')
  String get fullAddress => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get postcode => throw _privateConstructorUsedError;
  GeoPoint? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'isDefault')
  bool get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryInstructions')
  String? get deliveryInstructions => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String? user,
    String label,
    @JsonKey(name: 'fullAddress') String fullAddress,
    String? street,
    String? city,
    String? postcode,
    GeoPoint? location,
    @JsonKey(name: 'isDefault') bool isDefault,
    @JsonKey(name: 'deliveryInstructions') String? deliveryInstructions,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  });

  $GeoPointCopyWith<$Res>? get location;
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = freezed,
    Object? label = null,
    Object? fullAddress = null,
    Object? street = freezed,
    Object? city = freezed,
    Object? postcode = freezed,
    Object? location = freezed,
    Object? isDefault = null,
    Object? deliveryInstructions = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            user: freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as String?,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            fullAddress: null == fullAddress
                ? _value.fullAddress
                : fullAddress // ignore: cast_nullable_to_non_nullable
                      as String,
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
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as GeoPoint?,
            isDefault: null == isDefault
                ? _value.isDefault
                : isDefault // ignore: cast_nullable_to_non_nullable
                      as bool,
            deliveryInstructions: freezed == deliveryInstructions
                ? _value.deliveryInstructions
                : deliveryInstructions // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of Address
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
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
    _$AddressImpl value,
    $Res Function(_$AddressImpl) then,
  ) = __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String? user,
    String label,
    @JsonKey(name: 'fullAddress') String fullAddress,
    String? street,
    String? city,
    String? postcode,
    GeoPoint? location,
    @JsonKey(name: 'isDefault') bool isDefault,
    @JsonKey(name: 'deliveryInstructions') String? deliveryInstructions,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  });

  @override
  $GeoPointCopyWith<$Res>? get location;
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
    _$AddressImpl _value,
    $Res Function(_$AddressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = freezed,
    Object? label = null,
    Object? fullAddress = null,
    Object? street = freezed,
    Object? city = freezed,
    Object? postcode = freezed,
    Object? location = freezed,
    Object? isDefault = null,
    Object? deliveryInstructions = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$AddressImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as String?,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        fullAddress: null == fullAddress
            ? _value.fullAddress
            : fullAddress // ignore: cast_nullable_to_non_nullable
                  as String,
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
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as GeoPoint?,
        isDefault: null == isDefault
            ? _value.isDefault
            : isDefault // ignore: cast_nullable_to_non_nullable
                  as bool,
        deliveryInstructions: freezed == deliveryInstructions
            ? _value.deliveryInstructions
            : deliveryInstructions // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl implements _Address {
  const _$AddressImpl({
    @JsonKey(name: '_id') required this.id,
    this.user,
    required this.label,
    @JsonKey(name: 'fullAddress') required this.fullAddress,
    this.street,
    this.city,
    this.postcode,
    this.location,
    @JsonKey(name: 'isDefault') required this.isDefault,
    @JsonKey(name: 'deliveryInstructions') this.deliveryInstructions,
    @JsonKey(name: 'createdAt') this.createdAt,
    @JsonKey(name: 'updatedAt') this.updatedAt,
  });

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String? user;
  @override
  final String label;
  @override
  @JsonKey(name: 'fullAddress')
  final String fullAddress;
  @override
  final String? street;
  @override
  final String? city;
  @override
  final String? postcode;
  @override
  final GeoPoint? location;
  @override
  @JsonKey(name: 'isDefault')
  final bool isDefault;
  @override
  @JsonKey(name: 'deliveryInstructions')
  final String? deliveryInstructions;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Address(id: $id, user: $user, label: $label, fullAddress: $fullAddress, street: $street, city: $city, postcode: $postcode, location: $location, isDefault: $isDefault, deliveryInstructions: $deliveryInstructions, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    user,
    label,
    fullAddress,
    street,
    city,
    postcode,
    location,
    isDefault,
    deliveryInstructions,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(this);
  }
}

abstract class _Address implements Address {
  const factory _Address({
    @JsonKey(name: '_id') required final String id,
    final String? user,
    required final String label,
    @JsonKey(name: 'fullAddress') required final String fullAddress,
    final String? street,
    final String? city,
    final String? postcode,
    final GeoPoint? location,
    @JsonKey(name: 'isDefault') required final bool isDefault,
    @JsonKey(name: 'deliveryInstructions') final String? deliveryInstructions,
    @JsonKey(name: 'createdAt') final DateTime? createdAt,
    @JsonKey(name: 'updatedAt') final DateTime? updatedAt,
  }) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String? get user;
  @override
  String get label;
  @override
  @JsonKey(name: 'fullAddress')
  String get fullAddress;
  @override
  String? get street;
  @override
  String? get city;
  @override
  String? get postcode;
  @override
  GeoPoint? get location;
  @override
  @JsonKey(name: 'isDefault')
  bool get isDefault;
  @override
  @JsonKey(name: 'deliveryInstructions')
  String? get deliveryInstructions;
  @override
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DayHours _$DayHoursFromJson(Map<String, dynamic> json) {
  return _DayHours.fromJson(json);
}

/// @nodoc
mixin _$DayHours {
  @JsonKey(name: 'isOpen')
  bool get isOpen => throw _privateConstructorUsedError;
  String? get open => throw _privateConstructorUsedError;
  String? get close => throw _privateConstructorUsedError;

  /// Serializes this DayHours to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DayHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DayHoursCopyWith<DayHours> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayHoursCopyWith<$Res> {
  factory $DayHoursCopyWith(DayHours value, $Res Function(DayHours) then) =
      _$DayHoursCopyWithImpl<$Res, DayHours>;
  @useResult
  $Res call({
    @JsonKey(name: 'isOpen') bool isOpen,
    String? open,
    String? close,
  });
}

/// @nodoc
class _$DayHoursCopyWithImpl<$Res, $Val extends DayHours>
    implements $DayHoursCopyWith<$Res> {
  _$DayHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DayHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
    Object? open = freezed,
    Object? close = freezed,
  }) {
    return _then(
      _value.copyWith(
            isOpen: null == isOpen
                ? _value.isOpen
                : isOpen // ignore: cast_nullable_to_non_nullable
                      as bool,
            open: freezed == open
                ? _value.open
                : open // ignore: cast_nullable_to_non_nullable
                      as String?,
            close: freezed == close
                ? _value.close
                : close // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DayHoursImplCopyWith<$Res>
    implements $DayHoursCopyWith<$Res> {
  factory _$$DayHoursImplCopyWith(
    _$DayHoursImpl value,
    $Res Function(_$DayHoursImpl) then,
  ) = __$$DayHoursImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'isOpen') bool isOpen,
    String? open,
    String? close,
  });
}

/// @nodoc
class __$$DayHoursImplCopyWithImpl<$Res>
    extends _$DayHoursCopyWithImpl<$Res, _$DayHoursImpl>
    implements _$$DayHoursImplCopyWith<$Res> {
  __$$DayHoursImplCopyWithImpl(
    _$DayHoursImpl _value,
    $Res Function(_$DayHoursImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DayHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
    Object? open = freezed,
    Object? close = freezed,
  }) {
    return _then(
      _$DayHoursImpl(
        isOpen: null == isOpen
            ? _value.isOpen
            : isOpen // ignore: cast_nullable_to_non_nullable
                  as bool,
        open: freezed == open
            ? _value.open
            : open // ignore: cast_nullable_to_non_nullable
                  as String?,
        close: freezed == close
            ? _value.close
            : close // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DayHoursImpl implements _DayHours {
  const _$DayHoursImpl({
    @JsonKey(name: 'isOpen') required this.isOpen,
    this.open,
    this.close,
  });

  factory _$DayHoursImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayHoursImplFromJson(json);

  @override
  @JsonKey(name: 'isOpen')
  final bool isOpen;
  @override
  final String? open;
  @override
  final String? close;

  @override
  String toString() {
    return 'DayHours(isOpen: $isOpen, open: $open, close: $close)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayHoursImpl &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.open, open) || other.open == open) &&
            (identical(other.close, close) || other.close == close));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isOpen, open, close);

  /// Create a copy of DayHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayHoursImplCopyWith<_$DayHoursImpl> get copyWith =>
      __$$DayHoursImplCopyWithImpl<_$DayHoursImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DayHoursImplToJson(this);
  }
}

abstract class _DayHours implements DayHours {
  const factory _DayHours({
    @JsonKey(name: 'isOpen') required final bool isOpen,
    final String? open,
    final String? close,
  }) = _$DayHoursImpl;

  factory _DayHours.fromJson(Map<String, dynamic> json) =
      _$DayHoursImpl.fromJson;

  @override
  @JsonKey(name: 'isOpen')
  bool get isOpen;
  @override
  String? get open;
  @override
  String? get close;

  /// Create a copy of DayHours
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayHoursImplCopyWith<_$DayHoursImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return _Restaurant.fromJson(json);
}

/// @nodoc
mixin _$Restaurant {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  dynamic get owner => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'cuisineType')
  List<String>? get cuisineType => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  RestaurantAddress? get address => throw _privateConstructorUsedError;
  GeoPoint? get location => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  @JsonKey(name: 'coverImage')
  String? get coverImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'minimumOrder')
  double? get minimumOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryFee')
  double? get deliveryFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'preparationTime')
  int? get preparationTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'operatingHours')
  Map<String, DayHours>? get operatingHours =>
      throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'isOpen')
  bool? get isOpen => throw _privateConstructorUsedError;
  @JsonKey(name: 'isBusy')
  bool? get isBusy => throw _privateConstructorUsedError;
  @JsonKey(name: 'averageRating')
  double? get averageRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalRatings')
  int? get totalRatings => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Restaurant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantCopyWith<Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCopyWith<$Res> {
  factory $RestaurantCopyWith(
    Restaurant value,
    $Res Function(Restaurant) then,
  ) = _$RestaurantCopyWithImpl<$Res, Restaurant>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    dynamic owner,
    String name,
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
  });

  $RestaurantAddressCopyWith<$Res>? get address;
  $GeoPointCopyWith<$Res>? get location;
}

/// @nodoc
class _$RestaurantCopyWithImpl<$Res, $Val extends Restaurant>
    implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? owner = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? cuisineType = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? location = freezed,
    Object? logo = freezed,
    Object? coverImage = freezed,
    Object? minimumOrder = freezed,
    Object? deliveryFee = freezed,
    Object? preparationTime = freezed,
    Object? operatingHours = freezed,
    Object? status = freezed,
    Object? isOpen = freezed,
    Object? isBusy = freezed,
    Object? averageRating = freezed,
    Object? totalRatings = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            owner: freezed == owner
                ? _value.owner
                : owner // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            cuisineType: freezed == cuisineType
                ? _value.cuisineType
                : cuisineType // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as RestaurantAddress?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as GeoPoint?,
            logo: freezed == logo
                ? _value.logo
                : logo // ignore: cast_nullable_to_non_nullable
                      as String?,
            coverImage: freezed == coverImage
                ? _value.coverImage
                : coverImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            minimumOrder: freezed == minimumOrder
                ? _value.minimumOrder
                : minimumOrder // ignore: cast_nullable_to_non_nullable
                      as double?,
            deliveryFee: freezed == deliveryFee
                ? _value.deliveryFee
                : deliveryFee // ignore: cast_nullable_to_non_nullable
                      as double?,
            preparationTime: freezed == preparationTime
                ? _value.preparationTime
                : preparationTime // ignore: cast_nullable_to_non_nullable
                      as int?,
            operatingHours: freezed == operatingHours
                ? _value.operatingHours
                : operatingHours // ignore: cast_nullable_to_non_nullable
                      as Map<String, DayHours>?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            isOpen: freezed == isOpen
                ? _value.isOpen
                : isOpen // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isBusy: freezed == isBusy
                ? _value.isBusy
                : isBusy // ignore: cast_nullable_to_non_nullable
                      as bool?,
            averageRating: freezed == averageRating
                ? _value.averageRating
                : averageRating // ignore: cast_nullable_to_non_nullable
                      as double?,
            totalRatings: freezed == totalRatings
                ? _value.totalRatings
                : totalRatings // ignore: cast_nullable_to_non_nullable
                      as int?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RestaurantAddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $RestaurantAddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  /// Create a copy of Restaurant
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
abstract class _$$RestaurantImplCopyWith<$Res>
    implements $RestaurantCopyWith<$Res> {
  factory _$$RestaurantImplCopyWith(
    _$RestaurantImpl value,
    $Res Function(_$RestaurantImpl) then,
  ) = __$$RestaurantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    dynamic owner,
    String name,
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
  });

  @override
  $RestaurantAddressCopyWith<$Res>? get address;
  @override
  $GeoPointCopyWith<$Res>? get location;
}

/// @nodoc
class __$$RestaurantImplCopyWithImpl<$Res>
    extends _$RestaurantCopyWithImpl<$Res, _$RestaurantImpl>
    implements _$$RestaurantImplCopyWith<$Res> {
  __$$RestaurantImplCopyWithImpl(
    _$RestaurantImpl _value,
    $Res Function(_$RestaurantImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? owner = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? cuisineType = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? location = freezed,
    Object? logo = freezed,
    Object? coverImage = freezed,
    Object? minimumOrder = freezed,
    Object? deliveryFee = freezed,
    Object? preparationTime = freezed,
    Object? operatingHours = freezed,
    Object? status = freezed,
    Object? isOpen = freezed,
    Object? isBusy = freezed,
    Object? averageRating = freezed,
    Object? totalRatings = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$RestaurantImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        owner: freezed == owner
            ? _value.owner
            : owner // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        cuisineType: freezed == cuisineType
            ? _value._cuisineType
            : cuisineType // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as RestaurantAddress?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as GeoPoint?,
        logo: freezed == logo
            ? _value.logo
            : logo // ignore: cast_nullable_to_non_nullable
                  as String?,
        coverImage: freezed == coverImage
            ? _value.coverImage
            : coverImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        minimumOrder: freezed == minimumOrder
            ? _value.minimumOrder
            : minimumOrder // ignore: cast_nullable_to_non_nullable
                  as double?,
        deliveryFee: freezed == deliveryFee
            ? _value.deliveryFee
            : deliveryFee // ignore: cast_nullable_to_non_nullable
                  as double?,
        preparationTime: freezed == preparationTime
            ? _value.preparationTime
            : preparationTime // ignore: cast_nullable_to_non_nullable
                  as int?,
        operatingHours: freezed == operatingHours
            ? _value._operatingHours
            : operatingHours // ignore: cast_nullable_to_non_nullable
                  as Map<String, DayHours>?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        isOpen: freezed == isOpen
            ? _value.isOpen
            : isOpen // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isBusy: freezed == isBusy
            ? _value.isBusy
            : isBusy // ignore: cast_nullable_to_non_nullable
                  as bool?,
        averageRating: freezed == averageRating
            ? _value.averageRating
            : averageRating // ignore: cast_nullable_to_non_nullable
                  as double?,
        totalRatings: freezed == totalRatings
            ? _value.totalRatings
            : totalRatings // ignore: cast_nullable_to_non_nullable
                  as int?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantImpl implements _Restaurant {
  const _$RestaurantImpl({
    @JsonKey(name: '_id') required this.id,
    this.owner,
    required this.name,
    this.description,
    @JsonKey(name: 'cuisineType') final List<String>? cuisineType,
    this.phone,
    this.email,
    this.address,
    this.location,
    this.logo,
    @JsonKey(name: 'coverImage') this.coverImage,
    @JsonKey(name: 'minimumOrder') this.minimumOrder,
    @JsonKey(name: 'deliveryFee') this.deliveryFee,
    @JsonKey(name: 'preparationTime') this.preparationTime,
    @JsonKey(name: 'operatingHours')
    final Map<String, DayHours>? operatingHours,
    this.status,
    @JsonKey(name: 'isOpen') this.isOpen,
    @JsonKey(name: 'isBusy') this.isBusy,
    @JsonKey(name: 'averageRating') this.averageRating,
    @JsonKey(name: 'totalRatings') this.totalRatings,
    @JsonKey(name: 'createdAt') this.createdAt,
    @JsonKey(name: 'updatedAt') this.updatedAt,
  }) : _cuisineType = cuisineType,
       _operatingHours = operatingHours;

  factory _$RestaurantImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final dynamic owner;
  @override
  final String name;
  @override
  final String? description;
  final List<String>? _cuisineType;
  @override
  @JsonKey(name: 'cuisineType')
  List<String>? get cuisineType {
    final value = _cuisineType;
    if (value == null) return null;
    if (_cuisineType is EqualUnmodifiableListView) return _cuisineType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? phone;
  @override
  final String? email;
  @override
  final RestaurantAddress? address;
  @override
  final GeoPoint? location;
  @override
  final String? logo;
  @override
  @JsonKey(name: 'coverImage')
  final String? coverImage;
  @override
  @JsonKey(name: 'minimumOrder')
  final double? minimumOrder;
  @override
  @JsonKey(name: 'deliveryFee')
  final double? deliveryFee;
  @override
  @JsonKey(name: 'preparationTime')
  final int? preparationTime;
  final Map<String, DayHours>? _operatingHours;
  @override
  @JsonKey(name: 'operatingHours')
  Map<String, DayHours>? get operatingHours {
    final value = _operatingHours;
    if (value == null) return null;
    if (_operatingHours is EqualUnmodifiableMapView) return _operatingHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? status;
  @override
  @JsonKey(name: 'isOpen')
  final bool? isOpen;
  @override
  @JsonKey(name: 'isBusy')
  final bool? isBusy;
  @override
  @JsonKey(name: 'averageRating')
  final double? averageRating;
  @override
  @JsonKey(name: 'totalRatings')
  final int? totalRatings;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Restaurant(id: $id, owner: $owner, name: $name, description: $description, cuisineType: $cuisineType, phone: $phone, email: $email, address: $address, location: $location, logo: $logo, coverImage: $coverImage, minimumOrder: $minimumOrder, deliveryFee: $deliveryFee, preparationTime: $preparationTime, operatingHours: $operatingHours, status: $status, isOpen: $isOpen, isBusy: $isBusy, averageRating: $averageRating, totalRatings: $totalRatings, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.owner, owner) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._cuisineType,
              _cuisineType,
            ) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.minimumOrder, minimumOrder) ||
                other.minimumOrder == minimumOrder) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.preparationTime, preparationTime) ||
                other.preparationTime == preparationTime) &&
            const DeepCollectionEquality().equals(
              other._operatingHours,
              _operatingHours,
            ) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.totalRatings, totalRatings) ||
                other.totalRatings == totalRatings) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    const DeepCollectionEquality().hash(owner),
    name,
    description,
    const DeepCollectionEquality().hash(_cuisineType),
    phone,
    email,
    address,
    location,
    logo,
    coverImage,
    minimumOrder,
    deliveryFee,
    preparationTime,
    const DeepCollectionEquality().hash(_operatingHours),
    status,
    isOpen,
    isBusy,
    averageRating,
    totalRatings,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      __$$RestaurantImplCopyWithImpl<_$RestaurantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantImplToJson(this);
  }
}

abstract class _Restaurant implements Restaurant {
  const factory _Restaurant({
    @JsonKey(name: '_id') required final String id,
    final dynamic owner,
    required final String name,
    final String? description,
    @JsonKey(name: 'cuisineType') final List<String>? cuisineType,
    final String? phone,
    final String? email,
    final RestaurantAddress? address,
    final GeoPoint? location,
    final String? logo,
    @JsonKey(name: 'coverImage') final String? coverImage,
    @JsonKey(name: 'minimumOrder') final double? minimumOrder,
    @JsonKey(name: 'deliveryFee') final double? deliveryFee,
    @JsonKey(name: 'preparationTime') final int? preparationTime,
    @JsonKey(name: 'operatingHours')
    final Map<String, DayHours>? operatingHours,
    final String? status,
    @JsonKey(name: 'isOpen') final bool? isOpen,
    @JsonKey(name: 'isBusy') final bool? isBusy,
    @JsonKey(name: 'averageRating') final double? averageRating,
    @JsonKey(name: 'totalRatings') final int? totalRatings,
    @JsonKey(name: 'createdAt') final DateTime? createdAt,
    @JsonKey(name: 'updatedAt') final DateTime? updatedAt,
  }) = _$RestaurantImpl;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$RestaurantImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  dynamic get owner;
  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(name: 'cuisineType')
  List<String>? get cuisineType;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  RestaurantAddress? get address;
  @override
  GeoPoint? get location;
  @override
  String? get logo;
  @override
  @JsonKey(name: 'coverImage')
  String? get coverImage;
  @override
  @JsonKey(name: 'minimumOrder')
  double? get minimumOrder;
  @override
  @JsonKey(name: 'deliveryFee')
  double? get deliveryFee;
  @override
  @JsonKey(name: 'preparationTime')
  int? get preparationTime;
  @override
  @JsonKey(name: 'operatingHours')
  Map<String, DayHours>? get operatingHours;
  @override
  String? get status;
  @override
  @JsonKey(name: 'isOpen')
  bool? get isOpen;
  @override
  @JsonKey(name: 'isBusy')
  bool? get isBusy;
  @override
  @JsonKey(name: 'averageRating')
  double? get averageRating;
  @override
  @JsonKey(name: 'totalRatings')
  int? get totalRatings;
  @override
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) {
  return _MenuItem.fromJson(json);
}

/// @nodoc
mixin _$MenuItem {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'isAvailable')
  bool get isAvailable => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'sortOrder')
  int? get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this MenuItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuItemCopyWith<MenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemCopyWith<$Res> {
  factory $MenuItemCopyWith(MenuItem value, $Res Function(MenuItem) then) =
      _$MenuItemCopyWithImpl<$Res, MenuItem>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String name,
    String? description,
    double price,
    @JsonKey(name: 'isAvailable') bool isAvailable,
    String? image,
    @JsonKey(name: 'sortOrder') int? sortOrder,
  });
}

/// @nodoc
class _$MenuItemCopyWithImpl<$Res, $Val extends MenuItem>
    implements $MenuItemCopyWith<$Res> {
  _$MenuItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? price = null,
    Object? isAvailable = null,
    Object? image = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            sortOrder: freezed == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MenuItemImplCopyWith<$Res>
    implements $MenuItemCopyWith<$Res> {
  factory _$$MenuItemImplCopyWith(
    _$MenuItemImpl value,
    $Res Function(_$MenuItemImpl) then,
  ) = __$$MenuItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String name,
    String? description,
    double price,
    @JsonKey(name: 'isAvailable') bool isAvailable,
    String? image,
    @JsonKey(name: 'sortOrder') int? sortOrder,
  });
}

/// @nodoc
class __$$MenuItemImplCopyWithImpl<$Res>
    extends _$MenuItemCopyWithImpl<$Res, _$MenuItemImpl>
    implements _$$MenuItemImplCopyWith<$Res> {
  __$$MenuItemImplCopyWithImpl(
    _$MenuItemImpl _value,
    $Res Function(_$MenuItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? price = null,
    Object? isAvailable = null,
    Object? image = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(
      _$MenuItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        sortOrder: freezed == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuItemImpl implements _MenuItem {
  const _$MenuItemImpl({
    @JsonKey(name: '_id') required this.id,
    required this.name,
    this.description,
    required this.price,
    @JsonKey(name: 'isAvailable') this.isAvailable = true,
    this.image,
    @JsonKey(name: 'sortOrder') this.sortOrder,
  });

  factory _$MenuItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final double price;
  @override
  @JsonKey(name: 'isAvailable')
  final bool isAvailable;
  @override
  final String? image;
  @override
  @JsonKey(name: 'sortOrder')
  final int? sortOrder;

  @override
  String toString() {
    return 'MenuItem(id: $id, name: $name, description: $description, price: $price, isAvailable: $isAvailable, image: $image, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    price,
    isAvailable,
    image,
    sortOrder,
  );

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemImplCopyWith<_$MenuItemImpl> get copyWith =>
      __$$MenuItemImplCopyWithImpl<_$MenuItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemImplToJson(this);
  }
}

abstract class _MenuItem implements MenuItem {
  const factory _MenuItem({
    @JsonKey(name: '_id') required final String id,
    required final String name,
    final String? description,
    required final double price,
    @JsonKey(name: 'isAvailable') final bool isAvailable,
    final String? image,
    @JsonKey(name: 'sortOrder') final int? sortOrder,
  }) = _$MenuItemImpl;

  factory _MenuItem.fromJson(Map<String, dynamic> json) =
      _$MenuItemImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  double get price;
  @override
  @JsonKey(name: 'isAvailable')
  bool get isAvailable;
  @override
  String? get image;
  @override
  @JsonKey(name: 'sortOrder')
  int? get sortOrder;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuItemImplCopyWith<_$MenuItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuCategory _$MenuCategoryFromJson(Map<String, dynamic> json) {
  return _MenuCategory.fromJson(json);
}

/// @nodoc
mixin _$MenuCategory {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'sortOrder')
  int? get sortOrder => throw _privateConstructorUsedError;
  List<MenuItem> get items => throw _privateConstructorUsedError;

  /// Serializes this MenuCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuCategoryCopyWith<MenuCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCategoryCopyWith<$Res> {
  factory $MenuCategoryCopyWith(
    MenuCategory value,
    $Res Function(MenuCategory) then,
  ) = _$MenuCategoryCopyWithImpl<$Res, MenuCategory>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String name,
    String? description,
    @JsonKey(name: 'sortOrder') int? sortOrder,
    List<MenuItem> items,
  });
}

/// @nodoc
class _$MenuCategoryCopyWithImpl<$Res, $Val extends MenuCategory>
    implements $MenuCategoryCopyWith<$Res> {
  _$MenuCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? sortOrder = freezed,
    Object? items = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            sortOrder: freezed == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int?,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<MenuItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MenuCategoryImplCopyWith<$Res>
    implements $MenuCategoryCopyWith<$Res> {
  factory _$$MenuCategoryImplCopyWith(
    _$MenuCategoryImpl value,
    $Res Function(_$MenuCategoryImpl) then,
  ) = __$$MenuCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String name,
    String? description,
    @JsonKey(name: 'sortOrder') int? sortOrder,
    List<MenuItem> items,
  });
}

/// @nodoc
class __$$MenuCategoryImplCopyWithImpl<$Res>
    extends _$MenuCategoryCopyWithImpl<$Res, _$MenuCategoryImpl>
    implements _$$MenuCategoryImplCopyWith<$Res> {
  __$$MenuCategoryImplCopyWithImpl(
    _$MenuCategoryImpl _value,
    $Res Function(_$MenuCategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MenuCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? sortOrder = freezed,
    Object? items = null,
  }) {
    return _then(
      _$MenuCategoryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        sortOrder: freezed == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int?,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<MenuItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuCategoryImpl implements _MenuCategory {
  const _$MenuCategoryImpl({
    @JsonKey(name: '_id') required this.id,
    required this.name,
    this.description,
    @JsonKey(name: 'sortOrder') this.sortOrder,
    required final List<MenuItem> items,
  }) : _items = items;

  factory _$MenuCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuCategoryImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey(name: 'sortOrder')
  final int? sortOrder;
  final List<MenuItem> _items;
  @override
  List<MenuItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'MenuCategory(id: $id, name: $name, description: $description, sortOrder: $sortOrder, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    sortOrder,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of MenuCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuCategoryImplCopyWith<_$MenuCategoryImpl> get copyWith =>
      __$$MenuCategoryImplCopyWithImpl<_$MenuCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuCategoryImplToJson(this);
  }
}

abstract class _MenuCategory implements MenuCategory {
  const factory _MenuCategory({
    @JsonKey(name: '_id') required final String id,
    required final String name,
    final String? description,
    @JsonKey(name: 'sortOrder') final int? sortOrder,
    required final List<MenuItem> items,
  }) = _$MenuCategoryImpl;

  factory _MenuCategory.fromJson(Map<String, dynamic> json) =
      _$MenuCategoryImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(name: 'sortOrder')
  int? get sortOrder;
  @override
  List<MenuItem> get items;

  /// Create a copy of MenuCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuCategoryImplCopyWith<_$MenuCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RestaurantDetail _$RestaurantDetailFromJson(Map<String, dynamic> json) {
  return _RestaurantDetail.fromJson(json);
}

/// @nodoc
mixin _$RestaurantDetail {
  Restaurant get restaurant => throw _privateConstructorUsedError;
  List<MenuCategory> get menu => throw _privateConstructorUsedError;

  /// Serializes this RestaurantDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantDetailCopyWith<RestaurantDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantDetailCopyWith<$Res> {
  factory $RestaurantDetailCopyWith(
    RestaurantDetail value,
    $Res Function(RestaurantDetail) then,
  ) = _$RestaurantDetailCopyWithImpl<$Res, RestaurantDetail>;
  @useResult
  $Res call({Restaurant restaurant, List<MenuCategory> menu});

  $RestaurantCopyWith<$Res> get restaurant;
}

/// @nodoc
class _$RestaurantDetailCopyWithImpl<$Res, $Val extends RestaurantDetail>
    implements $RestaurantDetailCopyWith<$Res> {
  _$RestaurantDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? restaurant = null, Object? menu = null}) {
    return _then(
      _value.copyWith(
            restaurant: null == restaurant
                ? _value.restaurant
                : restaurant // ignore: cast_nullable_to_non_nullable
                      as Restaurant,
            menu: null == menu
                ? _value.menu
                : menu // ignore: cast_nullable_to_non_nullable
                      as List<MenuCategory>,
          )
          as $Val,
    );
  }

  /// Create a copy of RestaurantDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RestaurantCopyWith<$Res> get restaurant {
    return $RestaurantCopyWith<$Res>(_value.restaurant, (value) {
      return _then(_value.copyWith(restaurant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestaurantDetailImplCopyWith<$Res>
    implements $RestaurantDetailCopyWith<$Res> {
  factory _$$RestaurantDetailImplCopyWith(
    _$RestaurantDetailImpl value,
    $Res Function(_$RestaurantDetailImpl) then,
  ) = __$$RestaurantDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Restaurant restaurant, List<MenuCategory> menu});

  @override
  $RestaurantCopyWith<$Res> get restaurant;
}

/// @nodoc
class __$$RestaurantDetailImplCopyWithImpl<$Res>
    extends _$RestaurantDetailCopyWithImpl<$Res, _$RestaurantDetailImpl>
    implements _$$RestaurantDetailImplCopyWith<$Res> {
  __$$RestaurantDetailImplCopyWithImpl(
    _$RestaurantDetailImpl _value,
    $Res Function(_$RestaurantDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RestaurantDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? restaurant = null, Object? menu = null}) {
    return _then(
      _$RestaurantDetailImpl(
        restaurant: null == restaurant
            ? _value.restaurant
            : restaurant // ignore: cast_nullable_to_non_nullable
                  as Restaurant,
        menu: null == menu
            ? _value._menu
            : menu // ignore: cast_nullable_to_non_nullable
                  as List<MenuCategory>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantDetailImpl implements _RestaurantDetail {
  const _$RestaurantDetailImpl({
    required this.restaurant,
    required final List<MenuCategory> menu,
  }) : _menu = menu;

  factory _$RestaurantDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantDetailImplFromJson(json);

  @override
  final Restaurant restaurant;
  final List<MenuCategory> _menu;
  @override
  List<MenuCategory> get menu {
    if (_menu is EqualUnmodifiableListView) return _menu;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menu);
  }

  @override
  String toString() {
    return 'RestaurantDetail(restaurant: $restaurant, menu: $menu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantDetailImpl &&
            (identical(other.restaurant, restaurant) ||
                other.restaurant == restaurant) &&
            const DeepCollectionEquality().equals(other._menu, _menu));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    restaurant,
    const DeepCollectionEquality().hash(_menu),
  );

  /// Create a copy of RestaurantDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantDetailImplCopyWith<_$RestaurantDetailImpl> get copyWith =>
      __$$RestaurantDetailImplCopyWithImpl<_$RestaurantDetailImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantDetailImplToJson(this);
  }
}

abstract class _RestaurantDetail implements RestaurantDetail {
  const factory _RestaurantDetail({
    required final Restaurant restaurant,
    required final List<MenuCategory> menu,
  }) = _$RestaurantDetailImpl;

  factory _RestaurantDetail.fromJson(Map<String, dynamic> json) =
      _$RestaurantDetailImpl.fromJson;

  @override
  Restaurant get restaurant;
  @override
  List<MenuCategory> get menu;

  /// Create a copy of RestaurantDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantDetailImplCopyWith<_$RestaurantDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItemInput _$OrderItemInputFromJson(Map<String, dynamic> json) {
  return _OrderItemInput.fromJson(json);
}

/// @nodoc
mixin _$OrderItemInput {
  @JsonKey(name: 'menuItemId')
  String get menuItemId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this OrderItemInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemInputCopyWith<OrderItemInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemInputCopyWith<$Res> {
  factory $OrderItemInputCopyWith(
    OrderItemInput value,
    $Res Function(OrderItemInput) then,
  ) = _$OrderItemInputCopyWithImpl<$Res, OrderItemInput>;
  @useResult
  $Res call({@JsonKey(name: 'menuItemId') String menuItemId, int quantity});
}

/// @nodoc
class _$OrderItemInputCopyWithImpl<$Res, $Val extends OrderItemInput>
    implements $OrderItemInputCopyWith<$Res> {
  _$OrderItemInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? menuItemId = null, Object? quantity = null}) {
    return _then(
      _value.copyWith(
            menuItemId: null == menuItemId
                ? _value.menuItemId
                : menuItemId // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderItemInputImplCopyWith<$Res>
    implements $OrderItemInputCopyWith<$Res> {
  factory _$$OrderItemInputImplCopyWith(
    _$OrderItemInputImpl value,
    $Res Function(_$OrderItemInputImpl) then,
  ) = __$$OrderItemInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'menuItemId') String menuItemId, int quantity});
}

/// @nodoc
class __$$OrderItemInputImplCopyWithImpl<$Res>
    extends _$OrderItemInputCopyWithImpl<$Res, _$OrderItemInputImpl>
    implements _$$OrderItemInputImplCopyWith<$Res> {
  __$$OrderItemInputImplCopyWithImpl(
    _$OrderItemInputImpl _value,
    $Res Function(_$OrderItemInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderItemInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? menuItemId = null, Object? quantity = null}) {
    return _then(
      _$OrderItemInputImpl(
        menuItemId: null == menuItemId
            ? _value.menuItemId
            : menuItemId // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemInputImpl implements _OrderItemInput {
  const _$OrderItemInputImpl({
    @JsonKey(name: 'menuItemId') required this.menuItemId,
    required this.quantity,
  });

  factory _$OrderItemInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemInputImplFromJson(json);

  @override
  @JsonKey(name: 'menuItemId')
  final String menuItemId;
  @override
  final int quantity;

  @override
  String toString() {
    return 'OrderItemInput(menuItemId: $menuItemId, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemInputImpl &&
            (identical(other.menuItemId, menuItemId) ||
                other.menuItemId == menuItemId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, menuItemId, quantity);

  /// Create a copy of OrderItemInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemInputImplCopyWith<_$OrderItemInputImpl> get copyWith =>
      __$$OrderItemInputImplCopyWithImpl<_$OrderItemInputImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemInputImplToJson(this);
  }
}

abstract class _OrderItemInput implements OrderItemInput {
  const factory _OrderItemInput({
    @JsonKey(name: 'menuItemId') required final String menuItemId,
    required final int quantity,
  }) = _$OrderItemInputImpl;

  factory _OrderItemInput.fromJson(Map<String, dynamic> json) =
      _$OrderItemInputImpl.fromJson;

  @override
  @JsonKey(name: 'menuItemId')
  String get menuItemId;
  @override
  int get quantity;

  /// Create a copy of OrderItemInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemInputImplCopyWith<_$OrderItemInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlaceOrderRequest _$PlaceOrderRequestFromJson(Map<String, dynamic> json) {
  return _PlaceOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$PlaceOrderRequest {
  @JsonKey(name: 'restaurantId')
  String get restaurantId => throw _privateConstructorUsedError;
  List<OrderItemInput> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryAddress')
  DeliveryAddressDetail get deliveryAddress =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentMethod')
  String get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'stripePaymentIntentId', includeIfNull: false)
  String? get stripePaymentIntentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'specialInstructions', includeIfNull: false)
  String? get specialInstructions => throw _privateConstructorUsedError;

  /// Serializes this PlaceOrderRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceOrderRequestCopyWith<PlaceOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceOrderRequestCopyWith<$Res> {
  factory $PlaceOrderRequestCopyWith(
    PlaceOrderRequest value,
    $Res Function(PlaceOrderRequest) then,
  ) = _$PlaceOrderRequestCopyWithImpl<$Res, PlaceOrderRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'restaurantId') String restaurantId,
    List<OrderItemInput> items,
    @JsonKey(name: 'deliveryAddress') DeliveryAddressDetail deliveryAddress,
    @JsonKey(name: 'paymentMethod') String paymentMethod,
    @JsonKey(name: 'stripePaymentIntentId', includeIfNull: false)
    String? stripePaymentIntentId,
    @JsonKey(name: 'specialInstructions', includeIfNull: false)
    String? specialInstructions,
  });

  $DeliveryAddressDetailCopyWith<$Res> get deliveryAddress;
}

/// @nodoc
class _$PlaceOrderRequestCopyWithImpl<$Res, $Val extends PlaceOrderRequest>
    implements $PlaceOrderRequestCopyWith<$Res> {
  _$PlaceOrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantId = null,
    Object? items = null,
    Object? deliveryAddress = null,
    Object? paymentMethod = null,
    Object? stripePaymentIntentId = freezed,
    Object? specialInstructions = freezed,
  }) {
    return _then(
      _value.copyWith(
            restaurantId: null == restaurantId
                ? _value.restaurantId
                : restaurantId // ignore: cast_nullable_to_non_nullable
                      as String,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<OrderItemInput>,
            deliveryAddress: null == deliveryAddress
                ? _value.deliveryAddress
                : deliveryAddress // ignore: cast_nullable_to_non_nullable
                      as DeliveryAddressDetail,
            paymentMethod: null == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                      as String,
            stripePaymentIntentId: freezed == stripePaymentIntentId
                ? _value.stripePaymentIntentId
                : stripePaymentIntentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            specialInstructions: freezed == specialInstructions
                ? _value.specialInstructions
                : specialInstructions // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of PlaceOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryAddressDetailCopyWith<$Res> get deliveryAddress {
    return $DeliveryAddressDetailCopyWith<$Res>(_value.deliveryAddress, (
      value,
    ) {
      return _then(_value.copyWith(deliveryAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaceOrderRequestImplCopyWith<$Res>
    implements $PlaceOrderRequestCopyWith<$Res> {
  factory _$$PlaceOrderRequestImplCopyWith(
    _$PlaceOrderRequestImpl value,
    $Res Function(_$PlaceOrderRequestImpl) then,
  ) = __$$PlaceOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'restaurantId') String restaurantId,
    List<OrderItemInput> items,
    @JsonKey(name: 'deliveryAddress') DeliveryAddressDetail deliveryAddress,
    @JsonKey(name: 'paymentMethod') String paymentMethod,
    @JsonKey(name: 'stripePaymentIntentId', includeIfNull: false)
    String? stripePaymentIntentId,
    @JsonKey(name: 'specialInstructions', includeIfNull: false)
    String? specialInstructions,
  });

  @override
  $DeliveryAddressDetailCopyWith<$Res> get deliveryAddress;
}

/// @nodoc
class __$$PlaceOrderRequestImplCopyWithImpl<$Res>
    extends _$PlaceOrderRequestCopyWithImpl<$Res, _$PlaceOrderRequestImpl>
    implements _$$PlaceOrderRequestImplCopyWith<$Res> {
  __$$PlaceOrderRequestImplCopyWithImpl(
    _$PlaceOrderRequestImpl _value,
    $Res Function(_$PlaceOrderRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlaceOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantId = null,
    Object? items = null,
    Object? deliveryAddress = null,
    Object? paymentMethod = null,
    Object? stripePaymentIntentId = freezed,
    Object? specialInstructions = freezed,
  }) {
    return _then(
      _$PlaceOrderRequestImpl(
        restaurantId: null == restaurantId
            ? _value.restaurantId
            : restaurantId // ignore: cast_nullable_to_non_nullable
                  as String,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<OrderItemInput>,
        deliveryAddress: null == deliveryAddress
            ? _value.deliveryAddress
            : deliveryAddress // ignore: cast_nullable_to_non_nullable
                  as DeliveryAddressDetail,
        paymentMethod: null == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as String,
        stripePaymentIntentId: freezed == stripePaymentIntentId
            ? _value.stripePaymentIntentId
            : stripePaymentIntentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        specialInstructions: freezed == specialInstructions
            ? _value.specialInstructions
            : specialInstructions // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceOrderRequestImpl implements _PlaceOrderRequest {
  const _$PlaceOrderRequestImpl({
    @JsonKey(name: 'restaurantId') required this.restaurantId,
    required final List<OrderItemInput> items,
    @JsonKey(name: 'deliveryAddress') required this.deliveryAddress,
    @JsonKey(name: 'paymentMethod') required this.paymentMethod,
    @JsonKey(name: 'stripePaymentIntentId', includeIfNull: false)
    this.stripePaymentIntentId,
    @JsonKey(name: 'specialInstructions', includeIfNull: false)
    this.specialInstructions,
  }) : _items = items;

  factory _$PlaceOrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceOrderRequestImplFromJson(json);

  @override
  @JsonKey(name: 'restaurantId')
  final String restaurantId;
  final List<OrderItemInput> _items;
  @override
  List<OrderItemInput> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'deliveryAddress')
  final DeliveryAddressDetail deliveryAddress;
  @override
  @JsonKey(name: 'paymentMethod')
  final String paymentMethod;
  @override
  @JsonKey(name: 'stripePaymentIntentId', includeIfNull: false)
  final String? stripePaymentIntentId;
  @override
  @JsonKey(name: 'specialInstructions', includeIfNull: false)
  final String? specialInstructions;

  @override
  String toString() {
    return 'PlaceOrderRequest(restaurantId: $restaurantId, items: $items, deliveryAddress: $deliveryAddress, paymentMethod: $paymentMethod, stripePaymentIntentId: $stripePaymentIntentId, specialInstructions: $specialInstructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceOrderRequestImpl &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.stripePaymentIntentId, stripePaymentIntentId) ||
                other.stripePaymentIntentId == stripePaymentIntentId) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    restaurantId,
    const DeepCollectionEquality().hash(_items),
    deliveryAddress,
    paymentMethod,
    stripePaymentIntentId,
    specialInstructions,
  );

  /// Create a copy of PlaceOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceOrderRequestImplCopyWith<_$PlaceOrderRequestImpl> get copyWith =>
      __$$PlaceOrderRequestImplCopyWithImpl<_$PlaceOrderRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceOrderRequestImplToJson(this);
  }
}

abstract class _PlaceOrderRequest implements PlaceOrderRequest {
  const factory _PlaceOrderRequest({
    @JsonKey(name: 'restaurantId') required final String restaurantId,
    required final List<OrderItemInput> items,
    @JsonKey(name: 'deliveryAddress')
    required final DeliveryAddressDetail deliveryAddress,
    @JsonKey(name: 'paymentMethod') required final String paymentMethod,
    @JsonKey(name: 'stripePaymentIntentId', includeIfNull: false)
    final String? stripePaymentIntentId,
    @JsonKey(name: 'specialInstructions', includeIfNull: false)
    final String? specialInstructions,
  }) = _$PlaceOrderRequestImpl;

  factory _PlaceOrderRequest.fromJson(Map<String, dynamic> json) =
      _$PlaceOrderRequestImpl.fromJson;

  @override
  @JsonKey(name: 'restaurantId')
  String get restaurantId;
  @override
  List<OrderItemInput> get items;
  @override
  @JsonKey(name: 'deliveryAddress')
  DeliveryAddressDetail get deliveryAddress;
  @override
  @JsonKey(name: 'paymentMethod')
  String get paymentMethod;
  @override
  @JsonKey(name: 'stripePaymentIntentId', includeIfNull: false)
  String? get stripePaymentIntentId;
  @override
  @JsonKey(name: 'specialInstructions', includeIfNull: false)
  String? get specialInstructions;

  /// Create a copy of PlaceOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceOrderRequestImplCopyWith<_$PlaceOrderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
mixin _$OrderItem {
  @JsonKey(name: 'menuItem')
  dynamic get menuItemId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemTotal')
  double? get itemTotal => throw _privateConstructorUsedError;

  /// Serializes this OrderItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res, OrderItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'menuItem') dynamic menuItemId,
    String? name,
    double? price,
    int? quantity,
    @JsonKey(name: 'itemTotal') double? itemTotal,
  });
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res, $Val extends OrderItem>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuItemId = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? itemTotal = freezed,
  }) {
    return _then(
      _value.copyWith(
            menuItemId: freezed == menuItemId
                ? _value.menuItemId
                : menuItemId // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            price: freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double?,
            quantity: freezed == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int?,
            itemTotal: freezed == itemTotal
                ? _value.itemTotal
                : itemTotal // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderItemImplCopyWith<$Res>
    implements $OrderItemCopyWith<$Res> {
  factory _$$OrderItemImplCopyWith(
    _$OrderItemImpl value,
    $Res Function(_$OrderItemImpl) then,
  ) = __$$OrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'menuItem') dynamic menuItemId,
    String? name,
    double? price,
    int? quantity,
    @JsonKey(name: 'itemTotal') double? itemTotal,
  });
}

/// @nodoc
class __$$OrderItemImplCopyWithImpl<$Res>
    extends _$OrderItemCopyWithImpl<$Res, _$OrderItemImpl>
    implements _$$OrderItemImplCopyWith<$Res> {
  __$$OrderItemImplCopyWithImpl(
    _$OrderItemImpl _value,
    $Res Function(_$OrderItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuItemId = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? itemTotal = freezed,
  }) {
    return _then(
      _$OrderItemImpl(
        menuItemId: freezed == menuItemId
            ? _value.menuItemId
            : menuItemId // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        price: freezed == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double?,
        quantity: freezed == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int?,
        itemTotal: freezed == itemTotal
            ? _value.itemTotal
            : itemTotal // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemImpl implements _OrderItem {
  const _$OrderItemImpl({
    @JsonKey(name: 'menuItem') this.menuItemId,
    this.name,
    this.price,
    this.quantity,
    @JsonKey(name: 'itemTotal') this.itemTotal,
  });

  factory _$OrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemImplFromJson(json);

  @override
  @JsonKey(name: 'menuItem')
  final dynamic menuItemId;
  @override
  final String? name;
  @override
  final double? price;
  @override
  final int? quantity;
  @override
  @JsonKey(name: 'itemTotal')
  final double? itemTotal;

  @override
  String toString() {
    return 'OrderItem(menuItemId: $menuItemId, name: $name, price: $price, quantity: $quantity, itemTotal: $itemTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemImpl &&
            const DeepCollectionEquality().equals(
              other.menuItemId,
              menuItemId,
            ) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.itemTotal, itemTotal) ||
                other.itemTotal == itemTotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(menuItemId),
    name,
    price,
    quantity,
    itemTotal,
  );

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      __$$OrderItemImplCopyWithImpl<_$OrderItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemImplToJson(this);
  }
}

abstract class _OrderItem implements OrderItem {
  const factory _OrderItem({
    @JsonKey(name: 'menuItem') final dynamic menuItemId,
    final String? name,
    final double? price,
    final int? quantity,
    @JsonKey(name: 'itemTotal') final double? itemTotal,
  }) = _$OrderItemImpl;

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$OrderItemImpl.fromJson;

  @override
  @JsonKey(name: 'menuItem')
  dynamic get menuItemId;
  @override
  String? get name;
  @override
  double? get price;
  @override
  int? get quantity;
  @override
  @JsonKey(name: 'itemTotal')
  double? get itemTotal;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderStatusHistory _$OrderStatusHistoryFromJson(Map<String, dynamic> json) {
  return _OrderStatusHistory.fromJson(json);
}

/// @nodoc
mixin _$OrderStatusHistory {
  String get status => throw _privateConstructorUsedError;
  DateTime? get timestamp => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this OrderStatusHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderStatusHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderStatusHistoryCopyWith<OrderStatusHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusHistoryCopyWith<$Res> {
  factory $OrderStatusHistoryCopyWith(
    OrderStatusHistory value,
    $Res Function(OrderStatusHistory) then,
  ) = _$OrderStatusHistoryCopyWithImpl<$Res, OrderStatusHistory>;
  @useResult
  $Res call({String status, DateTime? timestamp, String? note});
}

/// @nodoc
class _$OrderStatusHistoryCopyWithImpl<$Res, $Val extends OrderStatusHistory>
    implements $OrderStatusHistoryCopyWith<$Res> {
  _$OrderStatusHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderStatusHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? timestamp = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: freezed == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderStatusHistoryImplCopyWith<$Res>
    implements $OrderStatusHistoryCopyWith<$Res> {
  factory _$$OrderStatusHistoryImplCopyWith(
    _$OrderStatusHistoryImpl value,
    $Res Function(_$OrderStatusHistoryImpl) then,
  ) = __$$OrderStatusHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, DateTime? timestamp, String? note});
}

/// @nodoc
class __$$OrderStatusHistoryImplCopyWithImpl<$Res>
    extends _$OrderStatusHistoryCopyWithImpl<$Res, _$OrderStatusHistoryImpl>
    implements _$$OrderStatusHistoryImplCopyWith<$Res> {
  __$$OrderStatusHistoryImplCopyWithImpl(
    _$OrderStatusHistoryImpl _value,
    $Res Function(_$OrderStatusHistoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderStatusHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? timestamp = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _$OrderStatusHistoryImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: freezed == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderStatusHistoryImpl implements _OrderStatusHistory {
  const _$OrderStatusHistoryImpl({
    required this.status,
    this.timestamp,
    this.note,
  });

  factory _$OrderStatusHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderStatusHistoryImplFromJson(json);

  @override
  final String status;
  @override
  final DateTime? timestamp;
  @override
  final String? note;

  @override
  String toString() {
    return 'OrderStatusHistory(status: $status, timestamp: $timestamp, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStatusHistoryImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, timestamp, note);

  /// Create a copy of OrderStatusHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStatusHistoryImplCopyWith<_$OrderStatusHistoryImpl> get copyWith =>
      __$$OrderStatusHistoryImplCopyWithImpl<_$OrderStatusHistoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderStatusHistoryImplToJson(this);
  }
}

abstract class _OrderStatusHistory implements OrderStatusHistory {
  const factory _OrderStatusHistory({
    required final String status,
    final DateTime? timestamp,
    final String? note,
  }) = _$OrderStatusHistoryImpl;

  factory _OrderStatusHistory.fromJson(Map<String, dynamic> json) =
      _$OrderStatusHistoryImpl.fromJson;

  @override
  String get status;
  @override
  DateTime? get timestamp;
  @override
  String? get note;

  /// Create a copy of OrderStatusHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderStatusHistoryImplCopyWith<_$OrderStatusHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderNumber')
  String get orderNumber => throw _privateConstructorUsedError;
  dynamic get customer => throw _privateConstructorUsedError;
  dynamic get restaurant => throw _privateConstructorUsedError;
  List<OrderItem> get items => throw _privateConstructorUsedError;
  double? get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryFee')
  double? get deliveryFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'platformFee')
  double? get platformFee => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentMethod')
  String? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentStatus')
  String? get paymentStatus => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusHistory')
  List<OrderStatusHistory>? get statusHistory =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryAddress')
  DeliveryAddressInfo? get deliveryAddress =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'specialInstructions')
  String? get specialInstructions => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancellationReason')
  String? get cancellationReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'orderNumber') String orderNumber,
    dynamic customer,
    dynamic restaurant,
    List<OrderItem> items,
    double? subtotal,
    @JsonKey(name: 'deliveryFee') double? deliveryFee,
    @JsonKey(name: 'platformFee') double? platformFee,
    double total,
    @JsonKey(name: 'paymentMethod') String? paymentMethod,
    @JsonKey(name: 'paymentStatus') String? paymentStatus,
    String status,
    @JsonKey(name: 'statusHistory') List<OrderStatusHistory>? statusHistory,
    @JsonKey(name: 'deliveryAddress') DeliveryAddressInfo? deliveryAddress,
    @JsonKey(name: 'specialInstructions') String? specialInstructions,
    @JsonKey(name: 'cancellationReason') String? cancellationReason,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
  });

  $DeliveryAddressInfoCopyWith<$Res>? get deliveryAddress;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? customer = freezed,
    Object? restaurant = freezed,
    Object? items = null,
    Object? subtotal = freezed,
    Object? deliveryFee = freezed,
    Object? platformFee = freezed,
    Object? total = null,
    Object? paymentMethod = freezed,
    Object? paymentStatus = freezed,
    Object? status = null,
    Object? statusHistory = freezed,
    Object? deliveryAddress = freezed,
    Object? specialInstructions = freezed,
    Object? cancellationReason = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            orderNumber: null == orderNumber
                ? _value.orderNumber
                : orderNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            customer: freezed == customer
                ? _value.customer
                : customer // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            restaurant: freezed == restaurant
                ? _value.restaurant
                : restaurant // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<OrderItem>,
            subtotal: freezed == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                      as double?,
            deliveryFee: freezed == deliveryFee
                ? _value.deliveryFee
                : deliveryFee // ignore: cast_nullable_to_non_nullable
                      as double?,
            platformFee: freezed == platformFee
                ? _value.platformFee
                : platformFee // ignore: cast_nullable_to_non_nullable
                      as double?,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
            paymentMethod: freezed == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                      as String?,
            paymentStatus: freezed == paymentStatus
                ? _value.paymentStatus
                : paymentStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            statusHistory: freezed == statusHistory
                ? _value.statusHistory
                : statusHistory // ignore: cast_nullable_to_non_nullable
                      as List<OrderStatusHistory>?,
            deliveryAddress: freezed == deliveryAddress
                ? _value.deliveryAddress
                : deliveryAddress // ignore: cast_nullable_to_non_nullable
                      as DeliveryAddressInfo?,
            specialInstructions: freezed == specialInstructions
                ? _value.specialInstructions
                : specialInstructions // ignore: cast_nullable_to_non_nullable
                      as String?,
            cancellationReason: freezed == cancellationReason
                ? _value.cancellationReason
                : cancellationReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryAddressInfoCopyWith<$Res>? get deliveryAddress {
    if (_value.deliveryAddress == null) {
      return null;
    }

    return $DeliveryAddressInfoCopyWith<$Res>(_value.deliveryAddress!, (value) {
      return _then(_value.copyWith(deliveryAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
    _$OrderImpl value,
    $Res Function(_$OrderImpl) then,
  ) = __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'orderNumber') String orderNumber,
    dynamic customer,
    dynamic restaurant,
    List<OrderItem> items,
    double? subtotal,
    @JsonKey(name: 'deliveryFee') double? deliveryFee,
    @JsonKey(name: 'platformFee') double? platformFee,
    double total,
    @JsonKey(name: 'paymentMethod') String? paymentMethod,
    @JsonKey(name: 'paymentStatus') String? paymentStatus,
    String status,
    @JsonKey(name: 'statusHistory') List<OrderStatusHistory>? statusHistory,
    @JsonKey(name: 'deliveryAddress') DeliveryAddressInfo? deliveryAddress,
    @JsonKey(name: 'specialInstructions') String? specialInstructions,
    @JsonKey(name: 'cancellationReason') String? cancellationReason,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
  });

  @override
  $DeliveryAddressInfoCopyWith<$Res>? get deliveryAddress;
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
    _$OrderImpl _value,
    $Res Function(_$OrderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? customer = freezed,
    Object? restaurant = freezed,
    Object? items = null,
    Object? subtotal = freezed,
    Object? deliveryFee = freezed,
    Object? platformFee = freezed,
    Object? total = null,
    Object? paymentMethod = freezed,
    Object? paymentStatus = freezed,
    Object? status = null,
    Object? statusHistory = freezed,
    Object? deliveryAddress = freezed,
    Object? specialInstructions = freezed,
    Object? cancellationReason = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$OrderImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        orderNumber: null == orderNumber
            ? _value.orderNumber
            : orderNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        customer: freezed == customer
            ? _value.customer
            : customer // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        restaurant: freezed == restaurant
            ? _value.restaurant
            : restaurant // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<OrderItem>,
        subtotal: freezed == subtotal
            ? _value.subtotal
            : subtotal // ignore: cast_nullable_to_non_nullable
                  as double?,
        deliveryFee: freezed == deliveryFee
            ? _value.deliveryFee
            : deliveryFee // ignore: cast_nullable_to_non_nullable
                  as double?,
        platformFee: freezed == platformFee
            ? _value.platformFee
            : platformFee // ignore: cast_nullable_to_non_nullable
                  as double?,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
        paymentMethod: freezed == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as String?,
        paymentStatus: freezed == paymentStatus
            ? _value.paymentStatus
            : paymentStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        statusHistory: freezed == statusHistory
            ? _value._statusHistory
            : statusHistory // ignore: cast_nullable_to_non_nullable
                  as List<OrderStatusHistory>?,
        deliveryAddress: freezed == deliveryAddress
            ? _value.deliveryAddress
            : deliveryAddress // ignore: cast_nullable_to_non_nullable
                  as DeliveryAddressInfo?,
        specialInstructions: freezed == specialInstructions
            ? _value.specialInstructions
            : specialInstructions // ignore: cast_nullable_to_non_nullable
                  as String?,
        cancellationReason: freezed == cancellationReason
            ? _value.cancellationReason
            : cancellationReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  const _$OrderImpl({
    @JsonKey(name: '_id') required this.id,
    @JsonKey(name: 'orderNumber') required this.orderNumber,
    this.customer,
    this.restaurant,
    required final List<OrderItem> items,
    this.subtotal,
    @JsonKey(name: 'deliveryFee') this.deliveryFee,
    @JsonKey(name: 'platformFee') this.platformFee,
    required this.total,
    @JsonKey(name: 'paymentMethod') this.paymentMethod,
    @JsonKey(name: 'paymentStatus') this.paymentStatus,
    required this.status,
    @JsonKey(name: 'statusHistory')
    final List<OrderStatusHistory>? statusHistory,
    @JsonKey(name: 'deliveryAddress') this.deliveryAddress,
    @JsonKey(name: 'specialInstructions') this.specialInstructions,
    @JsonKey(name: 'cancellationReason') this.cancellationReason,
    @JsonKey(name: 'createdAt') this.createdAt,
  }) : _items = items,
       _statusHistory = statusHistory;

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'orderNumber')
  final String orderNumber;
  @override
  final dynamic customer;
  @override
  final dynamic restaurant;
  final List<OrderItem> _items;
  @override
  List<OrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final double? subtotal;
  @override
  @JsonKey(name: 'deliveryFee')
  final double? deliveryFee;
  @override
  @JsonKey(name: 'platformFee')
  final double? platformFee;
  @override
  final double total;
  @override
  @JsonKey(name: 'paymentMethod')
  final String? paymentMethod;
  @override
  @JsonKey(name: 'paymentStatus')
  final String? paymentStatus;
  @override
  final String status;
  final List<OrderStatusHistory>? _statusHistory;
  @override
  @JsonKey(name: 'statusHistory')
  List<OrderStatusHistory>? get statusHistory {
    final value = _statusHistory;
    if (value == null) return null;
    if (_statusHistory is EqualUnmodifiableListView) return _statusHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'deliveryAddress')
  final DeliveryAddressInfo? deliveryAddress;
  @override
  @JsonKey(name: 'specialInstructions')
  final String? specialInstructions;
  @override
  @JsonKey(name: 'cancellationReason')
  final String? cancellationReason;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Order(id: $id, orderNumber: $orderNumber, customer: $customer, restaurant: $restaurant, items: $items, subtotal: $subtotal, deliveryFee: $deliveryFee, platformFee: $platformFee, total: $total, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, status: $status, statusHistory: $statusHistory, deliveryAddress: $deliveryAddress, specialInstructions: $specialInstructions, cancellationReason: $cancellationReason, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            const DeepCollectionEquality().equals(other.customer, customer) &&
            const DeepCollectionEquality().equals(
              other.restaurant,
              restaurant,
            ) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.platformFee, platformFee) ||
                other.platformFee == platformFee) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._statusHistory,
              _statusHistory,
            ) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    orderNumber,
    const DeepCollectionEquality().hash(customer),
    const DeepCollectionEquality().hash(restaurant),
    const DeepCollectionEquality().hash(_items),
    subtotal,
    deliveryFee,
    platformFee,
    total,
    paymentMethod,
    paymentStatus,
    status,
    const DeepCollectionEquality().hash(_statusHistory),
    deliveryAddress,
    specialInstructions,
    cancellationReason,
    createdAt,
  );

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(this);
  }
}

abstract class _Order implements Order {
  const factory _Order({
    @JsonKey(name: '_id') required final String id,
    @JsonKey(name: 'orderNumber') required final String orderNumber,
    final dynamic customer,
    final dynamic restaurant,
    required final List<OrderItem> items,
    final double? subtotal,
    @JsonKey(name: 'deliveryFee') final double? deliveryFee,
    @JsonKey(name: 'platformFee') final double? platformFee,
    required final double total,
    @JsonKey(name: 'paymentMethod') final String? paymentMethod,
    @JsonKey(name: 'paymentStatus') final String? paymentStatus,
    required final String status,
    @JsonKey(name: 'statusHistory')
    final List<OrderStatusHistory>? statusHistory,
    @JsonKey(name: 'deliveryAddress')
    final DeliveryAddressInfo? deliveryAddress,
    @JsonKey(name: 'specialInstructions') final String? specialInstructions,
    @JsonKey(name: 'cancellationReason') final String? cancellationReason,
    @JsonKey(name: 'createdAt') final DateTime? createdAt,
  }) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'orderNumber')
  String get orderNumber;
  @override
  dynamic get customer;
  @override
  dynamic get restaurant;
  @override
  List<OrderItem> get items;
  @override
  double? get subtotal;
  @override
  @JsonKey(name: 'deliveryFee')
  double? get deliveryFee;
  @override
  @JsonKey(name: 'platformFee')
  double? get platformFee;
  @override
  double get total;
  @override
  @JsonKey(name: 'paymentMethod')
  String? get paymentMethod;
  @override
  @JsonKey(name: 'paymentStatus')
  String? get paymentStatus;
  @override
  String get status;
  @override
  @JsonKey(name: 'statusHistory')
  List<OrderStatusHistory>? get statusHistory;
  @override
  @JsonKey(name: 'deliveryAddress')
  DeliveryAddressInfo? get deliveryAddress;
  @override
  @JsonKey(name: 'specialInstructions')
  String? get specialInstructions;
  @override
  @JsonKey(name: 'cancellationReason')
  String? get cancellationReason;
  @override
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MyOrder _$MyOrderFromJson(Map<String, dynamic> json) {
  return _MyOrder.fromJson(json);
}

/// @nodoc
mixin _$MyOrder {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderNumber')
  String get orderNumber => throw _privateConstructorUsedError;
  MyOrderRestaurant? get restaurant => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this MyOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyOrderCopyWith<MyOrder> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyOrderCopyWith<$Res> {
  factory $MyOrderCopyWith(MyOrder value, $Res Function(MyOrder) then) =
      _$MyOrderCopyWithImpl<$Res, MyOrder>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'orderNumber') String orderNumber,
    MyOrderRestaurant? restaurant,
    double? total,
    String? status,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
  });

  $MyOrderRestaurantCopyWith<$Res>? get restaurant;
}

/// @nodoc
class _$MyOrderCopyWithImpl<$Res, $Val extends MyOrder>
    implements $MyOrderCopyWith<$Res> {
  _$MyOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? restaurant = freezed,
    Object? total = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            orderNumber: null == orderNumber
                ? _value.orderNumber
                : orderNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            restaurant: freezed == restaurant
                ? _value.restaurant
                : restaurant // ignore: cast_nullable_to_non_nullable
                      as MyOrderRestaurant?,
            total: freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of MyOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MyOrderRestaurantCopyWith<$Res>? get restaurant {
    if (_value.restaurant == null) {
      return null;
    }

    return $MyOrderRestaurantCopyWith<$Res>(_value.restaurant!, (value) {
      return _then(_value.copyWith(restaurant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyOrderImplCopyWith<$Res> implements $MyOrderCopyWith<$Res> {
  factory _$$MyOrderImplCopyWith(
    _$MyOrderImpl value,
    $Res Function(_$MyOrderImpl) then,
  ) = __$$MyOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'orderNumber') String orderNumber,
    MyOrderRestaurant? restaurant,
    double? total,
    String? status,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
  });

  @override
  $MyOrderRestaurantCopyWith<$Res>? get restaurant;
}

/// @nodoc
class __$$MyOrderImplCopyWithImpl<$Res>
    extends _$MyOrderCopyWithImpl<$Res, _$MyOrderImpl>
    implements _$$MyOrderImplCopyWith<$Res> {
  __$$MyOrderImplCopyWithImpl(
    _$MyOrderImpl _value,
    $Res Function(_$MyOrderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? restaurant = freezed,
    Object? total = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$MyOrderImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        orderNumber: null == orderNumber
            ? _value.orderNumber
            : orderNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        restaurant: freezed == restaurant
            ? _value.restaurant
            : restaurant // ignore: cast_nullable_to_non_nullable
                  as MyOrderRestaurant?,
        total: freezed == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MyOrderImpl implements _MyOrder {
  const _$MyOrderImpl({
    @JsonKey(name: '_id') required this.id,
    @JsonKey(name: 'orderNumber') required this.orderNumber,
    this.restaurant,
    this.total,
    this.status,
    @JsonKey(name: 'createdAt') this.createdAt,
  });

  factory _$MyOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyOrderImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'orderNumber')
  final String orderNumber;
  @override
  final MyOrderRestaurant? restaurant;
  @override
  final double? total;
  @override
  final String? status;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'MyOrder(id: $id, orderNumber: $orderNumber, restaurant: $restaurant, total: $total, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyOrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.restaurant, restaurant) ||
                other.restaurant == restaurant) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    orderNumber,
    restaurant,
    total,
    status,
    createdAt,
  );

  /// Create a copy of MyOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyOrderImplCopyWith<_$MyOrderImpl> get copyWith =>
      __$$MyOrderImplCopyWithImpl<_$MyOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyOrderImplToJson(this);
  }
}

abstract class _MyOrder implements MyOrder {
  const factory _MyOrder({
    @JsonKey(name: '_id') required final String id,
    @JsonKey(name: 'orderNumber') required final String orderNumber,
    final MyOrderRestaurant? restaurant,
    final double? total,
    final String? status,
    @JsonKey(name: 'createdAt') final DateTime? createdAt,
  }) = _$MyOrderImpl;

  factory _MyOrder.fromJson(Map<String, dynamic> json) = _$MyOrderImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'orderNumber')
  String get orderNumber;
  @override
  MyOrderRestaurant? get restaurant;
  @override
  double? get total;
  @override
  String? get status;
  @override
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt;

  /// Create a copy of MyOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyOrderImplCopyWith<_$MyOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MyOrderRestaurant _$MyOrderRestaurantFromJson(Map<String, dynamic> json) {
  return _MyOrderRestaurant.fromJson(json);
}

/// @nodoc
mixin _$MyOrderRestaurant {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;

  /// Serializes this MyOrderRestaurant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyOrderRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyOrderRestaurantCopyWith<MyOrderRestaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyOrderRestaurantCopyWith<$Res> {
  factory $MyOrderRestaurantCopyWith(
    MyOrderRestaurant value,
    $Res Function(MyOrderRestaurant) then,
  ) = _$MyOrderRestaurantCopyWithImpl<$Res, MyOrderRestaurant>;
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, String? name, String? logo});
}

/// @nodoc
class _$MyOrderRestaurantCopyWithImpl<$Res, $Val extends MyOrderRestaurant>
    implements $MyOrderRestaurantCopyWith<$Res> {
  _$MyOrderRestaurantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyOrderRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            logo: freezed == logo
                ? _value.logo
                : logo // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MyOrderRestaurantImplCopyWith<$Res>
    implements $MyOrderRestaurantCopyWith<$Res> {
  factory _$$MyOrderRestaurantImplCopyWith(
    _$MyOrderRestaurantImpl value,
    $Res Function(_$MyOrderRestaurantImpl) then,
  ) = __$$MyOrderRestaurantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, String? name, String? logo});
}

/// @nodoc
class __$$MyOrderRestaurantImplCopyWithImpl<$Res>
    extends _$MyOrderRestaurantCopyWithImpl<$Res, _$MyOrderRestaurantImpl>
    implements _$$MyOrderRestaurantImplCopyWith<$Res> {
  __$$MyOrderRestaurantImplCopyWithImpl(
    _$MyOrderRestaurantImpl _value,
    $Res Function(_$MyOrderRestaurantImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyOrderRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
  }) {
    return _then(
      _$MyOrderRestaurantImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        logo: freezed == logo
            ? _value.logo
            : logo // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MyOrderRestaurantImpl implements _MyOrderRestaurant {
  const _$MyOrderRestaurantImpl({
    @JsonKey(name: '_id') this.id,
    this.name,
    this.logo,
  });

  factory _$MyOrderRestaurantImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyOrderRestaurantImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  @override
  final String? logo;

  @override
  String toString() {
    return 'MyOrderRestaurant(id: $id, name: $name, logo: $logo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyOrderRestaurantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, logo);

  /// Create a copy of MyOrderRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyOrderRestaurantImplCopyWith<_$MyOrderRestaurantImpl> get copyWith =>
      __$$MyOrderRestaurantImplCopyWithImpl<_$MyOrderRestaurantImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MyOrderRestaurantImplToJson(this);
  }
}

abstract class _MyOrderRestaurant implements MyOrderRestaurant {
  const factory _MyOrderRestaurant({
    @JsonKey(name: '_id') final String? id,
    final String? name,
    final String? logo,
  }) = _$MyOrderRestaurantImpl;

  factory _MyOrderRestaurant.fromJson(Map<String, dynamic> json) =
      _$MyOrderRestaurantImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;
  @override
  String? get logo;

  /// Create a copy of MyOrderRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyOrderRestaurantImplCopyWith<_$MyOrderRestaurantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CancelOrderRequest _$CancelOrderRequestFromJson(Map<String, dynamic> json) {
  return _CancelOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$CancelOrderRequest {
  @JsonKey(includeIfNull: false)
  String? get reason => throw _privateConstructorUsedError;

  /// Serializes this CancelOrderRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CancelOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CancelOrderRequestCopyWith<CancelOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelOrderRequestCopyWith<$Res> {
  factory $CancelOrderRequestCopyWith(
    CancelOrderRequest value,
    $Res Function(CancelOrderRequest) then,
  ) = _$CancelOrderRequestCopyWithImpl<$Res, CancelOrderRequest>;
  @useResult
  $Res call({@JsonKey(includeIfNull: false) String? reason});
}

/// @nodoc
class _$CancelOrderRequestCopyWithImpl<$Res, $Val extends CancelOrderRequest>
    implements $CancelOrderRequestCopyWith<$Res> {
  _$CancelOrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CancelOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reason = freezed}) {
    return _then(
      _value.copyWith(
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CancelOrderRequestImplCopyWith<$Res>
    implements $CancelOrderRequestCopyWith<$Res> {
  factory _$$CancelOrderRequestImplCopyWith(
    _$CancelOrderRequestImpl value,
    $Res Function(_$CancelOrderRequestImpl) then,
  ) = __$$CancelOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(includeIfNull: false) String? reason});
}

/// @nodoc
class __$$CancelOrderRequestImplCopyWithImpl<$Res>
    extends _$CancelOrderRequestCopyWithImpl<$Res, _$CancelOrderRequestImpl>
    implements _$$CancelOrderRequestImplCopyWith<$Res> {
  __$$CancelOrderRequestImplCopyWithImpl(
    _$CancelOrderRequestImpl _value,
    $Res Function(_$CancelOrderRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CancelOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reason = freezed}) {
    return _then(
      _$CancelOrderRequestImpl(
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CancelOrderRequestImpl implements _CancelOrderRequest {
  const _$CancelOrderRequestImpl({@JsonKey(includeIfNull: false) this.reason});

  factory _$CancelOrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelOrderRequestImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final String? reason;

  @override
  String toString() {
    return 'CancelOrderRequest(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelOrderRequestImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reason);

  /// Create a copy of CancelOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelOrderRequestImplCopyWith<_$CancelOrderRequestImpl> get copyWith =>
      __$$CancelOrderRequestImplCopyWithImpl<_$CancelOrderRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelOrderRequestImplToJson(this);
  }
}

abstract class _CancelOrderRequest implements CancelOrderRequest {
  const factory _CancelOrderRequest({
    @JsonKey(includeIfNull: false) final String? reason,
  }) = _$CancelOrderRequestImpl;

  factory _CancelOrderRequest.fromJson(Map<String, dynamic> json) =
      _$CancelOrderRequestImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  String? get reason;

  /// Create a copy of CancelOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelOrderRequestImplCopyWith<_$CancelOrderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatePaymentIntentRequest _$CreatePaymentIntentRequestFromJson(
  Map<String, dynamic> json,
) {
  return _CreatePaymentIntentRequest.fromJson(json);
}

/// @nodoc
mixin _$CreatePaymentIntentRequest {
  @JsonKey(name: 'orderId')
  String get orderId => throw _privateConstructorUsedError;

  /// Serializes this CreatePaymentIntentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatePaymentIntentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePaymentIntentRequestCopyWith<CreatePaymentIntentRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePaymentIntentRequestCopyWith<$Res> {
  factory $CreatePaymentIntentRequestCopyWith(
    CreatePaymentIntentRequest value,
    $Res Function(CreatePaymentIntentRequest) then,
  ) =
      _$CreatePaymentIntentRequestCopyWithImpl<
        $Res,
        CreatePaymentIntentRequest
      >;
  @useResult
  $Res call({@JsonKey(name: 'orderId') String orderId});
}

/// @nodoc
class _$CreatePaymentIntentRequestCopyWithImpl<
  $Res,
  $Val extends CreatePaymentIntentRequest
>
    implements $CreatePaymentIntentRequestCopyWith<$Res> {
  _$CreatePaymentIntentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePaymentIntentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null}) {
    return _then(
      _value.copyWith(
            orderId: null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreatePaymentIntentRequestImplCopyWith<$Res>
    implements $CreatePaymentIntentRequestCopyWith<$Res> {
  factory _$$CreatePaymentIntentRequestImplCopyWith(
    _$CreatePaymentIntentRequestImpl value,
    $Res Function(_$CreatePaymentIntentRequestImpl) then,
  ) = __$$CreatePaymentIntentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'orderId') String orderId});
}

/// @nodoc
class __$$CreatePaymentIntentRequestImplCopyWithImpl<$Res>
    extends
        _$CreatePaymentIntentRequestCopyWithImpl<
          $Res,
          _$CreatePaymentIntentRequestImpl
        >
    implements _$$CreatePaymentIntentRequestImplCopyWith<$Res> {
  __$$CreatePaymentIntentRequestImplCopyWithImpl(
    _$CreatePaymentIntentRequestImpl _value,
    $Res Function(_$CreatePaymentIntentRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreatePaymentIntentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null}) {
    return _then(
      _$CreatePaymentIntentRequestImpl(
        orderId: null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePaymentIntentRequestImpl implements _CreatePaymentIntentRequest {
  const _$CreatePaymentIntentRequestImpl({
    @JsonKey(name: 'orderId') required this.orderId,
  });

  factory _$CreatePaymentIntentRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CreatePaymentIntentRequestImplFromJson(json);

  @override
  @JsonKey(name: 'orderId')
  final String orderId;

  @override
  String toString() {
    return 'CreatePaymentIntentRequest(orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePaymentIntentRequestImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  /// Create a copy of CreatePaymentIntentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePaymentIntentRequestImplCopyWith<_$CreatePaymentIntentRequestImpl>
  get copyWith =>
      __$$CreatePaymentIntentRequestImplCopyWithImpl<
        _$CreatePaymentIntentRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePaymentIntentRequestImplToJson(this);
  }
}

abstract class _CreatePaymentIntentRequest
    implements CreatePaymentIntentRequest {
  const factory _CreatePaymentIntentRequest({
    @JsonKey(name: 'orderId') required final String orderId,
  }) = _$CreatePaymentIntentRequestImpl;

  factory _CreatePaymentIntentRequest.fromJson(Map<String, dynamic> json) =
      _$CreatePaymentIntentRequestImpl.fromJson;

  @override
  @JsonKey(name: 'orderId')
  String get orderId;

  /// Create a copy of CreatePaymentIntentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePaymentIntentRequestImplCopyWith<_$CreatePaymentIntentRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PaymentIntentResponse _$PaymentIntentResponseFromJson(
  Map<String, dynamic> json,
) {
  return _PaymentIntentResponse.fromJson(json);
}

/// @nodoc
mixin _$PaymentIntentResponse {
  @JsonKey(name: 'clientSecret')
  String get clientSecret => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentIntentId')
  String get paymentIntentId => throw _privateConstructorUsedError;

  /// Serializes this PaymentIntentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentIntentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentIntentResponseCopyWith<PaymentIntentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentIntentResponseCopyWith<$Res> {
  factory $PaymentIntentResponseCopyWith(
    PaymentIntentResponse value,
    $Res Function(PaymentIntentResponse) then,
  ) = _$PaymentIntentResponseCopyWithImpl<$Res, PaymentIntentResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'clientSecret') String clientSecret,
    @JsonKey(name: 'paymentIntentId') String paymentIntentId,
  });
}

/// @nodoc
class _$PaymentIntentResponseCopyWithImpl<
  $Res,
  $Val extends PaymentIntentResponse
>
    implements $PaymentIntentResponseCopyWith<$Res> {
  _$PaymentIntentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentIntentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? clientSecret = null, Object? paymentIntentId = null}) {
    return _then(
      _value.copyWith(
            clientSecret: null == clientSecret
                ? _value.clientSecret
                : clientSecret // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentIntentId: null == paymentIntentId
                ? _value.paymentIntentId
                : paymentIntentId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentIntentResponseImplCopyWith<$Res>
    implements $PaymentIntentResponseCopyWith<$Res> {
  factory _$$PaymentIntentResponseImplCopyWith(
    _$PaymentIntentResponseImpl value,
    $Res Function(_$PaymentIntentResponseImpl) then,
  ) = __$$PaymentIntentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'clientSecret') String clientSecret,
    @JsonKey(name: 'paymentIntentId') String paymentIntentId,
  });
}

/// @nodoc
class __$$PaymentIntentResponseImplCopyWithImpl<$Res>
    extends
        _$PaymentIntentResponseCopyWithImpl<$Res, _$PaymentIntentResponseImpl>
    implements _$$PaymentIntentResponseImplCopyWith<$Res> {
  __$$PaymentIntentResponseImplCopyWithImpl(
    _$PaymentIntentResponseImpl _value,
    $Res Function(_$PaymentIntentResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentIntentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? clientSecret = null, Object? paymentIntentId = null}) {
    return _then(
      _$PaymentIntentResponseImpl(
        clientSecret: null == clientSecret
            ? _value.clientSecret
            : clientSecret // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentIntentId: null == paymentIntentId
            ? _value.paymentIntentId
            : paymentIntentId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentIntentResponseImpl implements _PaymentIntentResponse {
  const _$PaymentIntentResponseImpl({
    @JsonKey(name: 'clientSecret') required this.clientSecret,
    @JsonKey(name: 'paymentIntentId') required this.paymentIntentId,
  });

  factory _$PaymentIntentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentIntentResponseImplFromJson(json);

  @override
  @JsonKey(name: 'clientSecret')
  final String clientSecret;
  @override
  @JsonKey(name: 'paymentIntentId')
  final String paymentIntentId;

  @override
  String toString() {
    return 'PaymentIntentResponse(clientSecret: $clientSecret, paymentIntentId: $paymentIntentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentIntentResponseImpl &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret) &&
            (identical(other.paymentIntentId, paymentIntentId) ||
                other.paymentIntentId == paymentIntentId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, clientSecret, paymentIntentId);

  /// Create a copy of PaymentIntentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentIntentResponseImplCopyWith<_$PaymentIntentResponseImpl>
  get copyWith =>
      __$$PaymentIntentResponseImplCopyWithImpl<_$PaymentIntentResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentIntentResponseImplToJson(this);
  }
}

abstract class _PaymentIntentResponse implements PaymentIntentResponse {
  const factory _PaymentIntentResponse({
    @JsonKey(name: 'clientSecret') required final String clientSecret,
    @JsonKey(name: 'paymentIntentId') required final String paymentIntentId,
  }) = _$PaymentIntentResponseImpl;

  factory _PaymentIntentResponse.fromJson(Map<String, dynamic> json) =
      _$PaymentIntentResponseImpl.fromJson;

  @override
  @JsonKey(name: 'clientSecret')
  String get clientSecret;
  @override
  @JsonKey(name: 'paymentIntentId')
  String get paymentIntentId;

  /// Create a copy of PaymentIntentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentIntentResponseImplCopyWith<_$PaymentIntentResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SubmitRatingRequest _$SubmitRatingRequestFromJson(Map<String, dynamic> json) {
  return _SubmitRatingRequest.fromJson(json);
}

/// @nodoc
mixin _$SubmitRatingRequest {
  @JsonKey(name: 'orderId')
  String get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'restaurantRating')
  int get restaurantRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'driverRating', includeIfNull: false)
  int? get driverRating => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get comment => throw _privateConstructorUsedError;

  /// Serializes this SubmitRatingRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubmitRatingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubmitRatingRequestCopyWith<SubmitRatingRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitRatingRequestCopyWith<$Res> {
  factory $SubmitRatingRequestCopyWith(
    SubmitRatingRequest value,
    $Res Function(SubmitRatingRequest) then,
  ) = _$SubmitRatingRequestCopyWithImpl<$Res, SubmitRatingRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'orderId') String orderId,
    @JsonKey(name: 'restaurantRating') int restaurantRating,
    @JsonKey(name: 'driverRating', includeIfNull: false) int? driverRating,
    @JsonKey(includeIfNull: false) String? comment,
  });
}

/// @nodoc
class _$SubmitRatingRequestCopyWithImpl<$Res, $Val extends SubmitRatingRequest>
    implements $SubmitRatingRequestCopyWith<$Res> {
  _$SubmitRatingRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubmitRatingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? restaurantRating = null,
    Object? driverRating = freezed,
    Object? comment = freezed,
  }) {
    return _then(
      _value.copyWith(
            orderId: null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                      as String,
            restaurantRating: null == restaurantRating
                ? _value.restaurantRating
                : restaurantRating // ignore: cast_nullable_to_non_nullable
                      as int,
            driverRating: freezed == driverRating
                ? _value.driverRating
                : driverRating // ignore: cast_nullable_to_non_nullable
                      as int?,
            comment: freezed == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubmitRatingRequestImplCopyWith<$Res>
    implements $SubmitRatingRequestCopyWith<$Res> {
  factory _$$SubmitRatingRequestImplCopyWith(
    _$SubmitRatingRequestImpl value,
    $Res Function(_$SubmitRatingRequestImpl) then,
  ) = __$$SubmitRatingRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'orderId') String orderId,
    @JsonKey(name: 'restaurantRating') int restaurantRating,
    @JsonKey(name: 'driverRating', includeIfNull: false) int? driverRating,
    @JsonKey(includeIfNull: false) String? comment,
  });
}

/// @nodoc
class __$$SubmitRatingRequestImplCopyWithImpl<$Res>
    extends _$SubmitRatingRequestCopyWithImpl<$Res, _$SubmitRatingRequestImpl>
    implements _$$SubmitRatingRequestImplCopyWith<$Res> {
  __$$SubmitRatingRequestImplCopyWithImpl(
    _$SubmitRatingRequestImpl _value,
    $Res Function(_$SubmitRatingRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubmitRatingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? restaurantRating = null,
    Object? driverRating = freezed,
    Object? comment = freezed,
  }) {
    return _then(
      _$SubmitRatingRequestImpl(
        orderId: null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as String,
        restaurantRating: null == restaurantRating
            ? _value.restaurantRating
            : restaurantRating // ignore: cast_nullable_to_non_nullable
                  as int,
        driverRating: freezed == driverRating
            ? _value.driverRating
            : driverRating // ignore: cast_nullable_to_non_nullable
                  as int?,
        comment: freezed == comment
            ? _value.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmitRatingRequestImpl implements _SubmitRatingRequest {
  const _$SubmitRatingRequestImpl({
    @JsonKey(name: 'orderId') required this.orderId,
    @JsonKey(name: 'restaurantRating') required this.restaurantRating,
    @JsonKey(name: 'driverRating', includeIfNull: false) this.driverRating,
    @JsonKey(includeIfNull: false) this.comment,
  });

  factory _$SubmitRatingRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmitRatingRequestImplFromJson(json);

  @override
  @JsonKey(name: 'orderId')
  final String orderId;
  @override
  @JsonKey(name: 'restaurantRating')
  final int restaurantRating;
  @override
  @JsonKey(name: 'driverRating', includeIfNull: false)
  final int? driverRating;
  @override
  @JsonKey(includeIfNull: false)
  final String? comment;

  @override
  String toString() {
    return 'SubmitRatingRequest(orderId: $orderId, restaurantRating: $restaurantRating, driverRating: $driverRating, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitRatingRequestImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.restaurantRating, restaurantRating) ||
                other.restaurantRating == restaurantRating) &&
            (identical(other.driverRating, driverRating) ||
                other.driverRating == driverRating) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    orderId,
    restaurantRating,
    driverRating,
    comment,
  );

  /// Create a copy of SubmitRatingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitRatingRequestImplCopyWith<_$SubmitRatingRequestImpl> get copyWith =>
      __$$SubmitRatingRequestImplCopyWithImpl<_$SubmitRatingRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmitRatingRequestImplToJson(this);
  }
}

abstract class _SubmitRatingRequest implements SubmitRatingRequest {
  const factory _SubmitRatingRequest({
    @JsonKey(name: 'orderId') required final String orderId,
    @JsonKey(name: 'restaurantRating') required final int restaurantRating,
    @JsonKey(name: 'driverRating', includeIfNull: false)
    final int? driverRating,
    @JsonKey(includeIfNull: false) final String? comment,
  }) = _$SubmitRatingRequestImpl;

  factory _SubmitRatingRequest.fromJson(Map<String, dynamic> json) =
      _$SubmitRatingRequestImpl.fromJson;

  @override
  @JsonKey(name: 'orderId')
  String get orderId;
  @override
  @JsonKey(name: 'restaurantRating')
  int get restaurantRating;
  @override
  @JsonKey(name: 'driverRating', includeIfNull: false)
  int? get driverRating;
  @override
  @JsonKey(includeIfNull: false)
  String? get comment;

  /// Create a copy of SubmitRatingRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitRatingRequestImplCopyWith<_$SubmitRatingRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RatingResponse _$RatingResponseFromJson(Map<String, dynamic> json) {
  return _RatingResponse.fromJson(json);
}

/// @nodoc
mixin _$RatingResponse {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order')
  String? get orderId => throw _privateConstructorUsedError;
  String? get customer => throw _privateConstructorUsedError;
  String? get restaurant => throw _privateConstructorUsedError;
  String? get driver => throw _privateConstructorUsedError;
  @JsonKey(name: 'restaurantRating')
  int? get restaurantRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'driverRating')
  int? get driverRating => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this RatingResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RatingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatingResponseCopyWith<RatingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingResponseCopyWith<$Res> {
  factory $RatingResponseCopyWith(
    RatingResponse value,
    $Res Function(RatingResponse) then,
  ) = _$RatingResponseCopyWithImpl<$Res, RatingResponse>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'order') String? orderId,
    String? customer,
    String? restaurant,
    String? driver,
    @JsonKey(name: 'restaurantRating') int? restaurantRating,
    @JsonKey(name: 'driverRating') int? driverRating,
    String? comment,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
  });
}

/// @nodoc
class _$RatingResponseCopyWithImpl<$Res, $Val extends RatingResponse>
    implements $RatingResponseCopyWith<$Res> {
  _$RatingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RatingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = freezed,
    Object? customer = freezed,
    Object? restaurant = freezed,
    Object? driver = freezed,
    Object? restaurantRating = freezed,
    Object? driverRating = freezed,
    Object? comment = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            orderId: freezed == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                      as String?,
            customer: freezed == customer
                ? _value.customer
                : customer // ignore: cast_nullable_to_non_nullable
                      as String?,
            restaurant: freezed == restaurant
                ? _value.restaurant
                : restaurant // ignore: cast_nullable_to_non_nullable
                      as String?,
            driver: freezed == driver
                ? _value.driver
                : driver // ignore: cast_nullable_to_non_nullable
                      as String?,
            restaurantRating: freezed == restaurantRating
                ? _value.restaurantRating
                : restaurantRating // ignore: cast_nullable_to_non_nullable
                      as int?,
            driverRating: freezed == driverRating
                ? _value.driverRating
                : driverRating // ignore: cast_nullable_to_non_nullable
                      as int?,
            comment: freezed == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RatingResponseImplCopyWith<$Res>
    implements $RatingResponseCopyWith<$Res> {
  factory _$$RatingResponseImplCopyWith(
    _$RatingResponseImpl value,
    $Res Function(_$RatingResponseImpl) then,
  ) = __$$RatingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'order') String? orderId,
    String? customer,
    String? restaurant,
    String? driver,
    @JsonKey(name: 'restaurantRating') int? restaurantRating,
    @JsonKey(name: 'driverRating') int? driverRating,
    String? comment,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
  });
}

/// @nodoc
class __$$RatingResponseImplCopyWithImpl<$Res>
    extends _$RatingResponseCopyWithImpl<$Res, _$RatingResponseImpl>
    implements _$$RatingResponseImplCopyWith<$Res> {
  __$$RatingResponseImplCopyWithImpl(
    _$RatingResponseImpl _value,
    $Res Function(_$RatingResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RatingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = freezed,
    Object? customer = freezed,
    Object? restaurant = freezed,
    Object? driver = freezed,
    Object? restaurantRating = freezed,
    Object? driverRating = freezed,
    Object? comment = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$RatingResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        orderId: freezed == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as String?,
        customer: freezed == customer
            ? _value.customer
            : customer // ignore: cast_nullable_to_non_nullable
                  as String?,
        restaurant: freezed == restaurant
            ? _value.restaurant
            : restaurant // ignore: cast_nullable_to_non_nullable
                  as String?,
        driver: freezed == driver
            ? _value.driver
            : driver // ignore: cast_nullable_to_non_nullable
                  as String?,
        restaurantRating: freezed == restaurantRating
            ? _value.restaurantRating
            : restaurantRating // ignore: cast_nullable_to_non_nullable
                  as int?,
        driverRating: freezed == driverRating
            ? _value.driverRating
            : driverRating // ignore: cast_nullable_to_non_nullable
                  as int?,
        comment: freezed == comment
            ? _value.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RatingResponseImpl implements _RatingResponse {
  const _$RatingResponseImpl({
    @JsonKey(name: '_id') required this.id,
    @JsonKey(name: 'order') this.orderId,
    this.customer,
    this.restaurant,
    this.driver,
    @JsonKey(name: 'restaurantRating') this.restaurantRating,
    @JsonKey(name: 'driverRating') this.driverRating,
    this.comment,
    @JsonKey(name: 'createdAt') this.createdAt,
  });

  factory _$RatingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatingResponseImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'order')
  final String? orderId;
  @override
  final String? customer;
  @override
  final String? restaurant;
  @override
  final String? driver;
  @override
  @JsonKey(name: 'restaurantRating')
  final int? restaurantRating;
  @override
  @JsonKey(name: 'driverRating')
  final int? driverRating;
  @override
  final String? comment;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'RatingResponse(id: $id, orderId: $orderId, customer: $customer, restaurant: $restaurant, driver: $driver, restaurantRating: $restaurantRating, driverRating: $driverRating, comment: $comment, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.restaurant, restaurant) ||
                other.restaurant == restaurant) &&
            (identical(other.driver, driver) || other.driver == driver) &&
            (identical(other.restaurantRating, restaurantRating) ||
                other.restaurantRating == restaurantRating) &&
            (identical(other.driverRating, driverRating) ||
                other.driverRating == driverRating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    orderId,
    customer,
    restaurant,
    driver,
    restaurantRating,
    driverRating,
    comment,
    createdAt,
  );

  /// Create a copy of RatingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingResponseImplCopyWith<_$RatingResponseImpl> get copyWith =>
      __$$RatingResponseImplCopyWithImpl<_$RatingResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RatingResponseImplToJson(this);
  }
}

abstract class _RatingResponse implements RatingResponse {
  const factory _RatingResponse({
    @JsonKey(name: '_id') required final String id,
    @JsonKey(name: 'order') final String? orderId,
    final String? customer,
    final String? restaurant,
    final String? driver,
    @JsonKey(name: 'restaurantRating') final int? restaurantRating,
    @JsonKey(name: 'driverRating') final int? driverRating,
    final String? comment,
    @JsonKey(name: 'createdAt') final DateTime? createdAt,
  }) = _$RatingResponseImpl;

  factory _RatingResponse.fromJson(Map<String, dynamic> json) =
      _$RatingResponseImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'order')
  String? get orderId;
  @override
  String? get customer;
  @override
  String? get restaurant;
  @override
  String? get driver;
  @override
  @JsonKey(name: 'restaurantRating')
  int? get restaurantRating;
  @override
  @JsonKey(name: 'driverRating')
  int? get driverRating;
  @override
  String? get comment;
  @override
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt;

  /// Create a copy of RatingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatingResponseImplCopyWith<_$RatingResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateProfileRequest _$UpdateProfileRequestFromJson(Map<String, dynamic> json) {
  return _UpdateProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateProfileRequest {
  @JsonKey(includeIfNull: false)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this UpdateProfileRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateProfileRequestCopyWith<UpdateProfileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProfileRequestCopyWith<$Res> {
  factory $UpdateProfileRequestCopyWith(
    UpdateProfileRequest value,
    $Res Function(UpdateProfileRequest) then,
  ) = _$UpdateProfileRequestCopyWithImpl<$Res, UpdateProfileRequest>;
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) String? name,
    @JsonKey(includeIfNull: false) String? email,
  });
}

/// @nodoc
class _$UpdateProfileRequestCopyWithImpl<
  $Res,
  $Val extends UpdateProfileRequest
>
    implements $UpdateProfileRequestCopyWith<$Res> {
  _$UpdateProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = freezed, Object? email = freezed}) {
    return _then(
      _value.copyWith(
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateProfileRequestImplCopyWith<$Res>
    implements $UpdateProfileRequestCopyWith<$Res> {
  factory _$$UpdateProfileRequestImplCopyWith(
    _$UpdateProfileRequestImpl value,
    $Res Function(_$UpdateProfileRequestImpl) then,
  ) = __$$UpdateProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) String? name,
    @JsonKey(includeIfNull: false) String? email,
  });
}

/// @nodoc
class __$$UpdateProfileRequestImplCopyWithImpl<$Res>
    extends _$UpdateProfileRequestCopyWithImpl<$Res, _$UpdateProfileRequestImpl>
    implements _$$UpdateProfileRequestImplCopyWith<$Res> {
  __$$UpdateProfileRequestImplCopyWithImpl(
    _$UpdateProfileRequestImpl _value,
    $Res Function(_$UpdateProfileRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = freezed, Object? email = freezed}) {
    return _then(
      _$UpdateProfileRequestImpl(
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateProfileRequestImpl implements _UpdateProfileRequest {
  const _$UpdateProfileRequestImpl({
    @JsonKey(includeIfNull: false) this.name,
    @JsonKey(includeIfNull: false) this.email,
  });

  factory _$UpdateProfileRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateProfileRequestImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final String? name;
  @override
  @JsonKey(includeIfNull: false)
  final String? email;

  @override
  String toString() {
    return 'UpdateProfileRequest(name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email);

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileRequestImplCopyWith<_$UpdateProfileRequestImpl>
  get copyWith =>
      __$$UpdateProfileRequestImplCopyWithImpl<_$UpdateProfileRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateProfileRequestImplToJson(this);
  }
}

abstract class _UpdateProfileRequest implements UpdateProfileRequest {
  const factory _UpdateProfileRequest({
    @JsonKey(includeIfNull: false) final String? name,
    @JsonKey(includeIfNull: false) final String? email,
  }) = _$UpdateProfileRequestImpl;

  factory _UpdateProfileRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateProfileRequestImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  String? get name;
  @override
  @JsonKey(includeIfNull: false)
  String? get email;

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProfileRequestImplCopyWith<_$UpdateProfileRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
