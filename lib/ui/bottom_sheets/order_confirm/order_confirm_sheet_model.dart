import 'package:flutter/material.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/data/models/dish_dto.dart';
import 'package:maestroni/services/addresses_service.dart';
import 'package:maestroni/services/authentication_service.dart';
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
  final _authService = locator<AuthenticationService>();

  List<AddressDTO> get addresses => _addressesService.addresses;
  AddressDTO? get selectedAddress => _addressesService.selectedAddress.value;

  List<RestAddressDTO> get restorants => _addressesService.restorants;
  RestAddressDTO? get selectedRestoran =>
      _addressesService.selectedRestoran.value;

  final TextEditingController commentController = TextEditingController();

  Future<void> fetch() async => await _addressesService.fetch();
  bool isDelivery = true;

  bool isPaymentProcess = false;

  PayType selectedPayType = PayType.values.first;

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
    await _navigationService.navigateToAddAddressView(
        addressDTO: null, preventDuplicates: false);
  }

  Future<void> onPay() async {
    bool result;
    if (selectedPayType == PayType.cash || selectedPayType == PayType.card) {
      isPaymentProcess = true;
      notifyListeners();
      result = await _paymentService.payCashOrCard(
          dishList: _shoppingCartService.cart.value.entries
              .map(
                (e) => DishDTO(
                  id: e.key.id,
                  name: e.key.name,
                  price: e.key.price.toString(),
                  quantity: e.value.toString(),
                ),
              )
              .toList(),
          expeditionType: isDelivery ? 'delivery' : 'pickup',
          paymentTypeId: selectedPayType.name,
          restaurantId: isDelivery ? null : selectedRestoran!.id,
          changeFrom: null,
          comment:
              '${commentController.text}\n${selectedPayType.getString().toUpperCase()}',
          persons: 1,
          address: isDelivery ? selectedAddress : null);
    } else {
      result = await _paymentService.payOnline(
          dishList: _shoppingCartService.cart.value.entries
              .map(
                (e) => DishDTO(
                  id: e.key.id,
                  name: e.key.name,
                  price: e.key.price.toString(),
                  quantity: e.value.toString(),
                ),
              )
              .toList(),
          expeditionType: isDelivery ? 'delivery' : 'pickup',
          paymentTypeId: selectedPayType.name,
          restaurantId: isDelivery ? null : selectedRestoran!.id,
          changeFrom: null,
          comment:
              '${commentController.text}\n${selectedPayType.getString().toUpperCase()}',
          persons: 1,
          address: isDelivery ? selectedAddress : null);
    }
    isPaymentProcess = false;
    notifyListeners();
    if (result) {
      _shoppingCartService
        ..cart.value.clear()
        ..notifyListeners();
      _navigationService
        ..back()
        ..navigateToOrdersHistoryView();
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_shoppingCartService, _addressesService, _authService];
}

enum PayType {
  cash,
  card,
  online;

  String getString() {
    switch (this) {
      case PayType.cash:
        return 'Оплата наличными при получении';
      case PayType.card:
        return 'Оплата картой при получении';
      case PayType.online:
        return 'Оплата онлайн в приложении';
    }
  }
}
