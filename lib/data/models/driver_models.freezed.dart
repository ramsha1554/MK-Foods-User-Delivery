// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RegisterDriverRequest _$RegisterDriverRequestFromJson(
  Map<String, dynamic> json,
) {
  return _RegisterDriverRequest.fromJson(json);
}

/// @nodoc
mixin _$RegisterDriverRequest {
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicleType')
  String? get vehicleType => throw _privateConstructorUsedError;

  /// Serializes this RegisterDriverRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterDriverRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterDriverRequestCopyWith<RegisterDriverRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterDriverRequestCopyWith<$Res> {
  factory $RegisterDriverRequestCopyWith(
    RegisterDriverRequest value,
    $Res Function(RegisterDriverRequest) then,
  ) = _$RegisterDriverRequestCopyWithImpl<$Res, RegisterDriverRequest>;
  @useResult
  $Res call({String? name, @JsonKey(name: 'vehicleType') String? vehicleType});
}

/// @nodoc
class _$RegisterDriverRequestCopyWithImpl<
  $Res,
  $Val extends RegisterDriverRequest
>
    implements $RegisterDriverRequestCopyWith<$Res> {
  _$RegisterDriverRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterDriverRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = freezed, Object? vehicleType = freezed}) {
    return _then(
      _value.copyWith(
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            vehicleType: freezed == vehicleType
                ? _value.vehicleType
                : vehicleType // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegisterDriverRequestImplCopyWith<$Res>
    implements $RegisterDriverRequestCopyWith<$Res> {
  factory _$$RegisterDriverRequestImplCopyWith(
    _$RegisterDriverRequestImpl value,
    $Res Function(_$RegisterDriverRequestImpl) then,
  ) = __$$RegisterDriverRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, @JsonKey(name: 'vehicleType') String? vehicleType});
}

/// @nodoc
class __$$RegisterDriverRequestImplCopyWithImpl<$Res>
    extends
        _$RegisterDriverRequestCopyWithImpl<$Res, _$RegisterDriverRequestImpl>
    implements _$$RegisterDriverRequestImplCopyWith<$Res> {
  __$$RegisterDriverRequestImplCopyWithImpl(
    _$RegisterDriverRequestImpl _value,
    $Res Function(_$RegisterDriverRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterDriverRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = freezed, Object? vehicleType = freezed}) {
    return _then(
      _$RegisterDriverRequestImpl(
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        vehicleType: freezed == vehicleType
            ? _value.vehicleType
            : vehicleType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterDriverRequestImpl implements _RegisterDriverRequest {
  const _$RegisterDriverRequestImpl({
    this.name,
    @JsonKey(name: 'vehicleType') this.vehicleType,
  });

  factory _$RegisterDriverRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterDriverRequestImplFromJson(json);

  @override
  final String? name;
  @override
  @JsonKey(name: 'vehicleType')
  final String? vehicleType;

  @override
  String toString() {
    return 'RegisterDriverRequest(name: $name, vehicleType: $vehicleType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterDriverRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, vehicleType);

  /// Create a copy of RegisterDriverRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterDriverRequestImplCopyWith<_$RegisterDriverRequestImpl>
  get copyWith =>
      __$$RegisterDriverRequestImplCopyWithImpl<_$RegisterDriverRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterDriverRequestImplToJson(this);
  }
}

abstract class _RegisterDriverRequest implements RegisterDriverRequest {
  const factory _RegisterDriverRequest({
    final String? name,
    @JsonKey(name: 'vehicleType') final String? vehicleType,
  }) = _$RegisterDriverRequestImpl;

  factory _RegisterDriverRequest.fromJson(Map<String, dynamic> json) =
      _$RegisterDriverRequestImpl.fromJson;

  @override
  String? get name;
  @override
  @JsonKey(name: 'vehicleType')
  String? get vehicleType;

  /// Create a copy of RegisterDriverRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterDriverRequestImplCopyWith<_$RegisterDriverRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DriverProfile _$DriverProfileFromJson(Map<String, dynamic> json) {
  return _DriverProfile.fromJson(json);
}

/// @nodoc
mixin _$DriverProfile {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'driverStatus')
  String? get driverStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicleType')
  String? get vehicleType => throw _privateConstructorUsedError;
  @JsonKey(name: 'isVerified')
  bool? get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'isActive')
  bool? get isActive => throw _privateConstructorUsedError;

  /// Serializes this DriverProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriverProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverProfileCopyWith<DriverProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverProfileCopyWith<$Res> {
  factory $DriverProfileCopyWith(
    DriverProfile value,
    $Res Function(DriverProfile) then,
  ) = _$DriverProfileCopyWithImpl<$Res, DriverProfile>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String? phone,
    String? name,
    String? role,
    @JsonKey(name: 'driverStatus') String? driverStatus,
    @JsonKey(name: 'vehicleType') String? vehicleType,
    @JsonKey(name: 'isVerified') bool? isVerified,
    @JsonKey(name: 'isActive') bool? isActive,
  });
}

/// @nodoc
class _$DriverProfileCopyWithImpl<$Res, $Val extends DriverProfile>
    implements $DriverProfileCopyWith<$Res> {
  _$DriverProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phone = freezed,
    Object? name = freezed,
    Object? role = freezed,
    Object? driverStatus = freezed,
    Object? vehicleType = freezed,
    Object? isVerified = freezed,
    Object? isActive = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            role: freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String?,
            driverStatus: freezed == driverStatus
                ? _value.driverStatus
                : driverStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            vehicleType: freezed == vehicleType
                ? _value.vehicleType
                : vehicleType // ignore: cast_nullable_to_non_nullable
                      as String?,
            isVerified: freezed == isVerified
                ? _value.isVerified
                : isVerified // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isActive: freezed == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DriverProfileImplCopyWith<$Res>
    implements $DriverProfileCopyWith<$Res> {
  factory _$$DriverProfileImplCopyWith(
    _$DriverProfileImpl value,
    $Res Function(_$DriverProfileImpl) then,
  ) = __$$DriverProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String? phone,
    String? name,
    String? role,
    @JsonKey(name: 'driverStatus') String? driverStatus,
    @JsonKey(name: 'vehicleType') String? vehicleType,
    @JsonKey(name: 'isVerified') bool? isVerified,
    @JsonKey(name: 'isActive') bool? isActive,
  });
}

/// @nodoc
class __$$DriverProfileImplCopyWithImpl<$Res>
    extends _$DriverProfileCopyWithImpl<$Res, _$DriverProfileImpl>
    implements _$$DriverProfileImplCopyWith<$Res> {
  __$$DriverProfileImplCopyWithImpl(
    _$DriverProfileImpl _value,
    $Res Function(_$DriverProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DriverProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phone = freezed,
    Object? name = freezed,
    Object? role = freezed,
    Object? driverStatus = freezed,
    Object? vehicleType = freezed,
    Object? isVerified = freezed,
    Object? isActive = freezed,
  }) {
    return _then(
      _$DriverProfileImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        role: freezed == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String?,
        driverStatus: freezed == driverStatus
            ? _value.driverStatus
            : driverStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        vehicleType: freezed == vehicleType
            ? _value.vehicleType
            : vehicleType // ignore: cast_nullable_to_non_nullable
                  as String?,
        isVerified: freezed == isVerified
            ? _value.isVerified
            : isVerified // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isActive: freezed == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverProfileImpl implements _DriverProfile {
  const _$DriverProfileImpl({
    @JsonKey(name: '_id') required this.id,
    this.phone,
    this.name,
    this.role,
    @JsonKey(name: 'driverStatus') this.driverStatus,
    @JsonKey(name: 'vehicleType') this.vehicleType,
    @JsonKey(name: 'isVerified') this.isVerified,
    @JsonKey(name: 'isActive') this.isActive,
  });

  factory _$DriverProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverProfileImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String? phone;
  @override
  final String? name;
  @override
  final String? role;
  @override
  @JsonKey(name: 'driverStatus')
  final String? driverStatus;
  @override
  @JsonKey(name: 'vehicleType')
  final String? vehicleType;
  @override
  @JsonKey(name: 'isVerified')
  final bool? isVerified;
  @override
  @JsonKey(name: 'isActive')
  final bool? isActive;

  @override
  String toString() {
    return 'DriverProfile(id: $id, phone: $phone, name: $name, role: $role, driverStatus: $driverStatus, vehicleType: $vehicleType, isVerified: $isVerified, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.driverStatus, driverStatus) ||
                other.driverStatus == driverStatus) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    phone,
    name,
    role,
    driverStatus,
    vehicleType,
    isVerified,
    isActive,
  );

  /// Create a copy of DriverProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverProfileImplCopyWith<_$DriverProfileImpl> get copyWith =>
      __$$DriverProfileImplCopyWithImpl<_$DriverProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverProfileImplToJson(this);
  }
}

abstract class _DriverProfile implements DriverProfile {
  const factory _DriverProfile({
    @JsonKey(name: '_id') required final String id,
    final String? phone,
    final String? name,
    final String? role,
    @JsonKey(name: 'driverStatus') final String? driverStatus,
    @JsonKey(name: 'vehicleType') final String? vehicleType,
    @JsonKey(name: 'isVerified') final bool? isVerified,
    @JsonKey(name: 'isActive') final bool? isActive,
  }) = _$DriverProfileImpl;

  factory _DriverProfile.fromJson(Map<String, dynamic> json) =
      _$DriverProfileImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String? get phone;
  @override
  String? get name;
  @override
  String? get role;
  @override
  @JsonKey(name: 'driverStatus')
  String? get driverStatus;
  @override
  @JsonKey(name: 'vehicleType')
  String? get vehicleType;
  @override
  @JsonKey(name: 'isVerified')
  bool? get isVerified;
  @override
  @JsonKey(name: 'isActive')
  bool? get isActive;

  /// Create a copy of DriverProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverProfileImplCopyWith<_$DriverProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return _Document.fromJson(json);
}

/// @nodoc
mixin _$Document {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String? get driver => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'fileUrl')
  String? get fileUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'originalName')
  String? get originalName => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'adminNote')
  String? get adminNote => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Document to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentCopyWith<Document> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentCopyWith<$Res> {
  factory $DocumentCopyWith(Document value, $Res Function(Document) then) =
      _$DocumentCopyWithImpl<$Res, Document>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String? driver,
    String? type,
    @JsonKey(name: 'fileUrl') String? fileUrl,
    @JsonKey(name: 'originalName') String? originalName,
    String? status,
    @JsonKey(name: 'adminNote') String? adminNote,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  });
}

