import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/locator.dart';
import '../../../../data/models/auth_models.dart';
import '../../../../data/repositories/customer_repository.dart';

/// Fetches the authoritative profile from the backend (includes fields
/// like email/createdAt that local storage doesn't persist).
final profileProvider = FutureProvider<User>((ref) {
  return locator<CustomerRepository>().getProfile();
});