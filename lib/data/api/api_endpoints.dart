class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl =
      'https://supplier-prewar-corrosive.ngrok-free.dev/api/v1';
// 'https://api.mktours.co.uk/food/api/v1';
  // ── Auth ──
  static const String requestOtp = '/auth/request-otp';
  static const String verifyOtp = '/auth/verify-otp';
  static const String refreshToken = '/auth/refresh-token';

  // ── User ──
  static const String userMe = '/users/me';
  static const String updateLocation = '/users/me/location';
  static const String updateProfile = '/users/me';

  // ── Addresses (Customer) ──
  static const String addresses = '/addresses';
  static String addressById(String id) => '/addresses/$id';
  static String addressDefault(String id) => '/addresses/$id/default';

  
  // ── Restaurants (Customer) ──
  static const String nearbyRestaurants = '/restaurants/nearby';
  static String restaurantDetail(String id) => '/restaurants/$id';

  // ── Orders (Customer) ──
  static const String createOrder = '/orders';
  static const String myOrders = '/orders/my-orders';
  static String cancelOrder(String id) => '/orders/$id/cancel';

  // ── Payments (Customer) ──
  static const String createPaymentIntent = '/payments/create-intent';

  // ── Ratings (Customer) ──
  static const String ratings = '/ratings';

  // ── Driver ──
  static const String registerDriver = '/drivers/register';
  static const String driverDocuments = '/drivers/documents';
  static const String toggleOnline = '/drivers/toggle-online';
  static const String driverEarnings = '/drivers/earnings';

  // ── Orders (Driver) ──
  static const String driverActiveOrder = '/orders/driver/active';
  static const String driverOrderHistory = '/orders/driver/history';
  static String pickupOrder(String id) => '/orders/$id/pickup';
  static String deliverOrder(String id) => '/orders/$id/deliver';
}