/// @nodoc
class _$DocumentCopyWithImpl<$Res, $Val extends Document>
    implements $DocumentCopyWith<$Res> {
  _$DocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driver = freezed,
    Object? type = freezed,
    Object? fileUrl = freezed,
    Object? originalName = freezed,
    Object? status = freezed,
    Object? adminNote = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            driver: freezed == driver
                ? _value.driver
                : driver // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            fileUrl: freezed == fileUrl
                ? _value.fileUrl
                : fileUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            originalName: freezed == originalName
                ? _value.originalName
                : originalName // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            adminNote: freezed == adminNote
                ? _value.adminNote
                : adminNote // ignore: cast_nullable_to_non_nullable
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
}

/// @nodoc
abstract class _$$DocumentImplCopyWith<$Res>
    implements $DocumentCopyWith<$Res> {
  factory _$$DocumentImplCopyWith(
    _$DocumentImpl value,
    $Res Function(_$DocumentImpl) then,
  ) = __$$DocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String? driver,
    String? type,
    @JsonKey(name: 'fileUrl') String? fileUrl,
    @JsonKey(name: 'originalName') String? originalName,
    String? status,
    @JsonKey(name: 'adminNote') String? adminNote,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  });
}

/// @nodoc
class __$$DocumentImplCopyWithImpl<$Res>
    extends _$DocumentCopyWithImpl<$Res, _$DocumentImpl>
    implements _$$DocumentImplCopyWith<$Res> {
  __$$DocumentImplCopyWithImpl(
    _$DocumentImpl _value,
    $Res Function(_$DocumentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driver = freezed,
    Object? type = freezed,
    Object? fileUrl = freezed,
    Object? originalName = freezed,
    Object? status = freezed,
    Object? adminNote = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$DocumentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        driver: freezed == driver
            ? _value.driver
            : driver // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileUrl: freezed == fileUrl
            ? _value.fileUrl
            : fileUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        originalName: freezed == originalName
            ? _value.originalName
            : originalName // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        adminNote: freezed == adminNote
            ? _value.adminNote
            : adminNote // ignore: cast_nullable_to_non_nullable
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
class _$DocumentImpl implements _Document {
  const _$DocumentImpl({
    @JsonKey(name: '_id') required this.id,
    this.driver,
    this.type,
    @JsonKey(name: 'fileUrl') this.fileUrl,
    @JsonKey(name: 'originalName') this.originalName,
    this.status,
    @JsonKey(name: 'adminNote') this.adminNote,
    @JsonKey(name: 'createdAt') this.createdAt,
    @JsonKey(name: 'updatedAt') this.updatedAt,
  });

  factory _$DocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String? driver;
  @override
  final String? type;
  @override
  @JsonKey(name: 'fileUrl')
  final String? fileUrl;
  @override
  @JsonKey(name: 'originalName')
  final String? originalName;
  @override
  final String? status;
  @override
  @JsonKey(name: 'adminNote')
  final String? adminNote;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Document(id: $id, driver: $driver, type: $type, fileUrl: $fileUrl, originalName: $originalName, status: $status, adminNote: $adminNote, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.driver, driver) || other.driver == driver) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.adminNote, adminNote) ||
                other.adminNote == adminNote) &&
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
    driver,
    type,
    fileUrl,
    originalName,
    status,
    adminNote,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentImplCopyWith<_$DocumentImpl> get copyWith =>
      __$$DocumentImplCopyWithImpl<_$DocumentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentImplToJson(this);
  }
}

abstract class _Document implements Document {
  const factory _Document({
    @JsonKey(name: '_id') required final String id,
    final String? driver,
    final String? type,
    @JsonKey(name: 'fileUrl') final String? fileUrl,
    @JsonKey(name: 'originalName') final String? originalName,
    final String? status,
    @JsonKey(name: 'adminNote') final String? adminNote,
    @JsonKey(name: 'createdAt') final DateTime? createdAt,
    @JsonKey(name: 'updatedAt') final DateTime? updatedAt,
  }) = _$DocumentImpl;

  factory _Document.fromJson(Map<String, dynamic> json) =
      _$DocumentImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String? get driver;
  @override
  String? get type;
  @override
  @JsonKey(name: 'fileUrl')
  String? get fileUrl;
  @override
  @JsonKey(name: 'originalName')
  String? get originalName;
  @override
  String? get status;
  @override
  @JsonKey(name: 'adminNote')
  String? get adminNote;
  @override
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt;

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentImplCopyWith<_$DocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ToggleOnlineResponse _$ToggleOnlineResponseFromJson(Map<String, dynamic> json) {
  return _ToggleOnlineResponse.fromJson(json);
}

/// @nodoc
mixin _$ToggleOnlineResponse {
  @JsonKey(name: 'isOnline')
  bool get isOnline => throw _privateConstructorUsedError;

  /// Serializes this ToggleOnlineResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ToggleOnlineResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ToggleOnlineResponseCopyWith<ToggleOnlineResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToggleOnlineResponseCopyWith<$Res> {
  factory $ToggleOnlineResponseCopyWith(
    ToggleOnlineResponse value,
    $Res Function(ToggleOnlineResponse) then,
  ) = _$ToggleOnlineResponseCopyWithImpl<$Res, ToggleOnlineResponse>;
  @useResult
  $Res call({@JsonKey(name: 'isOnline') bool isOnline});
}

/// @nodoc
class _$ToggleOnlineResponseCopyWithImpl<
  $Res,
  $Val extends ToggleOnlineResponse
>
    implements $ToggleOnlineResponseCopyWith<$Res> {
  _$ToggleOnlineResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ToggleOnlineResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isOnline = null}) {
    return _then(
      _value.copyWith(
            isOnline: null == isOnline
                ? _value.isOnline
                : isOnline // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ToggleOnlineResponseImplCopyWith<$Res>
    implements $ToggleOnlineResponseCopyWith<$Res> {
  factory _$$ToggleOnlineResponseImplCopyWith(
    _$ToggleOnlineResponseImpl value,
    $Res Function(_$ToggleOnlineResponseImpl) then,
  ) = __$$ToggleOnlineResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'isOnline') bool isOnline});
}

