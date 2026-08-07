import 'dart:io';

import '../../core/utils/app_log.dart';
import '../api/api_client.dart';
import '../api/api_endpoints.dart';
import '../models/api_response.dart';
import '../models/auth_models.dart';
import '../models/driver_models.dart';

class DriverRepository {
  final ApiClient _apiClient;

  DriverRepository(this._apiClient);

  // ────────────────────────────────────────────
  //  Auth / Profile
  // ────────────────────────────────────────────

  Future<User> getProfile() async {
    AppLog.i('[AUTH]', 'getProfile', 'Fetching driver profile');
    final response = await _apiClient.get(ApiEndpoints.userMe);
    return User.fromJson(response.data as Map<String, dynamic>);
  }

  // ────────────────────────────────────────────
  //  Registration
  // ────────────────────────────────────────────

  Future<DriverProfile> register(RegisterDriverRequest request) async {
    AppLog.i('[AUTH]', 'register', 'Registering driver', {
      'name': request.name,
      'vehicleType': request.vehicleType,
    });
    final response = await _apiClient.post(
      ApiEndpoints.registerDriver,
      body: request.toJson(),
    );
    return DriverProfile.fromJson(response.data as Map<String, dynamic>);
  }

  // ────────────────────────────────────────────
  //  Documents
  // ────────────────────────────────────────────

  Future<Document> uploadDocument({
    required String type,
    required File file,
  }) async {
    AppLog.i('[API]', 'uploadDocument', 'Uploading document', {
      'type': type,
      'filename': file.path.split('/').last,
    });
    final response = await _apiClient.uploadFile(
      ApiEndpoints.driverDocuments,
      fieldName: 'document',
      file: file,
      fields: {'type': type},
    );
    return Document.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<Document>> getDocuments() async {
    AppLog.i('[API]', 'getDocuments', 'Fetching documents');
    final response = await _apiClient.get(ApiEndpoints.driverDocuments);
    return (response.data as List<dynamic>)
        .map((e) => Document.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // ────────────────────────────────────────────
  //  Online / Offline
  // ────────────────────────────────────────────

  Future<ToggleOnlineResponse> toggleOnline() async {
    AppLog.i('[API]', 'toggleOnline', 'Toggling online status');
    final response = await _apiClient.patch(ApiEndpoints.toggleOnline);
    return ToggleOnlineResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  // ────────────────────────────────────────────
  //  Location
  // ────────────────────────────────────────────

  Future<LocationUpdateResponse> updateLocation({
    required double longitude,
    required double latitude,
  }) async {
    AppLog.i('[GEO]', 'updateLocation', 'Updating GPS', {
      'lat': latitude.toString(),
      'lng': longitude.toString(),
    });
    final response = await _apiClient.patch(
      ApiEndpoints.updateLocation,
      body: LocationUpdateRequest(
        longitude: longitude,
        latitude: latitude,
      ).toJson(),
    );
    return LocationUpdateResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  // ────────────────────────────────────────────
  //  Orders
  // ────────────────────────────────────────────

  Future<DriverActiveOrder?> getActiveOrder() async {
    AppLog.i('[ORDER]', 'getActiveOrder', 'Fetching active order');
    final response = await _apiClient.get(ApiEndpoints.driverActiveOrder);
    if (response.data == null) {
      AppLog.i('[ORDER]', 'getActiveOrder', 'No active order');
      return null;
    }
    return DriverActiveOrder.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  Future<ApiResponse> getOrderHistory({int? page, int? limit}) {
    AppLog.i('[ORDER]', 'getOrderHistory', 'Fetching history', {
      if (page != null) 'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
    });
    final params = <String, String>{
      if (page != null) 'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
    };
    return _apiClient.get(
      ApiEndpoints.driverOrderHistory,
      queryParams: params.isNotEmpty ? params : null,
    );
  }

  Future<PickupResponse> confirmPickup(String orderId) async {
    AppLog.i('[ORDER]', 'confirmPickup', 'Confirming pickup', {'orderId': orderId});
    final response =
        await _apiClient.patch(ApiEndpoints.pickupOrder(orderId));
    return PickupResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  Future<DeliverResponse> confirmDelivery(String orderId) async {
    AppLog.i('[ORDER]', 'confirmDelivery', 'Confirming delivery', {'orderId': orderId});
    final response =
        await _apiClient.patch(ApiEndpoints.deliverOrder(orderId));
    return DeliverResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  // ────────────────────────────────────────────
  //  Earnings
  // ────────────────────────────────────────────

  Future<DriverEarnings> getEarnings({int? page, int? limit}) async {
    AppLog.i('[API]', 'getEarnings', 'Fetching earnings', {
      if (page != null) 'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
    });
    final params = <String, String>{
      if (page != null) 'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
    };
    final response = await _apiClient.get(
      ApiEndpoints.driverEarnings,
      queryParams: params.isNotEmpty ? params : null,
    );
    return DriverEarnings.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
