// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterDriverRequestImpl _$$RegisterDriverRequestImplFromJson(
  Map<String, dynamic> json,
) => _$RegisterDriverRequestImpl(
  name: json['name'] as String?,
  vehicleType: json['vehicleType'] as String?,
);

Map<String, dynamic> _$$RegisterDriverRequestImplToJson(
  _$RegisterDriverRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'vehicleType': instance.vehicleType,
};

_$DriverProfileImpl _$$DriverProfileImplFromJson(Map<String, dynamic> json) =>
    _$DriverProfileImpl(
      id: json['_id'] as String,
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      role: json['role'] as String?,
      driverStatus: json['driverStatus'] as String?,
      vehicleType: json['vehicleType'] as String?,
      isVerified: json['isVerified'] as bool?,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$$DriverProfileImplToJson(_$DriverProfileImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'phone': instance.phone,
      'name': instance.name,
      'role': instance.role,
      'driverStatus': instance.driverStatus,
      'vehicleType': instance.vehicleType,
      'isVerified': instance.isVerified,
      'isActive': instance.isActive,
    };

_$DocumentImpl _$$DocumentImplFromJson(Map<String, dynamic> json) =>
    _$DocumentImpl(
      id: json['_id'] as String,
      driver: json['driver'] as String?,
      type: json['type'] as String?,
      fileUrl: json['fileUrl'] as String?,
      originalName: json['originalName'] as String?,
      status: json['status'] as String?,
      adminNote: json['adminNote'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$DocumentImplToJson(_$DocumentImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'driver': instance.driver,
      'type': instance.type,
      'fileUrl': instance.fileUrl,
      'originalName': instance.originalName,
      'status': instance.status,
      'adminNote': instance.adminNote,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$ToggleOnlineResponseImpl _$$ToggleOnlineResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ToggleOnlineResponseImpl(isOnline: json['isOnline'] as bool);

Map<String, dynamic> _$$ToggleOnlineResponseImplToJson(
  _$ToggleOnlineResponseImpl instance,
) => <String, dynamic>{'isOnline': instance.isOnline};

_$LocationUpdateRequestImpl _$$LocationUpdateRequestImplFromJson(
  Map<String, dynamic> json,
) => _$LocationUpdateRequestImpl(
  longitude: (json['longitude'] as num).toDouble(),
  latitude: (json['latitude'] as num).toDouble(),
);

Map<String, dynamic> _$$LocationUpdateRequestImplToJson(
  _$LocationUpdateRequestImpl instance,
) => <String, dynamic>{
  'longitude': instance.longitude,
  'latitude': instance.latitude,
};

_$LocationUpdateResponseImpl _$$LocationUpdateResponseImplFromJson(
  Map<String, dynamic> json,
) => _$LocationUpdateResponseImpl(
  currentLocation: json['currentLocation'] == null
      ? null
      : GeoPoint.fromJson(json['currentLocation'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$LocationUpdateResponseImplToJson(
  _$LocationUpdateResponseImpl instance,
) => <String, dynamic>{'currentLocation': instance.currentLocation};

_$DriverOrderCustomerImpl _$$DriverOrderCustomerImplFromJson(
  Map<String, dynamic> json,
) => _$DriverOrderCustomerImpl(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$$DriverOrderCustomerImplToJson(
  _$DriverOrderCustomerImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
};

_$DriverOrderRestaurantImpl _$$DriverOrderRestaurantImplFromJson(
  Map<String, dynamic> json,
) => _$DriverOrderRestaurantImpl(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] == null
      ? null
      : RestaurantAddress.fromJson(json['address'] as Map<String, dynamic>),
  location: json['location'] == null
      ? null
      : GeoPoint.fromJson(json['location'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$DriverOrderRestaurantImplToJson(
  _$DriverOrderRestaurantImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'address': instance.address,
  'location': instance.location,
};

_$DriverActiveOrderImpl _$$DriverActiveOrderImplFromJson(
  Map<String, dynamic> json,
) => _$DriverActiveOrderImpl(
  id: json['_id'] as String,
  orderNumber: json['orderNumber'] as String,
  customer: json['customer'] == null
      ? null
      : DriverOrderCustomer.fromJson(json['customer'] as Map<String, dynamic>),
  restaurant: json['restaurant'] == null
      ? null
      : DriverOrderRestaurant.fromJson(
          json['restaurant'] as Map<String, dynamic>,
        ),
  deliveryAddress: json['deliveryAddress'] == null
      ? null
      : DeliveryAddressInfo.fromJson(
          json['deliveryAddress'] as Map<String, dynamic>,
        ),
  status: json['status'] as String?,
  total: (json['total'] as num?)?.toDouble(),
  specialInstructions: json['specialInstructions'] as String?,
);

Map<String, dynamic> _$$DriverActiveOrderImplToJson(
  _$DriverActiveOrderImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'orderNumber': instance.orderNumber,
  'customer': instance.customer,
  'restaurant': instance.restaurant,
  'deliveryAddress': instance.deliveryAddress,
  'status': instance.status,
  'total': instance.total,
  'specialInstructions': instance.specialInstructions,
};

_$DriverOrderHistoryItemImpl _$$DriverOrderHistoryItemImplFromJson(
  Map<String, dynamic> json,
) => _$DriverOrderHistoryItemImpl(
  id: json['_id'] as String,
  orderNumber: json['orderNumber'] as String,
  restaurant: json['restaurant'] == null
      ? null
      : DriverOrderHistoryRestaurant.fromJson(
          json['restaurant'] as Map<String, dynamic>,
        ),
  status: json['status'] as String?,
  total: (json['total'] as num?)?.toDouble(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$DriverOrderHistoryItemImplToJson(
  _$DriverOrderHistoryItemImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'orderNumber': instance.orderNumber,
  'restaurant': instance.restaurant,
  'status': instance.status,
  'total': instance.total,
  'createdAt': instance.createdAt?.toIso8601String(),
};

_$DriverOrderHistoryRestaurantImpl _$$DriverOrderHistoryRestaurantImplFromJson(
  Map<String, dynamic> json,
) => _$DriverOrderHistoryRestaurantImpl(
  id: json['_id'] as String?,
  name: json['name'] as String?,
);

Map<String, dynamic> _$$DriverOrderHistoryRestaurantImplToJson(
  _$DriverOrderHistoryRestaurantImpl instance,
) => <String, dynamic>{'_id': instance.id, 'name': instance.name};

_$PickupResponseImpl _$$PickupResponseImplFromJson(Map<String, dynamic> json) =>
    _$PickupResponseImpl(
      id: json['_id'] as String,
      orderNumber: json['orderNumber'] as String,
      status: json['status'] as String?,
      statusHistory: (json['statusHistory'] as List<dynamic>?)
          ?.map((e) => OrderStatusLog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PickupResponseImplToJson(
  _$PickupResponseImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'orderNumber': instance.orderNumber,
  'status': instance.status,
  'statusHistory': instance.statusHistory,
};

_$DeliverResponseImpl _$$DeliverResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DeliverResponseImpl(
  id: json['_id'] as String,
  orderNumber: json['orderNumber'] as String,
  status: json['status'] as String?,
  actualDeliveryTime: json['actualDeliveryTime'] == null
      ? null
      : DateTime.parse(json['actualDeliveryTime'] as String),
  statusHistory: (json['statusHistory'] as List<dynamic>?)
      ?.map((e) => OrderStatusLog.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$DeliverResponseImplToJson(
  _$DeliverResponseImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'orderNumber': instance.orderNumber,
  'status': instance.status,
  'actualDeliveryTime': instance.actualDeliveryTime?.toIso8601String(),
  'statusHistory': instance.statusHistory,
};

_$OrderStatusLogImpl _$$OrderStatusLogImplFromJson(Map<String, dynamic> json) =>
    _$OrderStatusLogImpl(
      status: json['status'] as String,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$OrderStatusLogImplToJson(
  _$OrderStatusLogImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'timestamp': instance.timestamp?.toIso8601String(),
  'note': instance.note,
};

_$EarningsSummaryImpl _$$EarningsSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$EarningsSummaryImpl(
  totalDeliveries: (json['totalDeliveries'] as num).toInt(),
  totalEarnings: (json['totalEarnings'] as num).toDouble(),
  todayDeliveries: (json['todayDeliveries'] as num).toInt(),
  todayEarnings: (json['todayEarnings'] as num).toDouble(),
);

Map<String, dynamic> _$$EarningsSummaryImplToJson(
  _$EarningsSummaryImpl instance,
) => <String, dynamic>{
  'totalDeliveries': instance.totalDeliveries,
  'totalEarnings': instance.totalEarnings,
  'todayDeliveries': instance.todayDeliveries,
  'todayEarnings': instance.todayEarnings,
};

_$EarningsOrderImpl _$$EarningsOrderImplFromJson(Map<String, dynamic> json) =>
    _$EarningsOrderImpl(
      id: json['_id'] as String,
      orderNumber: json['orderNumber'] as String,
      restaurant: json['restaurant'] == null
          ? null
          : EarningsOrderRestaurant.fromJson(
              json['restaurant'] as Map<String, dynamic>,
            ),
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble(),
      actualDeliveryTime: json['actualDeliveryTime'] == null
          ? null
          : DateTime.parse(json['actualDeliveryTime'] as String),
    );

Map<String, dynamic> _$$EarningsOrderImplToJson(_$EarningsOrderImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'orderNumber': instance.orderNumber,
      'restaurant': instance.restaurant,
      'deliveryFee': instance.deliveryFee,
      'actualDeliveryTime': instance.actualDeliveryTime?.toIso8601String(),
    };

_$EarningsOrderRestaurantImpl _$$EarningsOrderRestaurantImplFromJson(
  Map<String, dynamic> json,
) => _$EarningsOrderRestaurantImpl(
  id: json['_id'] as String?,
  name: json['name'] as String?,
);

Map<String, dynamic> _$$EarningsOrderRestaurantImplToJson(
  _$EarningsOrderRestaurantImpl instance,
) => <String, dynamic>{'_id': instance.id, 'name': instance.name};

_$DriverEarningsImpl _$$DriverEarningsImplFromJson(Map<String, dynamic> json) =>
    _$DriverEarningsImpl(
      orders: (json['orders'] as List<dynamic>)
          .map((e) => EarningsOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      summary: EarningsSummary.fromJson(
        json['summary'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$DriverEarningsImplToJson(
  _$DriverEarningsImpl instance,
) => <String, dynamic>{
  'orders': instance.orders,
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
  'summary': instance.summary,
};
