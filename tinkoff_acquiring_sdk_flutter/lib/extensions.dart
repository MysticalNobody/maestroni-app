import 'package:tinkoff_acquiring_sdk/models/tinkoff_tax.dart';
import 'package:tinkoff_acquiring_sdk/models/tinkoff_taxation.dart';

extension TaxationToString on TinkoffTaxation {
  String toEnumString() {
    return toString().split('.').last;
  }
}

extension TaxToString on TinkoffTax {
  String toEnumString() {
    return toString().split('.').last;
  }
}
