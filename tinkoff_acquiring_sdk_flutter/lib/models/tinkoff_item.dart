import '../extensions.dart';
import 'tinkoff_tax.dart';

class TinkoffItem {
  TinkoffItem(
    this.price,
    this.quantity,
    this.name,
    this.amount,
    this.tax,
  ); // Tax? = null

  final double price;
  // Количество/вес
  final double quantity;
  // Наименование товара
  final String name;
  // Сумма * количество/вес
  final double amount;
  // Ставка НДС
  final TinkoffTax tax;

  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'quantity': quantity,
      'name': name,
      'amount': amount,
      'tax': tax.toEnumString(),
    };
  }
}
