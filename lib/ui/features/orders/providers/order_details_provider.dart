import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/locator.dart';
import '../../../../data/models/customer_models.dart';
import '../../../../data/repositories/customer_repository.dart';

final orderDetailsProvider = FutureProvider.autoDispose.family<Order, String>((ref, id) {
  final repository = locator<CustomerRepository>();
  return repository.getOrderDetails(id);
});