/// @nodoc
class __$$ToggleOnlineResponseImplCopyWithImpl<$Res>
    extends _$ToggleOnlineResponseCopyWithImpl<$Res, _$ToggleOnlineResponseImpl>
    implements _$$ToggleOnlineResponseImplCopyWith<$Res> {
  __$$ToggleOnlineResponseImplCopyWithImpl(
    _$ToggleOnlineResponseImpl _value,
    $Res Function(_$ToggleOnlineResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ToggleOnlineResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isOnline = null}) {
    return _then(
      _$ToggleOnlineResponseImpl(
        isOnline: null == isOnline
            ? _value.isOnline
            : isOnline // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ToggleOnlineResponseImpl implements _ToggleOnlineResponse {
  const _$ToggleOnlineResponseImpl({
    @JsonKey(name: 'isOnline') required this.isOnline,
  });

  factory _$ToggleOnlineResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToggleOnlineResponseImplFromJson(json);

  @override
  @JsonKey(name: 'isOnline')
  final bool isOnline;

  @override
  String toString() {
    return 'ToggleOnlineResponse(isOnline: $isOnline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleOnlineResponseImpl &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isOnline);

  /// Create a copy of ToggleOnlineResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleOnlineResponseImplCopyWith<_$ToggleOnlineResponseImpl>
  get copyWith =>
      __$$ToggleOnlineResponseImplCopyWithImpl<_$ToggleOnlineResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ToggleOnlineResponseImplToJson(this);
  }
}

abstract class _ToggleOnlineResponse implements ToggleOnlineResponse {
  const factory _ToggleOnlineResponse({
    @JsonKey(name: 'isOnline') required final bool isOnline,
  }) = _$ToggleOnlineResponseImpl;

  factory _ToggleOnlineResponse.fromJson(Map<String, dynamic> json) =
      _$ToggleOnlineResponseImpl.fromJson;

  @override
  @JsonKey(name: 'isOnline')
  bool get isOnline;

  /// Create a copy of ToggleOnlineResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleOnlineResponseImplCopyWith<_$ToggleOnlineResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

LocationUpdateRequest _$LocationUpdateRequestFromJson(
  Map<String, dynamic> json,
) {
  return _LocationUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$LocationUpdateRequest {
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;

  /// Serializes this LocationUpdateRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationUpdateRequestCopyWith<LocationUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationUpdateRequestCopyWith<$Res> {
  factory $LocationUpdateRequestCopyWith(
    LocationUpdateRequest value,
    $Res Function(LocationUpdateRequest) then,
  ) = _$LocationUpdateRequestCopyWithImpl<$Res, LocationUpdateRequest>;
  @useResult
  $Res call({double longitude, double latitude});
}

/// @nodoc
class _$LocationUpdateRequestCopyWithImpl<
  $Res,
  $Val extends LocationUpdateRequest
>
    implements $LocationUpdateRequestCopyWith<$Res> {
  _$LocationUpdateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? longitude = null, Object? latitude = null}) {
    return _then(
      _value.copyWith(
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocationUpdateRequestImplCopyWith<$Res>
    implements $LocationUpdateRequestCopyWith<$Res> {
  factory _$$LocationUpdateRequestImplCopyWith(
    _$LocationUpdateRequestImpl value,
    $Res Function(_$LocationUpdateRequestImpl) then,
  ) = __$$LocationUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double longitude, double latitude});
}

/// @nodoc
class __$$LocationUpdateRequestImplCopyWithImpl<$Res>
    extends
        _$LocationUpdateRequestCopyWithImpl<$Res, _$LocationUpdateRequestImpl>
    implements _$$LocationUpdateRequestImplCopyWith<$Res> {
  __$$LocationUpdateRequestImplCopyWithImpl(
    _$LocationUpdateRequestImpl _value,
    $Res Function(_$LocationUpdateRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? longitude = null, Object? latitude = null}) {
    return _then(
      _$LocationUpdateRequestImpl(
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationUpdateRequestImpl implements _LocationUpdateRequest {
  const _$LocationUpdateRequestImpl({
    required this.longitude,
    required this.latitude,
  });

  factory _$LocationUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationUpdateRequestImplFromJson(json);

  @override
  final double longitude;
  @override
  final double latitude;

  @override
  String toString() {
    return 'LocationUpdateRequest(longitude: $longitude, latitude: $latitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationUpdateRequestImpl &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, longitude, latitude);

  /// Create a copy of LocationUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationUpdateRequestImplCopyWith<_$LocationUpdateRequestImpl>
  get copyWith =>
      __$$LocationUpdateRequestImplCopyWithImpl<_$LocationUpdateRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationUpdateRequestImplToJson(this);
  }
}

abstract class _LocationUpdateRequest implements LocationUpdateRequest {
  const factory _LocationUpdateRequest({
    required final double longitude,
    required final double latitude,
  }) = _$LocationUpdateRequestImpl;

  factory _LocationUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$LocationUpdateRequestImpl.fromJson;

  @override
  double get longitude;
  @override
  double get latitude;

  /// Create a copy of LocationUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationUpdateRequestImplCopyWith<_$LocationUpdateRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

LocationUpdateResponse _$LocationUpdateResponseFromJson(
  Map<String, dynamic> json,
) {
  return _LocationUpdateResponse.fromJson(json);
}

/// @nodoc
mixin _$LocationUpdateResponse {
  @JsonKey(name: 'currentLocation')
  GeoPoint? get currentLocation => throw _privateConstructorUsedError;

  /// Serializes this LocationUpdateResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationUpdateResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationUpdateResponseCopyWith<LocationUpdateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationUpdateResponseCopyWith<$Res> {
  factory $LocationUpdateResponseCopyWith(
    LocationUpdateResponse value,
    $Res Function(LocationUpdateResponse) then,
  ) = _$LocationUpdateResponseCopyWithImpl<$Res, LocationUpdateResponse>;
  @useResult
  $Res call({@JsonKey(name: 'currentLocation') GeoPoint? currentLocation});

  $GeoPointCopyWith<$Res>? get currentLocation;
}

/// @nodoc
class _$LocationUpdateResponseCopyWithImpl<
  $Res,
  $Val extends LocationUpdateResponse
>
    implements $LocationUpdateResponseCopyWith<$Res> {
  _$LocationUpdateResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationUpdateResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? currentLocation = freezed}) {
    return _then(
      _value.copyWith(
            currentLocation: freezed == currentLocation
                ? _value.currentLocation
                : currentLocation // ignore: cast_nullable_to_non_nullable
                      as GeoPoint?,
          )
          as $Val,
    );
  }

  /// Create a copy of LocationUpdateResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoPointCopyWith<$Res>? get currentLocation {
    if (_value.currentLocation == null) {
      return null;
    }

    return $GeoPointCopyWith<$Res>(_value.currentLocation!, (value) {
      return _then(_value.copyWith(currentLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocationUpdateResponseImplCopyWith<$Res>
    implements $LocationUpdateResponseCopyWith<$Res> {
  factory _$$LocationUpdateResponseImplCopyWith(
    _$LocationUpdateResponseImpl value,
    $Res Function(_$LocationUpdateResponseImpl) then,
  ) = __$$LocationUpdateResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'currentLocation') GeoPoint? currentLocation});

  @override
  $GeoPointCopyWith<$Res>? get currentLocation;
}

/// @nodoc
class __$$LocationUpdateResponseImplCopyWithImpl<$Res>
    extends
        _$LocationUpdateResponseCopyWithImpl<$Res, _$LocationUpdateResponseImpl>
    implements _$$LocationUpdateResponseImplCopyWith<$Res> {
  __$$LocationUpdateResponseImplCopyWithImpl(
    _$LocationUpdateResponseImpl _value,
    $Res Function(_$LocationUpdateResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationUpdateResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? currentLocation = freezed}) {
    return _then(
      _$LocationUpdateResponseImpl(
        currentLocation: freezed == currentLocation
            ? _value.currentLocation
            : currentLocation // ignore: cast_nullable_to_non_nullable
                  as GeoPoint?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationUpdateResponseImpl implements _LocationUpdateResponse {
  const _$LocationUpdateResponseImpl({
    @JsonKey(name: 'currentLocation') this.currentLocation,
  });

  factory _$LocationUpdateResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationUpdateResponseImplFromJson(json);

  @override
  @JsonKey(name: 'currentLocation')
  final GeoPoint? currentLocation;

  @override
  String toString() {
    return 'LocationUpdateResponse(currentLocation: $currentLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationUpdateResponseImpl &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentLocation);

  /// Create a copy of LocationUpdateResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationUpdateResponseImplCopyWith<_$LocationUpdateResponseImpl>
  get copyWith =>
      __$$LocationUpdateResponseImplCopyWithImpl<_$LocationUpdateResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationUpdateResponseImplToJson(this);
  }
}

abstract class _LocationUpdateResponse implements LocationUpdateResponse {
  const factory _LocationUpdateResponse({
    @JsonKey(name: 'currentLocation') final GeoPoint? currentLocation,
  }) = _$LocationUpdateResponseImpl;

  factory _LocationUpdateResponse.fromJson(Map<String, dynamic> json) =
      _$LocationUpdateResponseImpl.fromJson;

  @override
  @JsonKey(name: 'currentLocation')
  GeoPoint? get currentLocation;

  /// Create a copy of LocationUpdateResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationUpdateResponseImplCopyWith<_$LocationUpdateResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DriverOrderCustomer _$DriverOrderCustomerFromJson(Map<String, dynamic> json) {
  return _DriverOrderCustomer.fromJson(json);
}

/// @nodoc
mixin _$DriverOrderCustomer {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  /// Serializes this DriverOrderCustomer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriverOrderCustomer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverOrderCustomerCopyWith<DriverOrderCustomer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverOrderCustomerCopyWith<$Res> {
  factory $DriverOrderCustomerCopyWith(
    DriverOrderCustomer value,
    $Res Function(DriverOrderCustomer) then,
  ) = _$DriverOrderCustomerCopyWithImpl<$Res, DriverOrderCustomer>;
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, String? name, String? phone});
}

/// @nodoc
class _$DriverOrderCustomerCopyWithImpl<$Res, $Val extends DriverOrderCustomer>
    implements $DriverOrderCustomerCopyWith<$Res> {
  _$DriverOrderCustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverOrderCustomer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
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
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DriverOrderCustomerImplCopyWith<$Res>
    implements $DriverOrderCustomerCopyWith<$Res> {
  factory _$$DriverOrderCustomerImplCopyWith(
    _$DriverOrderCustomerImpl value,
    $Res Function(_$DriverOrderCustomerImpl) then,
  ) = __$$DriverOrderCustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, String? name, String? phone});
}

/// @nodoc
class __$$DriverOrderCustomerImplCopyWithImpl<$Res>
    extends _$DriverOrderCustomerCopyWithImpl<$Res, _$DriverOrderCustomerImpl>
    implements _$$DriverOrderCustomerImplCopyWith<$Res> {
  __$$DriverOrderCustomerImplCopyWithImpl(
    _$DriverOrderCustomerImpl _value,
    $Res Function(_$DriverOrderCustomerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DriverOrderCustomer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
  }) {
    return _then(
      _$DriverOrderCustomerImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverOrderCustomerImpl implements _DriverOrderCustomer {
  const _$DriverOrderCustomerImpl({
    @JsonKey(name: '_id') this.id,
    this.name,
    this.phone,
  });

  factory _$DriverOrderCustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverOrderCustomerImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  @override
  final String? phone;

  @override
  String toString() {
    return 'DriverOrderCustomer(id: $id, name: $name, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverOrderCustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, phone);

  /// Create a copy of DriverOrderCustomer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverOrderCustomerImplCopyWith<_$DriverOrderCustomerImpl> get copyWith =>
      __$$DriverOrderCustomerImplCopyWithImpl<_$DriverOrderCustomerImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverOrderCustomerImplToJson(this);
  }
}

abstract class _DriverOrderCustomer implements DriverOrderCustomer {
  const factory _DriverOrderCustomer({
    @JsonKey(name: '_id') final String? id,
    final String? name,
    final String? phone,
  }) = _$DriverOrderCustomerImpl;

  factory _DriverOrderCustomer.fromJson(Map<String, dynamic> json) =
      _$DriverOrderCustomerImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;
  @override
  String? get phone;

  /// Create a copy of DriverOrderCustomer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverOrderCustomerImplCopyWith<_$DriverOrderCustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DriverOrderRestaurant _$DriverOrderRestaurantFromJson(
  Map<String, dynamic> json,
) {
  return _DriverOrderRestaurant.fromJson(json);
}

/// @nodoc
mixin _$DriverOrderRestaurant {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  RestaurantAddress? get address => throw _privateConstructorUsedError;
  GeoPoint? get location => throw _privateConstructorUsedError;

  /// Serializes this DriverOrderRestaurant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriverOrderRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverOrderRestaurantCopyWith<DriverOrderRestaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverOrderRestaurantCopyWith<$Res> {
  factory $DriverOrderRestaurantCopyWith(
    DriverOrderRestaurant value,
    $Res Function(DriverOrderRestaurant) then,
  ) = _$DriverOrderRestaurantCopyWithImpl<$Res, DriverOrderRestaurant>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? phone,
    RestaurantAddress? address,
    GeoPoint? location,
  });

  $RestaurantAddressCopyWith<$Res>? get address;
  $GeoPointCopyWith<$Res>? get location;
}

/// @nodoc
class _$DriverOrderRestaurantCopyWithImpl<
  $Res,
  $Val extends DriverOrderRestaurant
>
    implements $DriverOrderRestaurantCopyWith<$Res> {
  _$DriverOrderRestaurantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverOrderRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? location = freezed,
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
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as RestaurantAddress?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as GeoPoint?,
          )
          as $Val,
    );
  }

  /// Create a copy of DriverOrderRestaurant
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

  /// Create a copy of DriverOrderRestaurant
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
abstract class _$$DriverOrderRestaurantImplCopyWith<$Res>
    implements $DriverOrderRestaurantCopyWith<$Res> {
  factory _$$DriverOrderRestaurantImplCopyWith(
    _$DriverOrderRestaurantImpl value,
    $Res Function(_$DriverOrderRestaurantImpl) then,
  ) = __$$DriverOrderRestaurantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? phone,
    RestaurantAddress? address,
    GeoPoint? location,
  });

  @override
  $RestaurantAddressCopyWith<$Res>? get address;
  @override
  $GeoPointCopyWith<$Res>? get location;
}

/// @nodoc
class __$$DriverOrderRestaurantImplCopyWithImpl<$Res>
    extends
        _$DriverOrderRestaurantCopyWithImpl<$Res, _$DriverOrderRestaurantImpl>
    implements _$$DriverOrderRestaurantImplCopyWith<$Res> {
  __$$DriverOrderRestaurantImplCopyWithImpl(
    _$DriverOrderRestaurantImpl _value,
    $Res Function(_$DriverOrderRestaurantImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DriverOrderRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? location = freezed,
  }) {
    return _then(
      _$DriverOrderRestaurantImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as RestaurantAddress?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as GeoPoint?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverOrderRestaurantImpl implements _DriverOrderRestaurant {
  const _$DriverOrderRestaurantImpl({
    @JsonKey(name: '_id') this.id,
    this.name,
    this.phone,
    this.address,
    this.location,
  });

  factory _$DriverOrderRestaurantImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverOrderRestaurantImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  final RestaurantAddress? address;
  @override
  final GeoPoint? location;

  @override
  String toString() {
    return 'DriverOrderRestaurant(id: $id, name: $name, phone: $phone, address: $address, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverOrderRestaurantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, phone, address, location);

  /// Create a copy of DriverOrderRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverOrderRestaurantImplCopyWith<_$DriverOrderRestaurantImpl>
  get copyWith =>
      __$$DriverOrderRestaurantImplCopyWithImpl<_$DriverOrderRestaurantImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverOrderRestaurantImplToJson(this);
  }
}

abstract class _DriverOrderRestaurant implements DriverOrderRestaurant {
  const factory _DriverOrderRestaurant({
    @JsonKey(name: '_id') final String? id,
    final String? name,
    final String? phone,
    final RestaurantAddress? address,
    final GeoPoint? location,
  }) = _$DriverOrderRestaurantImpl;

  factory _DriverOrderRestaurant.fromJson(Map<String, dynamic> json) =
      _$DriverOrderRestaurantImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;
  @override
  String? get phone;
  @override
  RestaurantAddress? get address;
  @override
  GeoPoint? get location;

  /// Create a copy of DriverOrderRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverOrderRestaurantImplCopyWith<_$DriverOrderRestaurantImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DriverActiveOrder _$DriverActiveOrderFromJson(Map<String, dynamic> json) {
  return _DriverActiveOrder.fromJson(json);
}

/// @nodoc
mixin _$DriverActiveOrder {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderNumber')
  String get orderNumber => throw _privateConstructorUsedError;
  DriverOrderCustomer? get customer => throw _privateConstructorUsedError;
  DriverOrderRestaurant? get restaurant => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryAddress')
  DeliveryAddressInfo? get deliveryAddress =>
      throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'specialInstructions')
  String? get specialInstructions => throw _privateConstructorUsedError;

  /// Serializes this DriverActiveOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriverActiveOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverActiveOrderCopyWith<DriverActiveOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverActiveOrderCopyWith<$Res> {
  factory $DriverActiveOrderCopyWith(
    DriverActiveOrder value,
    $Res Function(DriverActiveOrder) then,
  ) = _$DriverActiveOrderCopyWithImpl<$Res, DriverActiveOrder>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'orderNumber') String orderNumber,
    DriverOrderCustomer? customer,
    DriverOrderRestaurant? restaurant,
    @JsonKey(name: 'deliveryAddress') DeliveryAddressInfo? deliveryAddress,
    String? status,
    double? total,
    @JsonKey(name: 'specialInstructions') String? specialInstructions,
  });

  $DriverOrderCustomerCopyWith<$Res>? get customer;
  $DriverOrderRestaurantCopyWith<$Res>? get restaurant;
  $DeliveryAddressInfoCopyWith<$Res>? get deliveryAddress;
}

/// @nodoc
class _$DriverActiveOrderCopyWithImpl<$Res, $Val extends DriverActiveOrder>
    implements $DriverActiveOrderCopyWith<$Res> {
  _$DriverActiveOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverActiveOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? customer = freezed,
    Object? restaurant = freezed,
    Object? deliveryAddress = freezed,
    Object? status = freezed,
    Object? total = freezed,
    Object? specialInstructions = freezed,
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
                      as DriverOrderCustomer?,
            restaurant: freezed == restaurant
                ? _value.restaurant
                : restaurant // ignore: cast_nullable_to_non_nullable
                      as DriverOrderRestaurant?,
            deliveryAddress: freezed == deliveryAddress
                ? _value.deliveryAddress
                : deliveryAddress // ignore: cast_nullable_to_non_nullable
                      as DeliveryAddressInfo?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            total: freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double?,
            specialInstructions: freezed == specialInstructions
                ? _value.specialInstructions
                : specialInstructions // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of DriverActiveOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DriverOrderCustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $DriverOrderCustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  /// Create a copy of DriverActiveOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DriverOrderRestaurantCopyWith<$Res>? get restaurant {
    if (_value.restaurant == null) {
      return null;
    }

    return $DriverOrderRestaurantCopyWith<$Res>(_value.restaurant!, (value) {
      return _then(_value.copyWith(restaurant: value) as $Val);
    });
  }

  /// Create a copy of DriverActiveOrder
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
abstract class _$$DriverActiveOrderImplCopyWith<$Res>
    implements $DriverActiveOrderCopyWith<$Res> {
  factory _$$DriverActiveOrderImplCopyWith(
    _$DriverActiveOrderImpl value,
    $Res Function(_$DriverActiveOrderImpl) then,
  ) = __$$DriverActiveOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'orderNumber') String orderNumber,
    DriverOrderCustomer? customer,
    DriverOrderRestaurant? restaurant,
    @JsonKey(name: 'deliveryAddress') DeliveryAddressInfo? deliveryAddress,
    String? status,
    double? total,
    @JsonKey(name: 'specialInstructions') String? specialInstructions,
  });

  @override
  $DriverOrderCustomerCopyWith<$Res>? get customer;
  @override
  $DriverOrderRestaurantCopyWith<$Res>? get restaurant;
  @override
  $DeliveryAddressInfoCopyWith<$Res>? get deliveryAddress;
}

/// @nodoc
class __$$DriverActiveOrderImplCopyWithImpl<$Res>
    extends _$DriverActiveOrderCopyWithImpl<$Res, _$DriverActiveOrderImpl>
    implements _$$DriverActiveOrderImplCopyWith<$Res> {
  __$$DriverActiveOrderImplCopyWithImpl(
    _$DriverActiveOrderImpl _value,
    $Res Function(_$DriverActiveOrderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DriverActiveOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? customer = freezed,
    Object? restaurant = freezed,
    Object? deliveryAddress = freezed,
    Object? status = freezed,
    Object? total = freezed,
    Object? specialInstructions = freezed,
  }) {
    return _then(
      _$DriverActiveOrderImpl(
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
                  as DriverOrderCustomer?,
        restaurant: freezed == restaurant
            ? _value.restaurant
            : restaurant // ignore: cast_nullable_to_non_nullable
                  as DriverOrderRestaurant?,
        deliveryAddress: freezed == deliveryAddress
            ? _value.deliveryAddress
            : deliveryAddress // ignore: cast_nullable_to_non_nullable
                  as DeliveryAddressInfo?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        total: freezed == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double?,
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
class _$DriverActiveOrderImpl implements _DriverActiveOrder {
  const _$DriverActiveOrderImpl({
    @JsonKey(name: '_id') required this.id,
    @JsonKey(name: 'orderNumber') required this.orderNumber,
    this.customer,
    this.restaurant,
    @JsonKey(name: 'deliveryAddress') this.deliveryAddress,
    this.status,
    this.total,
    @JsonKey(name: 'specialInstructions') this.specialInstructions,
  });

  factory _$DriverActiveOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverActiveOrderImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'orderNumber')
  final String orderNumber;
  @override
  final DriverOrderCustomer? customer;
  @override
  final DriverOrderRestaurant? restaurant;
  @override
  @JsonKey(name: 'deliveryAddress')
  final DeliveryAddressInfo? deliveryAddress;
  @override
  final String? status;
  @override
  final double? total;
  @override
  @JsonKey(name: 'specialInstructions')
  final String? specialInstructions;

  @override
  String toString() {
    return 'DriverActiveOrder(id: $id, orderNumber: $orderNumber, customer: $customer, restaurant: $restaurant, deliveryAddress: $deliveryAddress, status: $status, total: $total, specialInstructions: $specialInstructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverActiveOrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.restaurant, restaurant) ||
                other.restaurant == restaurant) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    orderNumber,
    customer,
    restaurant,
    deliveryAddress,
    status,
    total,
    specialInstructions,
  );

  /// Create a copy of DriverActiveOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverActiveOrderImplCopyWith<_$DriverActiveOrderImpl> get copyWith =>
      __$$DriverActiveOrderImplCopyWithImpl<_$DriverActiveOrderImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverActiveOrderImplToJson(this);
  }
}

abstract class _DriverActiveOrder implements DriverActiveOrder {
  const factory _DriverActiveOrder({
    @JsonKey(name: '_id') required final String id,
    @JsonKey(name: 'orderNumber') required final String orderNumber,
    final DriverOrderCustomer? customer,
    final DriverOrderRestaurant? restaurant,
    @JsonKey(name: 'deliveryAddress')
    final DeliveryAddressInfo? deliveryAddress,
    final String? status,
    final double? total,
    @JsonKey(name: 'specialInstructions') final String? specialInstructions,
  }) = _$DriverActiveOrderImpl;

  factory _DriverActiveOrder.fromJson(Map<String, dynamic> json) =
      _$DriverActiveOrderImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'orderNumber')
  String get orderNumber;
  @override
  DriverOrderCustomer? get customer;
  @override
  DriverOrderRestaurant? get restaurant;
  @override
  @JsonKey(name: 'deliveryAddress')
  DeliveryAddressInfo? get deliveryAddress;
  @override
  String? get status;
  @override
  double? get total;
  @override
  @JsonKey(name: 'specialInstructions')
  String? get specialInstructions;

  /// Create a copy of DriverActiveOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverActiveOrderImplCopyWith<_$DriverActiveOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DriverOrderHistoryItem _$DriverOrderHistoryItemFromJson(
  Map<String, dynamic> json,
) {
  return _DriverOrderHistoryItem.fromJson(json);
}

/// @nodoc
mixin _$DriverOrderHistoryItem {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderNumber')
  String get orderNumber => throw _privateConstructorUsedError;
  DriverOrderHistoryRestaurant? get restaurant =>
      throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this DriverOrderHistoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriverOrderHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverOrderHistoryItemCopyWith<DriverOrderHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverOrderHistoryItemCopyWith<$Res> {
  factory $DriverOrderHistoryItemCopyWith(
    DriverOrderHistoryItem value,
    $Res Function(DriverOrderHistoryItem) then,
  ) = _$DriverOrderHistoryItemCopyWithImpl<$Res, DriverOrderHistoryItem>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'orderNumber') String orderNumber,
    DriverOrderHistoryRestaurant? restaurant,
    String? status,
    double? total,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
  });

  $DriverOrderHistoryRestaurantCopyWith<$Res>? get restaurant;
}

/// @nodoc
class _$DriverOrderHistoryItemCopyWithImpl<
  $Res,
  $Val extends DriverOrderHistoryItem
>
    implements $DriverOrderHistoryItemCopyWith<$Res> {
  _$DriverOrderHistoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverOrderHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? restaurant = freezed,
    Object? status = freezed,
    Object? total = freezed,
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
                      as DriverOrderHistoryRestaurant?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            total: freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of DriverOrderHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DriverOrderHistoryRestaurantCopyWith<$Res>? get restaurant {
    if (_value.restaurant == null) {
      return null;
    }

    return $DriverOrderHistoryRestaurantCopyWith<$Res>(_value.restaurant!, (
      value,
    ) {
      return _then(_value.copyWith(restaurant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DriverOrderHistoryItemImplCopyWith<$Res>
    implements $DriverOrderHistoryItemCopyWith<$Res> {
  factory _$$DriverOrderHistoryItemImplCopyWith(
    _$DriverOrderHistoryItemImpl value,
    $Res Function(_$DriverOrderHistoryItemImpl) then,
  ) = __$$DriverOrderHistoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'orderNumber') String orderNumber,
    DriverOrderHistoryRestaurant? restaurant,
    String? status,
    double? total,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
  });

  @override
  $DriverOrderHistoryRestaurantCopyWith<$Res>? get restaurant;
}

/// @nodoc
class __$$DriverOrderHistoryItemImplCopyWithImpl<$Res>
    extends
        _$DriverOrderHistoryItemCopyWithImpl<$Res, _$DriverOrderHistoryItemImpl>
    implements _$$DriverOrderHistoryItemImplCopyWith<$Res> {
  __$$DriverOrderHistoryItemImplCopyWithImpl(
    _$DriverOrderHistoryItemImpl _value,
    $Res Function(_$DriverOrderHistoryItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DriverOrderHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? restaurant = freezed,
    Object? status = freezed,
    Object? total = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$DriverOrderHistoryItemImpl(
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
                  as DriverOrderHistoryRestaurant?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        total: freezed == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double?,
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
class _$DriverOrderHistoryItemImpl implements _DriverOrderHistoryItem {
  const _$DriverOrderHistoryItemImpl({
    @JsonKey(name: '_id') required this.id,
    @JsonKey(name: 'orderNumber') required this.orderNumber,
    this.restaurant,
    this.status,
    this.total,
    @JsonKey(name: 'createdAt') this.createdAt,
  });

  factory _$DriverOrderHistoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverOrderHistoryItemImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'orderNumber')
  final String orderNumber;
  @override
  final DriverOrderHistoryRestaurant? restaurant;
  @override
  final String? status;
  @override
  final double? total;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'DriverOrderHistoryItem(id: $id, orderNumber: $orderNumber, restaurant: $restaurant, status: $status, total: $total, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverOrderHistoryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.restaurant, restaurant) ||
                other.restaurant == restaurant) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.total, total) || other.total == total) &&
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
    status,
    total,
    createdAt,
  );

  /// Create a copy of DriverOrderHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverOrderHistoryItemImplCopyWith<_$DriverOrderHistoryItemImpl>
  get copyWith =>
      __$$DriverOrderHistoryItemImplCopyWithImpl<_$DriverOrderHistoryItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverOrderHistoryItemImplToJson(this);
  }
}

abstract class _DriverOrderHistoryItem implements DriverOrderHistoryItem {
  const factory _DriverOrderHistoryItem({
    @JsonKey(name: '_id') required final String id,
    @JsonKey(name: 'orderNumber') required final String orderNumber,
    final DriverOrderHistoryRestaurant? restaurant,
    final String? status,
    final double? total,
    @JsonKey(name: 'createdAt') final DateTime? createdAt,
  }) = _$DriverOrderHistoryItemImpl;

  factory _DriverOrderHistoryItem.fromJson(Map<String, dynamic> json) =
      _$DriverOrderHistoryItemImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'orderNumber')
  String get orderNumber;
  @override
  DriverOrderHistoryRestaurant? get restaurant;
  @override
  String? get status;
  @override
  double? get total;
  @override
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt;

  /// Create a copy of DriverOrderHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverOrderHistoryItemImplCopyWith<_$DriverOrderHistoryItemImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DriverOrderHistoryRestaurant _$DriverOrderHistoryRestaurantFromJson(
  Map<String, dynamic> json,
) {
  return _DriverOrderHistoryRestaurant.fromJson(json);
}

/// @nodoc
mixin _$DriverOrderHistoryRestaurant {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this DriverOrderHistoryRestaurant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriverOrderHistoryRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverOrderHistoryRestaurantCopyWith<DriverOrderHistoryRestaurant>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverOrderHistoryRestaurantCopyWith<$Res> {
  factory $DriverOrderHistoryRestaurantCopyWith(
    DriverOrderHistoryRestaurant value,
    $Res Function(DriverOrderHistoryRestaurant) then,
  ) =
      _$DriverOrderHistoryRestaurantCopyWithImpl<
        $Res,
        DriverOrderHistoryRestaurant
      >;
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, String? name});
}

/// @nodoc
class _$DriverOrderHistoryRestaurantCopyWithImpl<
  $Res,
  $Val extends DriverOrderHistoryRestaurant
>
    implements $DriverOrderHistoryRestaurantCopyWith<$Res> {
  _$DriverOrderHistoryRestaurantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverOrderHistoryRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DriverOrderHistoryRestaurantImplCopyWith<$Res>
    implements $DriverOrderHistoryRestaurantCopyWith<$Res> {
  factory _$$DriverOrderHistoryRestaurantImplCopyWith(
    _$DriverOrderHistoryRestaurantImpl value,
    $Res Function(_$DriverOrderHistoryRestaurantImpl) then,
  ) = __$$DriverOrderHistoryRestaurantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, String? name});
}

