import '../../core/utils/app_log.dart';
import '../api/api_client.dart';
import '../api/api_endpoints.dart';
import '../models/api_response.dart';
import '../models/auth_models.dart';
import '../models/customer_models.dart';

class CustomerRepository {
  final ApiClient _apiClient;

  CustomerRepository(this._apiClient);

  // ────────────────────────────────────────────
  //  Auth
  // ────────────────────────────────────────────

  Future<ApiResponse> requestOtp(RequestOtpRequest request) {
    AppLog.i('[AUTH]', 'requestOtp', 'OTP requested', {'phone': request.phone});
    return _apiClient.post(
      ApiEndpoints.requestOtp,
      body: request.toJson(),
    );
  }

  Future<AuthData> verifyOtp(VerifyOtpRequest request) async {
    AppLog.i('[AUTH]', 'verifyOtp', 'Verifying OTP', {'phone': request.phone});
    try {
      final response = await _apiClient.post(
        ApiEndpoints.verifyOtp,
        body: request.toJson(),
      );
      final data = AuthData.fromJson(response.data as Map<String, dynamic>);
      AppLog.i('[AUTH]', 'verifyOtp', 'Auth success', {
        'userId': data.user.id,
        'isNewUser': data.user.isNewUser,
      });
      return data;
    } catch (e, st) {
      AppLog.e('[AUTH]', 'verifyOtp', 'Auth failed', null, e, st);
      rethrow;
    }
  }

  Future<User> getProfile() async {
    AppLog.i('[AUTH]', 'getProfile', 'Fetching profile');
    final response = await _apiClient.get(ApiEndpoints.userMe);
    return User.fromJson(response.data as Map<String, dynamic>);
  }

  Future<User> updateProfile(UpdateProfileRequest request) async {
    AppLog.i('[AUTH]', 'updateProfile', 'Updating profile', request.toJson());
    final response = await _apiClient.patch(
      ApiEndpoints.updateProfile,
      body: request.toJson(),
    );
    return User.fromJson(response.data as Map<String, dynamic>);
  }

  // ────────────────────────────────────────────
  //  Addresses
  // ────────────────────────────────────────────

  Future<List<Address>> getAddresses() async {
    AppLog.i('[API]', 'getAddresses', 'Fetching addresses');
    final response = await _apiClient.get(ApiEndpoints.addresses);
    final list = (response.data as List<dynamic>)
        .map((e) => Address.fromJson(e as Map<String, dynamic>))
        .toList();
    AppLog.i('[API]', 'getAddresses', 'Addresses loaded', {'count': list.length});
    return list;
  }

  Future<Address> saveAddress(SaveAddressRequest request) async {
    AppLog.i('[API]', 'saveAddress', 'Saving address', {'label': request.label});
    final response = await _apiClient.post(
      ApiEndpoints.addresses,
      body: request.toJson(),
    );
    return Address.fromJson(response.data as Map<String, dynamic>);
  }

  Future<Address> setDefaultAddress(String id) async {
    AppLog.i('[API]', 'setDefaultAddress', 'Setting default', {'addressId': id});
    final response = await _apiClient.patch(
      ApiEndpoints.addressDefault(id),
    );
    return Address.fromJson(response.data as Map<String, dynamic>);
  }

  Future<Address> updateAddress(String id, SaveAddressRequest request) async {
    AppLog.i('[API]', 'updateAddress', 'Updating address', {'addressId': id});
    final response = await _apiClient.patch(
      ApiEndpoints.addressById(id),
      body: request.toJson(),
    );
    return Address.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> deleteAddress(String id) async {
    AppLog.i('[API]', 'deleteAddress', 'Deleting address', {'addressId': id});
    await _apiClient.delete(ApiEndpoints.addressById(id));
  }

  

  // ────────────────────────────────────────────
  //  Restaurants
  // ────────────────────────────────────────────

  Future<ApiResponse> getNearbyRestaurants({
    required double longitude,
    required double latitude,
    double? radius,
    String? cuisine,
    int? page,
    int? limit,
  }) {
    final params = <String, String>{
      'longitude': longitude.toString(),
      'latitude': latitude.toString(),
      if (radius != null) 'radius': radius.toString(),
      if (cuisine != null) 'cuisine': cuisine,
      if (page != null) 'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
    };
    AppLog.i('[API]', 'getNearbyRestaurants', 'Searching nearby', {'lat': latitude.toString(), 'lng': longitude.toString()});
    return _apiClient.get(
      ApiEndpoints.nearbyRestaurants,
      queryParams: params,
    );
  }

  Future<RestaurantDetail> getRestaurantDetail(String id) async {
    AppLog.i('[API]', 'getRestaurantDetail', 'Fetching restaurant', {'id': id});
    final response = await _apiClient.get(
      ApiEndpoints.restaurantDetail(id),
    );
    return RestaurantDetail.fromJson(response.data as Map<String, dynamic>);
  }

  // ────────────────────────────────────────────
  //  Orders
  // ────────────────────────────────────────────

  Future<Order> placeOrder(PlaceOrderRequest request) async {
    AppLog.i('[ORDER]', 'placeOrder', 'Placing order', {
      'restaurantId': request.restaurantId,
      'paymentMethod': request.paymentMethod,
    });
    final response = await _apiClient.post(
      ApiEndpoints.createOrder,
      body: request.toJson(),
    );
    return Order.fromJson(response.data as Map<String, dynamic>);
  }

  Future<ApiResponse> getMyOrders({int? page, int? limit}) {
    AppLog.i('[ORDER]', 'getMyOrders', 'Fetching orders', {
      if (page != null) 'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
    });
    final params = <String, String>{
      if (page != null) 'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
    };
    return _apiClient.get(
      ApiEndpoints.myOrders,
      queryParams: params.isNotEmpty ? params : null,
    );
  }

  Future<Order> getOrderDetails(String id) async {
    AppLog.i('[ORDER]', 'getOrderDetails', 'Fetching order details', {'orderId': id});
    final response = await _apiClient.get(ApiEndpoints.orderDetails(id));
    return Order.fromJson(response.data as Map<String, dynamic>);
  }

  Future<Order> cancelOrder(String id, {String? reason}) async {
    AppLog.i('[ORDER]', 'cancelOrder', 'Cancelling order', {'orderId': id, 'reason': reason});
    final response = await _apiClient.post(
      ApiEndpoints.cancelOrder(id),
      body: reason != null ? {'reason': reason} : null,
    );
    return Order.fromJson(response.data as Map<String, dynamic>);
  }


  // ────────────────────────────────────────────
  //  Payments
  // ────────────────────────────────────────────

  Future<PaymentIntentResponse> createPaymentIntent(String orderId) async {
    AppLog.i('[API]', 'createPaymentIntent', 'Creating payment intent', {'orderId': orderId});
    final response = await _apiClient.post(
      ApiEndpoints.createPaymentIntent,
      body: CreatePaymentIntentRequest(orderId: orderId).toJson(),
    );
    return PaymentIntentResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  // ────────────────────────────────────────────
  //  Ratings
  // ────────────────────────────────────────────

  Future<RatingResponse> submitRating(SubmitRatingRequest request) async {
    AppLog.i('[API]', 'submitRating', 'Submitting rating', {
      'orderId': request.orderId,
      'restaurantRating': request.restaurantRating,
    });
    final response = await _apiClient.post(
      ApiEndpoints.ratings,
      body: request.toJson(),
    );
    return RatingResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
