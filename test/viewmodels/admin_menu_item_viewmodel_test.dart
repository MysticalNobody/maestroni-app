import 'package:flutter_test/flutter_test.dart';
import 'package:maestroni/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AdminMenuItemViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
