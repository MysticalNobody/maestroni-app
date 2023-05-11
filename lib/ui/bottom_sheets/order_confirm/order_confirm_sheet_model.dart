import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/services/addresses_service.dart';
import 'package:maestroni/services/payment_service.dart';
import 'package:maestroni/services/shopping_cart_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OrderConfirmSheetModel extends ReactiveViewModel {
  final _addressesService = locator<AddressesService>();
  final _paymentService = locator<PaymentService>();
  final _navigationService = locator<NavigationService>();
  final _shoppingCartService = locator<ShoppingCartService>();

  List<AddressDTO> get addresses => _addressesService.addresses;

  Future<void> fetch() => _addressesService.fetch();
  bool isDelivery = true;

  void onDeliveryChange(bool? val) {
    isDelivery = val ?? false;
    rebuildUi();
  }

  Future<void> onReady() async {
    if (addresses.isEmpty) {
      fetch();
    }
  }

  Future<void> onPay() async {
    await _paymentService.inited.future;
    await _paymentService.pay(
      externalId: '0',
      id: '2',
      amount: _shoppingCartService.cartPrice,
    );
  }
}