/// @nodoc
class __$$DriverOrderHistoryRestaurantImplCopyWithImpl<$Res>
    extends
        _$DriverOrderHistoryRestaurantCopyWithImpl<
          $Res,
          _$DriverOrderHistoryRestaurantImpl
        >
    implements _$$DriverOrderHistoryRestaurantImplCopyWith<$Res> {
  __$$DriverOrderHistoryRestaurantImplCopyWithImpl(
    _$DriverOrderHistoryRestaurantImpl _value,
    $Res Function(_$DriverOrderHistoryRestaurantImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DriverOrderHistoryRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
    return _then(
      _$DriverOrderHistoryRestaurantImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverOrderHistoryRestaurantImpl
    implements _DriverOrderHistoryRestaurant {
  const _$DriverOrderHistoryRestaurantImpl({
    @JsonKey(name: '_id') this.id,
    this.name,
  });

  factory _$DriverOrderHistoryRestaurantImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$DriverOrderHistoryRestaurantImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'DriverOrderHistoryRestaurant(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverOrderHistoryRestaurantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of DriverOrderHistoryRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverOrderHistoryRestaurantImplCopyWith<
    _$DriverOrderHistoryRestaurantImpl
  >
  get copyWith =>
      __$$DriverOrderHistoryRestaurantImplCopyWithImpl<
        _$DriverOrderHistoryRestaurantImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverOrderHistoryRestaurantImplToJson(this);
  }
}

abstract class _DriverOrderHistoryRestaurant
    implements DriverOrderHistoryRestaurant {
  const factory _DriverOrderHistoryRestaurant({
    @JsonKey(name: '_id') final String? id,
    final String? name,
  }) = _$DriverOrderHistoryRestaurantImpl;

  factory _DriverOrderHistoryRestaurant.fromJson(Map<String, dynamic> json) =
      _$DriverOrderHistoryRestaurantImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;

  /// Create a copy of DriverOrderHistoryRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverOrderHistoryRestaurantImplCopyWith<
    _$DriverOrderHistoryRestaurantImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

PickupResponse _$PickupResponseFromJson(Map<String, dynamic> json) {
  return _PickupResponse.fromJson(json);
}

/// @nodoc
mixin _$PickupResponse {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderNumber')
  String get orderNumber => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusHistory')
  List<OrderStatusLog>? get statusHistory => throw _privateConstructorUsedError;

  /// Serializes this PickupResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PickupResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PickupResponseCopyWith<PickupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickupResponseCopyWith<$Res> {
  factory $PickupResponseCopyWith(
    PickupResponse value,
    $Res Function(PickupResponse) then,
  ) = _$PickupResponseCopyWithImpl<$Res, PickupResponse>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'orderNumber') String orderNumber,
    String? status,
    @JsonKey(name: 'statusHistory') List<OrderStatusLog>? statusHistory,
  });
}

/// @nodoc
class _$PickupResponseCopyWithImpl<$Res, $Val extends PickupResponse>
    implements $PickupResponseCopyWith<$Res> {
  _$PickupResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PickupResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? status = freezed,
    Object? statusHistory = freezed,
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
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            statusHistory: freezed == statusHistory
                ? _value.statusHistory
                : statusHistory // ignore: cast_nullable_to_non_nullable
                      as List<OrderStatusLog>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PickupResponseImplCopyWith<$Res>
    implements $PickupResponseCopyWith<$Res> {
  factory _$$PickupResponseImplCopyWith(
    _$PickupResponseImpl value,
    $Res Function(_$PickupResponseImpl) then,
  ) = __$$PickupResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'orderNumber') String orderNumber,
    String? status,
    @JsonKey(name: 'statusHistory') List<OrderStatusLog>? statusHistory,
  });
}

