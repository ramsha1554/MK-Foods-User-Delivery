import 'package:flutter_test/flutter_test.dart';

import 'package:mk_foods_user_driver/core/constants/app_config.dart';

void main() {
  test('AppConfig provides correct app name', () {
    expect(AppConfig.appName, 'MK Tours Food Delivery');
    expect(AppConfig.appNameShort, 'MK Tours');
    expect(AppConfig.logName, 'MKTours');
  });
}
