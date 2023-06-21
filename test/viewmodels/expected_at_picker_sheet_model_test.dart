import 'package:flutter_test/flutter_test.dart';
import 'package:maestroni/app/app.locator.dart';

void main() {
  group('ExpectedAtPickerSheetModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
