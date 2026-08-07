import 'package:get_it/get_it.dart';

import '../../data/api/api_client.dart';
import '../../data/repositories/customer_repository.dart';
import '../../data/services/auth_storage_service.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<AuthStorageService>(() => AuthStorageService());

  final authStorage = locator<AuthStorageService>();
  await authStorage.init();

  final apiClient = ApiClient();
  if (authStorage.accessToken != null) {
    apiClient.setToken(authStorage.accessToken);
  }
  locator.registerLazySingleton<ApiClient>(() => apiClient);

  locator.registerLazySingleton<CustomerRepository>(
    () => CustomerRepository(locator<ApiClient>()),
  );
}