/// @nodoc
class __$$PickupResponseImplCopyWithImpl<$Res>
    extends _$PickupResponseCopyWithImpl<$Res, _$PickupResponseImpl>
    implements _$$PickupResponseImplCopyWith<$Res> {
  __$$PickupResponseImplCopyWithImpl(
    _$PickupResponseImpl _value,
    $Res Function(_$PickupResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PickupResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? status = freezed,
    Object? statusHistory = freezed,
  }) {
    return _then(
      _$PickupResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        orderNumber: null == orderNumber
            ? _value.orderNumber
            : orderNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        statusHistory: freezed == statusHistory
            ? _value._statusHistory
            : statusHistory // ignore: cast_nullable_to_non_nullable
                  as List<OrderStatusLog>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PickupResponseImpl implements _PickupResponse {
  const _$PickupResponseImpl({
    @JsonKey(name: '_id') required this.id,
    @JsonKey(name: 'orderNumber') required this.orderNumber,
    this.status,
    @JsonKey(name: 'statusHistory') final List<OrderStatusLog>? statusHistory,
  }) : _statusHistory = statusHistory;

  factory _$PickupResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PickupResponseImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'orderNumber')
  final String orderNumber;
  @override
  final String? status;
  final List<OrderStatusLog>? _statusHistory;
  @override
  @JsonKey(name: 'statusHistory')
  List<OrderStatusLog>? get statusHistory {
    final value = _statusHistory;
    if (value == null) return null;
    if (_statusHistory is EqualUnmodifiableListView) return _statusHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PickupResponse(id: $id, orderNumber: $orderNumber, status: $status, statusHistory: $statusHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickupResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._statusHistory,
              _statusHistory,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    orderNumber,
    status,
    const DeepCollectionEquality().hash(_statusHistory),
  );

  /// Create a copy of PickupResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PickupResponseImplCopyWith<_$PickupResponseImpl> get copyWith =>
      __$$PickupResponseImplCopyWithImpl<_$PickupResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PickupResponseImplToJson(this);
  }
}

abstract class _PickupResponse implements PickupResponse {
  const factory _PickupResponse({
    @JsonKey(name: '_id') required final String id,
    @JsonKey(name: 'orderNumber') required final String orderNumber,
    final String? status,
    @JsonKey(name: 'statusHistory') final List<OrderStatusLog>? statusHistory,
  }) = _$PickupResponseImpl;

  factory _PickupResponse.fromJson(Map<String, dynamic> json) =
      _$PickupResponseImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'orderNumber')
  String get orderNumber;
  @override
  String? get status;
  @override
  @JsonKey(name: 'statusHistory')
  List<OrderStatusLog>? get statusHistory;

  /// Create a copy of PickupResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PickupResponseImplCopyWith<_$PickupResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliverResponse _$DeliverResponseFromJson(Map<String, dynamic> json) {
  return _DeliverResponse.fromJson(json);
}

/// @nodoc
mixin _$DeliverResponse {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderNumber')
  String get orderNumber => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'actualDeliveryTime')
  DateTime? get actualDeliveryTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusHistory')
  List<OrderStatusLog>? get statusHistory => throw _privateConstructorUsedError;

  /// Serializes this DeliverResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliverResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliverResponseCopyWith<DeliverResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliverResponseCopyWith<$Res> {
  factory $DeliverResponseCopyWith(
    DeliverResponse value,
    $Res Function(DeliverResponse) then,
  ) = _$DeliverResponseCopyWithImpl<$Res, DeliverResponse>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'orderNumber') String orderNumber,
    String? status,
    @JsonKey(name: 'actualDeliveryTime') DateTime? actualDeliveryTime,
    @JsonKey(name: 'statusHistory') List<OrderStatusLog>? statusHistory,
  });
}

