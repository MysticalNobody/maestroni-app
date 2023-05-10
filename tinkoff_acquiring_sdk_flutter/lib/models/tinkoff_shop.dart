class TinkoffShop {
  TinkoffShop({
    this.shopCode,
    this.name,
    this.amount,
    this.fee,
  });

  final String? shopCode;
  final String? name;
  final double? amount;
  final String? fee;

  Map<String, dynamic> toMap() {
    return {
      'shopCode': shopCode,
      'name': name,
      'amount': amount,
      'fee': fee,
    };
  }
}
