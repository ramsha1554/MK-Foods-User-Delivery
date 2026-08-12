import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/locator.dart';
import '../../../../data/models/auth_models.dart';
import '../../../../data/repositories/customer_repository.dart';

final profileProvider = FutureProvider<User>((ref) {
  return locator<CustomerRepository>().getProfile();
});