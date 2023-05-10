import 'package:tinkoff_acquiring_sdk/models/tinkoff_taxation.dart';

import '../extensions.dart';
import 'tinkoff_item.dart';

class TinkoffReceipt {
  TinkoffReceipt({
    this.shopCode,
    this.email,
    this.taxation,
    this.phone,
    this.items,
  });

  final String? shopCode;
  final String? email;
  final TinkoffTaxation? taxation;
  final String? phone;
  final List<TinkoffItem>? items;

  Map<String, dynamic> toMap() {
    return {
      'shopCode': shopCode,
      'email': email,
      'taxation': taxation?.toEnumString(),
      'phone': phone,
      'items': items?.map((x) => x.toMap()).toList(),
    };
  }
}
