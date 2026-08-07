// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SaveAddressRequestImpl _$$SaveAddressRequestImplFromJson(
  Map<String, dynamic> json,
) => _$SaveAddressRequestImpl(
  label: json['label'] as String,
  fullAddress: json['fullAddress'] as String,
  street: json['street'] as String,
  city: json['city'] as String,
  postcode: json['postcode'] as String,
  longitude: (json['longitude'] as num).toDouble(),
  latitude: (json['latitude'] as num).toDouble(),
  isDefault: json['isDefault'] as bool? ?? false,
  deliveryInstructions: json['deliveryInstructions'] as String?,
);

Map<String, dynamic> _$$SaveAddressRequestImplToJson(
  _$SaveAddressRequestImpl instance,
) => <String, dynamic>{
  'label': instance.label,
  'fullAddress': instance.fullAddress,
  'street': instance.street,
  'city': instance.city,
  'postcode': instance.postcode,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
  'isDefault': instance.isDefault,
  'deliveryInstructions': instance.deliveryInstructions,
};

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      id: json['_id'] as String,
      user: json['user'] as String?,
      label: json['label'] as String,
      fullAddress: json['fullAddress'] as String,
      street: json['street'] as String?,
      city: json['city'] as String?,
      postcode: json['postcode'] as String?,
      location: json['location'] == null
          ? null
          : GeoPoint.fromJson(json['location'] as Map<String, dynamic>),
      isDefault: json['isDefault'] as bool,
      deliveryInstructions: json['deliveryInstructions'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'label': instance.label,
      'fullAddress': instance.fullAddress,
      'street': instance.street,
      'city': instance.city,
      'postcode': instance.postcode,
      'location': instance.location,
      'isDefault': instance.isDefault,
      'deliveryInstructions': instance.deliveryInstructions,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$DayHoursImpl _$$DayHoursImplFromJson(Map<String, dynamic> json) =>
    _$DayHoursImpl(
      isOpen: json['isOpen'] as bool,
      open: json['open'] as String?,
      close: json['close'] as String?,
    );

Map<String, dynamic> _$$DayHoursImplToJson(_$DayHoursImpl instance) =>
    <String, dynamic>{
      'isOpen': instance.isOpen,
      'open': instance.open,
      'close': instance.close,
    };

_$RestaurantImpl _$$RestaurantImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantImpl(
      id: json['_id'] as String,
      owner: json['owner'],
      name: json['name'] as String,
      description: json['description'] as String?,
      cuisineType: (json['cuisineType'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] == null
          ? null
          : RestaurantAddress.fromJson(json['address'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : GeoPoint.fromJson(json['location'] as Map<String, dynamic>),
      logo: json['logo'] as String?,
      coverImage: json['coverImage'] as String?,
      minimumOrder: (json['minimumOrder'] as num?)?.toDouble(),
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble(),
      preparationTime: (json['preparationTime'] as num?)?.toInt(),
      operatingHours: (json['operatingHours'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, DayHours.fromJson(e as Map<String, dynamic>)),
      ),
      status: json['status'] as String?,
      isOpen: json['isOpen'] as bool?,
      isBusy: json['isBusy'] as bool?,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      totalRatings: (json['totalRatings'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$RestaurantImplToJson(_$RestaurantImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'owner': instance.owner,
      'name': instance.name,
      'description': instance.description,
      'cuisineType': instance.cuisineType,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'location': instance.location,
      'logo': instance.logo,
      'coverImage': instance.coverImage,
      'minimumOrder': instance.minimumOrder,
      'deliveryFee': instance.deliveryFee,
      'preparationTime': instance.preparationTime,
      'operatingHours': instance.operatingHours,
      'status': instance.status,
      'isOpen': instance.isOpen,
      'isBusy': instance.isBusy,
      'averageRating': instance.averageRating,
      'totalRatings': instance.totalRatings,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$MenuItemImpl _$$MenuItemImplFromJson(Map<String, dynamic> json) =>
    _$MenuItemImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toDouble(),
      isAvailable: json['isAvailable'] as bool? ?? true,
      image: json['image'] as String?,
      sortOrder: (json['sortOrder'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MenuItemImplToJson(_$MenuItemImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'isAvailable': instance.isAvailable,
      'image': instance.image,
      'sortOrder': instance.sortOrder,
    };

_$MenuCategoryImpl _$$MenuCategoryImplFromJson(Map<String, dynamic> json) =>
    _$MenuCategoryImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      sortOrder: (json['sortOrder'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MenuCategoryImplToJson(_$MenuCategoryImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'sortOrder': instance.sortOrder,
      'items': instance.items,
    };

_$RestaurantDetailImpl _$$RestaurantDetailImplFromJson(
  Map<String, dynamic> json,
) => _$RestaurantDetailImpl(
  restaurant: Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>),
  menu: (json['menu'] as List<dynamic>)
      .map((e) => MenuCategory.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$RestaurantDetailImplToJson(
  _$RestaurantDetailImpl instance,
) => <String, dynamic>{
  'restaurant': instance.restaurant,
  'menu': instance.menu,
};

_$OrderItemInputImpl _$$OrderItemInputImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemInputImpl(
      menuItemId: json['menuItemId'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$OrderItemInputImplToJson(
  _$OrderItemInputImpl instance,
) => <String, dynamic>{
  'menuItemId': instance.menuItemId,
  'quantity': instance.quantity,
};

_$PlaceOrderRequestImpl _$$PlaceOrderRequestImplFromJson(
  Map<String, dynamic> json,
) => _$PlaceOrderRequestImpl(
  restaurantId: json['restaurantId'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => OrderItemInput.fromJson(e as Map<String, dynamic>))
      .toList(),
  deliveryAddress: DeliveryAddressDetail.fromJson(
    json['deliveryAddress'] as Map<String, dynamic>,
  ),
  paymentMethod: json['paymentMethod'] as String,
  stripePaymentIntentId: json['stripePaymentIntentId'] as String?,
  specialInstructions: json['specialInstructions'] as String?,
);

Map<String, dynamic> _$$PlaceOrderRequestImplToJson(
  _$PlaceOrderRequestImpl instance,
) => <String, dynamic>{
  'restaurantId': instance.restaurantId,
  'items': instance.items,
  'deliveryAddress': instance.deliveryAddress,
  'paymentMethod': instance.paymentMethod,
  'stripePaymentIntentId': instance.stripePaymentIntentId,
  'specialInstructions': instance.specialInstructions,
};

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      menuItemId: json['menuItem'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toInt(),
      itemTotal: (json['itemTotal'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'menuItem': instance.menuItemId,
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
      'itemTotal': instance.itemTotal,
    };

_$OrderStatusHistoryImpl _$$OrderStatusHistoryImplFromJson(
  Map<String, dynamic> json,
) => _$OrderStatusHistoryImpl(
  status: json['status'] as String,
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
  note: json['note'] as String?,
);

Map<String, dynamic> _$$OrderStatusHistoryImplToJson(
  _$OrderStatusHistoryImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'timestamp': instance.timestamp?.toIso8601String(),
  'note': instance.note,
};

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
  id: json['_id'] as String,
  orderNumber: json['orderNumber'] as String,
  customer: json['customer'] as String?,
  restaurant: json['restaurant'],
  items: (json['items'] as List<dynamic>)
      .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  subtotal: (json['subtotal'] as num?)?.toDouble(),
  deliveryFee: (json['deliveryFee'] as num?)?.toDouble(),
  platformFee: (json['platformFee'] as num?)?.toDouble(),
  total: (json['total'] as num).toDouble(),
  paymentMethod: json['paymentMethod'] as String?,
  paymentStatus: json['paymentStatus'] as String?,
  status: json['status'] as String,
  statusHistory: (json['statusHistory'] as List<dynamic>?)
      ?.map((e) => OrderStatusHistory.fromJson(e as Map<String, dynamic>))
      .toList(),
  deliveryAddress: json['deliveryAddress'] == null
      ? null
      : DeliveryAddressInfo.fromJson(
          json['deliveryAddress'] as Map<String, dynamic>,
        ),
  specialInstructions: json['specialInstructions'] as String?,
  cancellationReason: json['cancellationReason'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'orderNumber': instance.orderNumber,
      'customer': instance.customer,
      'restaurant': instance.restaurant,
      'items': instance.items,
      'subtotal': instance.subtotal,
      'deliveryFee': instance.deliveryFee,
      'platformFee': instance.platformFee,
      'total': instance.total,
      'paymentMethod': instance.paymentMethod,
      'paymentStatus': instance.paymentStatus,
      'status': instance.status,
      'statusHistory': instance.statusHistory,
      'deliveryAddress': instance.deliveryAddress,
      'specialInstructions': instance.specialInstructions,
      'cancellationReason': instance.cancellationReason,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$MyOrderImpl _$$MyOrderImplFromJson(Map<String, dynamic> json) =>
    _$MyOrderImpl(
      id: json['_id'] as String,
      orderNumber: json['orderNumber'] as String,
      restaurant: json['restaurant'] == null
          ? null
          : MyOrderRestaurant.fromJson(
              json['restaurant'] as Map<String, dynamic>,
            ),
      total: (json['total'] as num?)?.toDouble(),
      status: json['status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MyOrderImplToJson(_$MyOrderImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'orderNumber': instance.orderNumber,
      'restaurant': instance.restaurant,
      'total': instance.total,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$MyOrderRestaurantImpl _$$MyOrderRestaurantImplFromJson(
  Map<String, dynamic> json,
) => _$MyOrderRestaurantImpl(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  logo: json['logo'] as String?,
);

Map<String, dynamic> _$$MyOrderRestaurantImplToJson(
  _$MyOrderRestaurantImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'logo': instance.logo,
};

_$CancelOrderRequestImpl _$$CancelOrderRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CancelOrderRequestImpl(reason: json['reason'] as String?);

Map<String, dynamic> _$$CancelOrderRequestImplToJson(
  _$CancelOrderRequestImpl instance,
) => <String, dynamic>{'reason': instance.reason};

_$CreatePaymentIntentRequestImpl _$$CreatePaymentIntentRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreatePaymentIntentRequestImpl(orderId: json['orderId'] as String);

Map<String, dynamic> _$$CreatePaymentIntentRequestImplToJson(
  _$CreatePaymentIntentRequestImpl instance,
) => <String, dynamic>{'orderId': instance.orderId};

_$PaymentIntentResponseImpl _$$PaymentIntentResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PaymentIntentResponseImpl(
  clientSecret: json['clientSecret'] as String,
  paymentIntentId: json['paymentIntentId'] as String,
);

Map<String, dynamic> _$$PaymentIntentResponseImplToJson(
  _$PaymentIntentResponseImpl instance,
) => <String, dynamic>{
  'clientSecret': instance.clientSecret,
  'paymentIntentId': instance.paymentIntentId,
};

_$SubmitRatingRequestImpl _$$SubmitRatingRequestImplFromJson(
  Map<String, dynamic> json,
) => _$SubmitRatingRequestImpl(
  orderId: json['orderId'] as String,
  restaurantRating: (json['restaurantRating'] as num).toInt(),
  driverRating: (json['driverRating'] as num?)?.toInt(),
  comment: json['comment'] as String?,
);

Map<String, dynamic> _$$SubmitRatingRequestImplToJson(
  _$SubmitRatingRequestImpl instance,
) => <String, dynamic>{
  'orderId': instance.orderId,
  'restaurantRating': instance.restaurantRating,
  'driverRating': instance.driverRating,
  'comment': instance.comment,
};

_$RatingResponseImpl _$$RatingResponseImplFromJson(Map<String, dynamic> json) =>
    _$RatingResponseImpl(
      id: json['_id'] as String,
      orderId: json['order'] as String?,
      customer: json['customer'] as String?,
      restaurant: json['restaurant'] as String?,
      driver: json['driver'] as String?,
      restaurantRating: (json['restaurantRating'] as num?)?.toInt(),
      driverRating: (json['driverRating'] as num?)?.toInt(),
      comment: json['comment'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$RatingResponseImplToJson(
  _$RatingResponseImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'order': instance.orderId,
  'customer': instance.customer,
  'restaurant': instance.restaurant,
  'driver': instance.driver,
  'restaurantRating': instance.restaurantRating,
  'driverRating': instance.driverRating,
  'comment': instance.comment,
  'createdAt': instance.createdAt?.toIso8601String(),
};

_$UpdateProfileRequestImpl _$$UpdateProfileRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateProfileRequestImpl(
  name: json['name'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$$UpdateProfileRequestImplToJson(
  _$UpdateProfileRequestImpl instance,
) => <String, dynamic>{'name': instance.name, 'email': instance.email};
