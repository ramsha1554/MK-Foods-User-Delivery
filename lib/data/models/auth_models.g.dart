// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestOtpRequestImpl _$$RequestOtpRequestImplFromJson(
  Map<String, dynamic> json,
) => _$RequestOtpRequestImpl(
  phone: json['phone'] as String,
  role: json['role'] as String? ?? 'customer',
);

Map<String, dynamic> _$$RequestOtpRequestImplToJson(
  _$RequestOtpRequestImpl instance,
) => <String, dynamic>{'phone': instance.phone, 'role': instance.role};

_$VerifyOtpRequestImpl _$$VerifyOtpRequestImplFromJson(
  Map<String, dynamic> json,
) => _$VerifyOtpRequestImpl(
  phone: json['phone'] as String,
  code: json['code'] as String,
);

Map<String, dynamic> _$$VerifyOtpRequestImplToJson(
  _$VerifyOtpRequestImpl instance,
) => <String, dynamic>{'phone': instance.phone, 'code': instance.code};

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: json['_id'] as String,
  phone: json['phone'] as String,
  name: json['name'] as String?,
  email: json['email'] as String?,
  role: json['role'] as String,
  isVerified: json['isVerified'] as bool,
  isActive: json['isActive'] as bool?,
  isNewUser: json['isNewUser'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  driverStatus: json['driverStatus'] as String?,
  vehicleType: json['vehicleType'] as String?,
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'phone': instance.phone,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'isVerified': instance.isVerified,
      'isActive': instance.isActive,
      'isNewUser': instance.isNewUser,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'driverStatus': instance.driverStatus,
      'vehicleType': instance.vehicleType,
    };

_$AuthDataImpl _$$AuthDataImplFromJson(Map<String, dynamic> json) =>
    _$AuthDataImpl(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$AuthDataImplToJson(_$AuthDataImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