/// @nodoc
class _$DeliverResponseCopyWithImpl<$Res, $Val extends DeliverResponse>
    implements $DeliverResponseCopyWith<$Res> {
  _$DeliverResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliverResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? status = freezed,
    Object? actualDeliveryTime = freezed,
    Object? statusHistory = freezed,
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
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            actualDeliveryTime: freezed == actualDeliveryTime
                ? _value.actualDeliveryTime
                : actualDeliveryTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            statusHistory: freezed == statusHistory
                ? _value.statusHistory
                : statusHistory // ignore: cast_nullable_to_non_nullable
                      as List<OrderStatusLog>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeliverResponseImplCopyWith<$Res>
    implements $DeliverResponseCopyWith<$Res> {
  factory _$$DeliverResponseImplCopyWith(
    _$DeliverResponseImpl value,
    $Res Function(_$DeliverResponseImpl) then,
  ) = __$$DeliverResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'orderNumber') String orderNumber,
    String? status,
    @JsonKey(name: 'actualDeliveryTime') DateTime? actualDeliveryTime,
    @JsonKey(name: 'statusHistory') List<OrderStatusLog>? statusHistory,
  });
}

/// @nodoc
class __$$DeliverResponseImplCopyWithImpl<$Res>
    extends _$DeliverResponseCopyWithImpl<$Res, _$DeliverResponseImpl>
    implements _$$DeliverResponseImplCopyWith<$Res> {
  __$$DeliverResponseImplCopyWithImpl(
    _$DeliverResponseImpl _value,
    $Res Function(_$DeliverResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeliverResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? status = freezed,
    Object? actualDeliveryTime = freezed,
    Object? statusHistory = freezed,
  }) {
    return _then(
      _$DeliverResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        orderNumber: null == orderNumber
            ? _value.orderNumber
            : orderNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        actualDeliveryTime: freezed == actualDeliveryTime
            ? _value.actualDeliveryTime
            : actualDeliveryTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        statusHistory: freezed == statusHistory
            ? _value._statusHistory
            : statusHistory // ignore: cast_nullable_to_non_nullable
                  as List<OrderStatusLog>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliverResponseImpl implements _DeliverResponse {
  const _$DeliverResponseImpl({
    @JsonKey(name: '_id') required this.id,
    @JsonKey(name: 'orderNumber') required this.orderNumber,
    this.status,
    @JsonKey(name: 'actualDeliveryTime') this.actualDeliveryTime,
    @JsonKey(name: 'statusHistory') final List<OrderStatusLog>? statusHistory,
  }) : _statusHistory = statusHistory;

  factory _$DeliverResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliverResponseImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'orderNumber')
  final String orderNumber;
  @override
  final String? status;
  @override
  @JsonKey(name: 'actualDeliveryTime')
  final DateTime? actualDeliveryTime;
  final List<OrderStatusLog>? _statusHistory;
  @override
  @JsonKey(name: 'statusHistory')
  List<OrderStatusLog>? get statusHistory {
    final value = _statusHistory;
    if (value == null) return null;
    if (_statusHistory is EqualUnmodifiableListView) return _statusHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DeliverResponse(id: $id, orderNumber: $orderNumber, status: $status, actualDeliveryTime: $actualDeliveryTime, statusHistory: $statusHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliverResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.actualDeliveryTime, actualDeliveryTime) ||
                other.actualDeliveryTime == actualDeliveryTime) &&
            const DeepCollectionEquality().equals(
              other._statusHistory,
              _statusHistory,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    orderNumber,
    status,
    actualDeliveryTime,
    const DeepCollectionEquality().hash(_statusHistory),
  );

  /// Create a copy of DeliverResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliverResponseImplCopyWith<_$DeliverResponseImpl> get copyWith =>
      __$$DeliverResponseImplCopyWithImpl<_$DeliverResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliverResponseImplToJson(this);
  }
}

abstract class _DeliverResponse implements DeliverResponse {
  const factory _DeliverResponse({
    @JsonKey(name: '_id') required final String id,
    @JsonKey(name: 'orderNumber') required final String orderNumber,
    final String? status,
    @JsonKey(name: 'actualDeliveryTime') final DateTime? actualDeliveryTime,
    @JsonKey(name: 'statusHistory') final List<OrderStatusLog>? statusHistory,
  }) = _$DeliverResponseImpl;

  factory _DeliverResponse.fromJson(Map<String, dynamic> json) =
      _$DeliverResponseImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'orderNumber')
  String get orderNumber;
  @override
  String? get status;
  @override
  @JsonKey(name: 'actualDeliveryTime')
  DateTime? get actualDeliveryTime;
  @override
  @JsonKey(name: 'statusHistory')
  List<OrderStatusLog>? get statusHistory;

  /// Create a copy of DeliverResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliverResponseImplCopyWith<_$DeliverResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderStatusLog _$OrderStatusLogFromJson(Map<String, dynamic> json) {
  return _OrderStatusLog.fromJson(json);
}

/// @nodoc
mixin _$OrderStatusLog {
  String get status => throw _privateConstructorUsedError;
  DateTime? get timestamp => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this OrderStatusLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderStatusLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderStatusLogCopyWith<OrderStatusLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusLogCopyWith<$Res> {
  factory $OrderStatusLogCopyWith(
    OrderStatusLog value,
    $Res Function(OrderStatusLog) then,
  ) = _$OrderStatusLogCopyWithImpl<$Res, OrderStatusLog>;
  @useResult
  $Res call({String status, DateTime? timestamp, String? note});
}

/// @nodoc
class _$OrderStatusLogCopyWithImpl<$Res, $Val extends OrderStatusLog>
    implements $OrderStatusLogCopyWith<$Res> {
  _$OrderStatusLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderStatusLog
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
abstract class _$$OrderStatusLogImplCopyWith<$Res>
    implements $OrderStatusLogCopyWith<$Res> {
  factory _$$OrderStatusLogImplCopyWith(
    _$OrderStatusLogImpl value,
    $Res Function(_$OrderStatusLogImpl) then,
  ) = __$$OrderStatusLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, DateTime? timestamp, String? note});
}

