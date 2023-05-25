import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/services/addresses_service.dart';
import 'package:maestroni/services/payment_service.dart';
import 'package:maestroni/services/shopping_cart_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../data/models/rest_address_dto.dart';

class OrderConfirmSheetModel extends ReactiveViewModel {
  final _addressesService = locator<AddressesService>();
  final _paymentService = locator<PaymentService>();
  final _navigationService = locator<NavigationService>();
  final _shoppingCartService = locator<ShoppingCartService>();

  List<AddressDTO> get addresses => _addressesService.addresses;
  AddressDTO? get selectedAddress => _addressesService.selectedAddress.value;

  List<RestAddressDTO> get restorants => _addressesService.restorants;
  RestAddressDTO? get selectedRestoran => _addressesService.selectedRestoran.value;

  Future<void> fetch() async => await _addressesService.fetch();
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

  void selectAddress(AddressDTO address) {
    _addressesService.selectedAddress.value = address;
    notifyListeners();
  }

  void selectRest(RestAddressDTO address) {
    _addressesService.selectedRestoran.value = address;
    notifyListeners();
  }

  Future<void> addAddress() async {
    await _navigationService.navigateToAddAddressView().then((value) async {
      await fetch();
      notifyListeners();
    });
    return;
  }

  Future<void> onPay() async {
    await _paymentService.inited.future;
    final resp = await _paymentService.pay(
      externalId: '0',
      id: '2',
      amount: _shoppingCartService.cartPrice,
    );
  }
}