/// @nodoc
class __$$OrderStatusLogImplCopyWithImpl<$Res>
    extends _$OrderStatusLogCopyWithImpl<$Res, _$OrderStatusLogImpl>
    implements _$$OrderStatusLogImplCopyWith<$Res> {
  __$$OrderStatusLogImplCopyWithImpl(
    _$OrderStatusLogImpl _value,
    $Res Function(_$OrderStatusLogImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderStatusLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? timestamp = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _$OrderStatusLogImpl(
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
class _$OrderStatusLogImpl implements _OrderStatusLog {
  const _$OrderStatusLogImpl({required this.status, this.timestamp, this.note});

  factory _$OrderStatusLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderStatusLogImplFromJson(json);

  @override
  final String status;
  @override
  final DateTime? timestamp;
  @override
  final String? note;

  @override
  String toString() {
    return 'OrderStatusLog(status: $status, timestamp: $timestamp, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStatusLogImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, timestamp, note);

  /// Create a copy of OrderStatusLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStatusLogImplCopyWith<_$OrderStatusLogImpl> get copyWith =>
      __$$OrderStatusLogImplCopyWithImpl<_$OrderStatusLogImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderStatusLogImplToJson(this);
  }
}

abstract class _OrderStatusLog implements OrderStatusLog {
  const factory _OrderStatusLog({
    required final String status,
    final DateTime? timestamp,
    final String? note,
  }) = _$OrderStatusLogImpl;

  factory _OrderStatusLog.fromJson(Map<String, dynamic> json) =
      _$OrderStatusLogImpl.fromJson;

  @override
  String get status;
  @override
  DateTime? get timestamp;
  @override
  String? get note;

  /// Create a copy of OrderStatusLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderStatusLogImplCopyWith<_$OrderStatusLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EarningsSummary _$EarningsSummaryFromJson(Map<String, dynamic> json) {
  return _EarningsSummary.fromJson(json);
}

/// @nodoc
mixin _$EarningsSummary {
  @JsonKey(name: 'totalDeliveries')
  int get totalDeliveries => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalEarnings')
  double get totalEarnings => throw _privateConstructorUsedError;
  @JsonKey(name: 'todayDeliveries')
  int get todayDeliveries => throw _privateConstructorUsedError;
  @JsonKey(name: 'todayEarnings')
  double get todayEarnings => throw _privateConstructorUsedError;

  /// Serializes this EarningsSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EarningsSummaryCopyWith<EarningsSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EarningsSummaryCopyWith<$Res> {
  factory $EarningsSummaryCopyWith(
    EarningsSummary value,
    $Res Function(EarningsSummary) then,
  ) = _$EarningsSummaryCopyWithImpl<$Res, EarningsSummary>;
  @useResult
  $Res call({
    @JsonKey(name: 'totalDeliveries') int totalDeliveries,
    @JsonKey(name: 'totalEarnings') double totalEarnings,
    @JsonKey(name: 'todayDeliveries') int todayDeliveries,
    @JsonKey(name: 'todayEarnings') double todayEarnings,
  });
}

/// @nodoc
class _$EarningsSummaryCopyWithImpl<$Res, $Val extends EarningsSummary>
    implements $EarningsSummaryCopyWith<$Res> {
  _$EarningsSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalDeliveries = null,
    Object? totalEarnings = null,
    Object? todayDeliveries = null,
    Object? todayEarnings = null,
  }) {
    return _then(
      _value.copyWith(
            totalDeliveries: null == totalDeliveries
                ? _value.totalDeliveries
                : totalDeliveries // ignore: cast_nullable_to_non_nullable
                      as int,
            totalEarnings: null == totalEarnings
                ? _value.totalEarnings
                : totalEarnings // ignore: cast_nullable_to_non_nullable
                      as double,
            todayDeliveries: null == todayDeliveries
                ? _value.todayDeliveries
                : todayDeliveries // ignore: cast_nullable_to_non_nullable
                      as int,
            todayEarnings: null == todayEarnings
                ? _value.todayEarnings
                : todayEarnings // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EarningsSummaryImplCopyWith<$Res>
    implements $EarningsSummaryCopyWith<$Res> {
  factory _$$EarningsSummaryImplCopyWith(
    _$EarningsSummaryImpl value,
    $Res Function(_$EarningsSummaryImpl) then,
  ) = __$$EarningsSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'totalDeliveries') int totalDeliveries,
    @JsonKey(name: 'totalEarnings') double totalEarnings,
    @JsonKey(name: 'todayDeliveries') int todayDeliveries,
    @JsonKey(name: 'todayEarnings') double todayEarnings,
  });
}

/// @nodoc
class __$$EarningsSummaryImplCopyWithImpl<$Res>
    extends _$EarningsSummaryCopyWithImpl<$Res, _$EarningsSummaryImpl>
    implements _$$EarningsSummaryImplCopyWith<$Res> {
  __$$EarningsSummaryImplCopyWithImpl(
    _$EarningsSummaryImpl _value,
    $Res Function(_$EarningsSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalDeliveries = null,
    Object? totalEarnings = null,
    Object? todayDeliveries = null,
    Object? todayEarnings = null,
  }) {
    return _then(
      _$EarningsSummaryImpl(
        totalDeliveries: null == totalDeliveries
            ? _value.totalDeliveries
            : totalDeliveries // ignore: cast_nullable_to_non_nullable
                  as int,
        totalEarnings: null == totalEarnings
            ? _value.totalEarnings
            : totalEarnings // ignore: cast_nullable_to_non_nullable
                  as double,
        todayDeliveries: null == todayDeliveries
            ? _value.todayDeliveries
            : todayDeliveries // ignore: cast_nullable_to_non_nullable
                  as int,
        todayEarnings: null == todayEarnings
            ? _value.todayEarnings
            : todayEarnings // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EarningsSummaryImpl implements _EarningsSummary {
  const _$EarningsSummaryImpl({
    @JsonKey(name: 'totalDeliveries') required this.totalDeliveries,
    @JsonKey(name: 'totalEarnings') required this.totalEarnings,
    @JsonKey(name: 'todayDeliveries') required this.todayDeliveries,
    @JsonKey(name: 'todayEarnings') required this.todayEarnings,
  });

  factory _$EarningsSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EarningsSummaryImplFromJson(json);

  @override
  @JsonKey(name: 'totalDeliveries')
  final int totalDeliveries;
  @override
  @JsonKey(name: 'totalEarnings')
  final double totalEarnings;
  @override
  @JsonKey(name: 'todayDeliveries')
  final int todayDeliveries;
  @override
  @JsonKey(name: 'todayEarnings')
  final double todayEarnings;

  @override
  String toString() {
    return 'EarningsSummary(totalDeliveries: $totalDeliveries, totalEarnings: $totalEarnings, todayDeliveries: $todayDeliveries, todayEarnings: $todayEarnings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EarningsSummaryImpl &&
            (identical(other.totalDeliveries, totalDeliveries) ||
                other.totalDeliveries == totalDeliveries) &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings) &&
            (identical(other.todayDeliveries, todayDeliveries) ||
                other.todayDeliveries == todayDeliveries) &&
            (identical(other.todayEarnings, todayEarnings) ||
                other.todayEarnings == todayEarnings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalDeliveries,
    totalEarnings,
    todayDeliveries,
    todayEarnings,
  );

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EarningsSummaryImplCopyWith<_$EarningsSummaryImpl> get copyWith =>
      __$$EarningsSummaryImplCopyWithImpl<_$EarningsSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EarningsSummaryImplToJson(this);
  }
}

abstract class _EarningsSummary implements EarningsSummary {
  const factory _EarningsSummary({
    @JsonKey(name: 'totalDeliveries') required final int totalDeliveries,
    @JsonKey(name: 'totalEarnings') required final double totalEarnings,
    @JsonKey(name: 'todayDeliveries') required final int todayDeliveries,
    @JsonKey(name: 'todayEarnings') required final double todayEarnings,
  }) = _$EarningsSummaryImpl;

  factory _EarningsSummary.fromJson(Map<String, dynamic> json) =
      _$EarningsSummaryImpl.fromJson;

  @override
  @JsonKey(name: 'totalDeliveries')
  int get totalDeliveries;
  @override
  @JsonKey(name: 'totalEarnings')
  double get totalEarnings;
  @override
  @JsonKey(name: 'todayDeliveries')
  int get todayDeliveries;
  @override
  @JsonKey(name: 'todayEarnings')
  double get todayEarnings;

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EarningsSummaryImplCopyWith<_$EarningsSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EarningsOrder _$EarningsOrderFromJson(Map<String, dynamic> json) {
  return _EarningsOrder.fromJson(json);
}

/// @nodoc
mixin _$EarningsOrder {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderNumber')
  String get orderNumber => throw _privateConstructorUsedError;
  EarningsOrderRestaurant? get restaurant => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryFee')
  double? get deliveryFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'actualDeliveryTime')
  DateTime? get actualDeliveryTime => throw _privateConstructorUsedError;

  /// Serializes this EarningsOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EarningsOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EarningsOrderCopyWith<EarningsOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EarningsOrderCopyWith<$Res> {
  factory $EarningsOrderCopyWith(
    EarningsOrder value,
    $Res Function(EarningsOrder) then,
  ) = _$EarningsOrderCopyWithImpl<$Res, EarningsOrder>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'orderNumber') String orderNumber,
    EarningsOrderRestaurant? restaurant,
    @JsonKey(name: 'deliveryFee') double? deliveryFee,
    @JsonKey(name: 'actualDeliveryTime') DateTime? actualDeliveryTime,
  });

  $EarningsOrderRestaurantCopyWith<$Res>? get restaurant;
}

/// @nodoc
class _$EarningsOrderCopyWithImpl<$Res, $Val extends EarningsOrder>
    implements $EarningsOrderCopyWith<$Res> {
  _$EarningsOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EarningsOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? restaurant = freezed,
    Object? deliveryFee = freezed,
    Object? actualDeliveryTime = freezed,
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
                      as EarningsOrderRestaurant?,
            deliveryFee: freezed == deliveryFee
                ? _value.deliveryFee
                : deliveryFee // ignore: cast_nullable_to_non_nullable
                      as double?,
            actualDeliveryTime: freezed == actualDeliveryTime
                ? _value.actualDeliveryTime
                : actualDeliveryTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of EarningsOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EarningsOrderRestaurantCopyWith<$Res>? get restaurant {
    if (_value.restaurant == null) {
      return null;
    }

    return $EarningsOrderRestaurantCopyWith<$Res>(_value.restaurant!, (value) {
      return _then(_value.copyWith(restaurant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EarningsOrderImplCopyWith<$Res>
    implements $EarningsOrderCopyWith<$Res> {
  factory _$$EarningsOrderImplCopyWith(
    _$EarningsOrderImpl value,
    $Res Function(_$EarningsOrderImpl) then,
  ) = __$$EarningsOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'orderNumber') String orderNumber,
    EarningsOrderRestaurant? restaurant,
    @JsonKey(name: 'deliveryFee') double? deliveryFee,
    @JsonKey(name: 'actualDeliveryTime') DateTime? actualDeliveryTime,
  });

  @override
  $EarningsOrderRestaurantCopyWith<$Res>? get restaurant;
}

/// @nodoc
class __$$EarningsOrderImplCopyWithImpl<$Res>
    extends _$EarningsOrderCopyWithImpl<$Res, _$EarningsOrderImpl>
    implements _$$EarningsOrderImplCopyWith<$Res> {
  __$$EarningsOrderImplCopyWithImpl(
    _$EarningsOrderImpl _value,
    $Res Function(_$EarningsOrderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EarningsOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? restaurant = freezed,
    Object? deliveryFee = freezed,
    Object? actualDeliveryTime = freezed,
  }) {
    return _then(
      _$EarningsOrderImpl(
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
                  as EarningsOrderRestaurant?,
        deliveryFee: freezed == deliveryFee
            ? _value.deliveryFee
            : deliveryFee // ignore: cast_nullable_to_non_nullable
                  as double?,
        actualDeliveryTime: freezed == actualDeliveryTime
            ? _value.actualDeliveryTime
            : actualDeliveryTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EarningsOrderImpl implements _EarningsOrder {
  const _$EarningsOrderImpl({
    @JsonKey(name: '_id') required this.id,
    @JsonKey(name: 'orderNumber') required this.orderNumber,
    this.restaurant,
    @JsonKey(name: 'deliveryFee') this.deliveryFee,
    @JsonKey(name: 'actualDeliveryTime') this.actualDeliveryTime,
  });

  factory _$EarningsOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$EarningsOrderImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'orderNumber')
  final String orderNumber;
  @override
  final EarningsOrderRestaurant? restaurant;
  @override
  @JsonKey(name: 'deliveryFee')
  final double? deliveryFee;
  @override
  @JsonKey(name: 'actualDeliveryTime')
  final DateTime? actualDeliveryTime;

  @override
  String toString() {
    return 'EarningsOrder(id: $id, orderNumber: $orderNumber, restaurant: $restaurant, deliveryFee: $deliveryFee, actualDeliveryTime: $actualDeliveryTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EarningsOrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.restaurant, restaurant) ||
                other.restaurant == restaurant) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.actualDeliveryTime, actualDeliveryTime) ||
                other.actualDeliveryTime == actualDeliveryTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    orderNumber,
    restaurant,
    deliveryFee,
    actualDeliveryTime,
  );

  /// Create a copy of EarningsOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EarningsOrderImplCopyWith<_$EarningsOrderImpl> get copyWith =>
      __$$EarningsOrderImplCopyWithImpl<_$EarningsOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EarningsOrderImplToJson(this);
  }
}

abstract class _EarningsOrder implements EarningsOrder {
  const factory _EarningsOrder({
    @JsonKey(name: '_id') required final String id,
    @JsonKey(name: 'orderNumber') required final String orderNumber,
    final EarningsOrderRestaurant? restaurant,
    @JsonKey(name: 'deliveryFee') final double? deliveryFee,
    @JsonKey(name: 'actualDeliveryTime') final DateTime? actualDeliveryTime,
  }) = _$EarningsOrderImpl;

  factory _EarningsOrder.fromJson(Map<String, dynamic> json) =
      _$EarningsOrderImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'orderNumber')
  String get orderNumber;
  @override
  EarningsOrderRestaurant? get restaurant;
  @override
  @JsonKey(name: 'deliveryFee')
  double? get deliveryFee;
  @override
  @JsonKey(name: 'actualDeliveryTime')
  DateTime? get actualDeliveryTime;

  /// Create a copy of EarningsOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EarningsOrderImplCopyWith<_$EarningsOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EarningsOrderRestaurant _$EarningsOrderRestaurantFromJson(
  Map<String, dynamic> json,
) {
  return _EarningsOrderRestaurant.fromJson(json);
}

/// @nodoc
mixin _$EarningsOrderRestaurant {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this EarningsOrderRestaurant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EarningsOrderRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EarningsOrderRestaurantCopyWith<EarningsOrderRestaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EarningsOrderRestaurantCopyWith<$Res> {
  factory $EarningsOrderRestaurantCopyWith(
    EarningsOrderRestaurant value,
    $Res Function(EarningsOrderRestaurant) then,
  ) = _$EarningsOrderRestaurantCopyWithImpl<$Res, EarningsOrderRestaurant>;
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, String? name});
}

/// @nodoc
class _$EarningsOrderRestaurantCopyWithImpl<
  $Res,
  $Val extends EarningsOrderRestaurant
>
    implements $EarningsOrderRestaurantCopyWith<$Res> {
  _$EarningsOrderRestaurantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EarningsOrderRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EarningsOrderRestaurantImplCopyWith<$Res>
    implements $EarningsOrderRestaurantCopyWith<$Res> {
  factory _$$EarningsOrderRestaurantImplCopyWith(
    _$EarningsOrderRestaurantImpl value,
    $Res Function(_$EarningsOrderRestaurantImpl) then,
  ) = __$$EarningsOrderRestaurantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, String? name});
}

/// @nodoc
class __$$EarningsOrderRestaurantImplCopyWithImpl<$Res>
    extends
        _$EarningsOrderRestaurantCopyWithImpl<
          $Res,
          _$EarningsOrderRestaurantImpl
        >
    implements _$$EarningsOrderRestaurantImplCopyWith<$Res> {
  __$$EarningsOrderRestaurantImplCopyWithImpl(
    _$EarningsOrderRestaurantImpl _value,
    $Res Function(_$EarningsOrderRestaurantImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EarningsOrderRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
    return _then(
      _$EarningsOrderRestaurantImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EarningsOrderRestaurantImpl implements _EarningsOrderRestaurant {
  const _$EarningsOrderRestaurantImpl({
    @JsonKey(name: '_id') this.id,
    this.name,
  });

  factory _$EarningsOrderRestaurantImpl.fromJson(Map<String, dynamic> json) =>
      _$$EarningsOrderRestaurantImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'EarningsOrderRestaurant(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EarningsOrderRestaurantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of EarningsOrderRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EarningsOrderRestaurantImplCopyWith<_$EarningsOrderRestaurantImpl>
  get copyWith =>
      __$$EarningsOrderRestaurantImplCopyWithImpl<
        _$EarningsOrderRestaurantImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EarningsOrderRestaurantImplToJson(this);
  }
}

abstract class _EarningsOrderRestaurant implements EarningsOrderRestaurant {
  const factory _EarningsOrderRestaurant({
    @JsonKey(name: '_id') final String? id,
    final String? name,
  }) = _$EarningsOrderRestaurantImpl;

  factory _EarningsOrderRestaurant.fromJson(Map<String, dynamic> json) =
      _$EarningsOrderRestaurantImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;

  /// Create a copy of EarningsOrderRestaurant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EarningsOrderRestaurantImplCopyWith<_$EarningsOrderRestaurantImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DriverEarnings _$DriverEarningsFromJson(Map<String, dynamic> json) {
  return _DriverEarnings.fromJson(json);
}

/// @nodoc
mixin _$DriverEarnings {
  List<EarningsOrder> get orders => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  EarningsSummary get summary => throw _privateConstructorUsedError;

  /// Serializes this DriverEarnings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriverEarnings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverEarningsCopyWith<DriverEarnings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverEarningsCopyWith<$Res> {
  factory $DriverEarningsCopyWith(
    DriverEarnings value,
    $Res Function(DriverEarnings) then,
  ) = _$DriverEarningsCopyWithImpl<$Res, DriverEarnings>;
  @useResult
  $Res call({
    List<EarningsOrder> orders,
    int total,
    int page,
    int limit,
    EarningsSummary summary,
  });

  $EarningsSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class _$DriverEarningsCopyWithImpl<$Res, $Val extends DriverEarnings>
    implements $DriverEarningsCopyWith<$Res> {
  _$DriverEarningsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverEarnings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
    Object? total = null,
    Object? page = null,
    Object? limit = null,
    Object? summary = null,
  }) {
    return _then(
      _value.copyWith(
            orders: null == orders
                ? _value.orders
                : orders // ignore: cast_nullable_to_non_nullable
                      as List<EarningsOrder>,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            limit: null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as int,
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as EarningsSummary,
          )
          as $Val,
    );
  }

  /// Create a copy of DriverEarnings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EarningsSummaryCopyWith<$Res> get summary {
    return $EarningsSummaryCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DriverEarningsImplCopyWith<$Res>
    implements $DriverEarningsCopyWith<$Res> {
  factory _$$DriverEarningsImplCopyWith(
    _$DriverEarningsImpl value,
    $Res Function(_$DriverEarningsImpl) then,
  ) = __$$DriverEarningsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<EarningsOrder> orders,
    int total,
    int page,
    int limit,
    EarningsSummary summary,
  });

  @override
  $EarningsSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class __$$DriverEarningsImplCopyWithImpl<$Res>
    extends _$DriverEarningsCopyWithImpl<$Res, _$DriverEarningsImpl>
    implements _$$DriverEarningsImplCopyWith<$Res> {
  __$$DriverEarningsImplCopyWithImpl(
    _$DriverEarningsImpl _value,
    $Res Function(_$DriverEarningsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DriverEarnings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
    Object? total = null,
    Object? page = null,
    Object? limit = null,
    Object? summary = null,
  }) {
    return _then(
      _$DriverEarningsImpl(
        orders: null == orders
            ? _value._orders
            : orders // ignore: cast_nullable_to_non_nullable
                  as List<EarningsOrder>,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as EarningsSummary,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverEarningsImpl implements _DriverEarnings {
  const _$DriverEarningsImpl({
    required final List<EarningsOrder> orders,
    required this.total,
    required this.page,
    required this.limit,
    required this.summary,
  }) : _orders = orders;

  factory _$DriverEarningsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverEarningsImplFromJson(json);

  final List<EarningsOrder> _orders;
  @override
  List<EarningsOrder> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  final int total;
  @override
  final int page;
  @override
  final int limit;
  @override
  final EarningsSummary summary;

  @override
  String toString() {
    return 'DriverEarnings(orders: $orders, total: $total, page: $page, limit: $limit, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverEarningsImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_orders),
    total,
    page,
    limit,
    summary,
  );

  /// Create a copy of DriverEarnings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverEarningsImplCopyWith<_$DriverEarningsImpl> get copyWith =>
      __$$DriverEarningsImplCopyWithImpl<_$DriverEarningsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverEarningsImplToJson(this);
  }
}

abstract class _DriverEarnings implements DriverEarnings {
  const factory _DriverEarnings({
    required final List<EarningsOrder> orders,
    required final int total,
    required final int page,
    required final int limit,
    required final EarningsSummary summary,
  }) = _$DriverEarningsImpl;

  factory _DriverEarnings.fromJson(Map<String, dynamic> json) =
      _$DriverEarningsImpl.fromJson;

  @override
  List<EarningsOrder> get orders;
  @override
  int get total;
  @override
  int get page;
  @override
  int get limit;
  @override
  EarningsSummary get summary;

  /// Create a copy of DriverEarnings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverEarningsImplCopyWith<_$DriverEarningsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
