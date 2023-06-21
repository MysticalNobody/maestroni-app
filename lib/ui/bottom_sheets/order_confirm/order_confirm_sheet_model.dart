import 'package:flutter/material.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/data/models/dish_dto.dart';
import 'package:maestroni/data/models/item_dto.dart';
import 'package:maestroni/services/addresses_service.dart';
import 'package:maestroni/services/authentication_service.dart';
import 'package:maestroni/services/payment_service.dart';
import 'package:maestroni/services/shopping_cart_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../data/models/rest_address_dto.dart';
import '../../../services/products_service.dart';

class OrderConfirmSheetModel extends ReactiveViewModel {
  final _addressesService = locator<AddressesService>();
  final _paymentService = locator<PaymentService>();
  final _navigationService = locator<NavigationService>();
  final _shoppingCartService = locator<ShoppingCartService>();
  final _authService = locator<AuthenticationService>();
  final _bsService = locator<BottomSheetService>();
  final _productsService = locator<ProductsService>();

  List<AddressDTO> get addresses => _addressesService.addresses;
  AddressDTO? get selectedAddress => _addressesService.selectedAddress.value;

  List<RestAddressDTO> get restorants => _addressesService.restorants;
  RestAddressDTO? get selectedRestoran =>
      _addressesService.selectedRestoran.value;

  double get _subtotal => _shoppingCartService.cartPrice;
  ItemDTO get _delivery => _productsService.categories
      .firstWhere((p0) => p0.id == '64467f57-9e39-46fe-9163-349a79d7c2c2')
      .products
      .first;
  double get _deliveryPrice => _delivery.price;

  String get subtotalString => '${_subtotal.toStringAsFixed(0)} ₽';
  String get deliveryPriceString => '${_deliveryPrice.toStringAsFixed(0)} ₽';
  String get totalString =>
      '${(_subtotal + (isDelivery ? _deliveryPrice : 0)).toStringAsFixed(0)} ₽';

  final TextEditingController commentController = TextEditingController();

  Future<void> fetch() async => await _addressesService.fetch();
  bool isDelivery = true;

  bool isPaymentProcess = false;

  bool soonest = true;

  DateTime expectedAt =
      DateTime.now().add(const Duration(hours: 2)).copyWith(minute: 0);

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

  setSoonest(bool? s) {
    soonest = s ?? soonest;
    notifyListeners();
  }

  Future<void> addAddress() async {
    await _navigationService.navigateToAddAddressView(
        addressDTO: null, preventDuplicates: false);
  }

  Future<void> onPay() async {
    isPaymentProcess = true;
    notifyListeners();
    final dishList = _shoppingCartService.cart.value.entries
        .map(
          (e) => DishDTO(
            id: e.key.id,
            name: e.key.displayName,
            price: e.key.price.toString(),
            quantity: e.value.toString(),
          ),
        )
        .toList();
    if (isDelivery) {
      dishList.add(DishDTO(
          id: _delivery.id,
          name: _delivery.displayName,
          price: _delivery.price.toString(),
          quantity: 1.toString()));
    }
    await _paymentService.createOrder(
        dishList: _shoppingCartService.cart.value.entries
            .map(
              (e) => DishDTO(
                id: e.key.id,
                name: e.key.displayName,
                price: e.key.price.toString(),
                quantity: e.value.toString(),
              ),
            )
            .toList(),
        soonest: soonest ? soonest : false,
        expectedAt: soonest ? null : expectedAt,
        isDelivery: isDelivery,
        paymentType: selectedPayType,
        restaurantId: isDelivery ? null : selectedRestoran!.id,
        changeFrom: null,
        comment:
            '${commentController.text}\n${selectedPayType.getString().toUpperCase()}',
        persons: 1,
        address: isDelivery ? selectedAddress : null);
    isPaymentProcess = false;
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_shoppingCartService, _addressesService, _authService];

  Future<void> setDateTime() async {
    final res = await _bsService.showCustomSheet(
        variant: BottomSheetType.expectedAtPicker,
        barrierDismissible: false,
        isScrollControlled: false,
        ignoreSafeArea: false);
    if (res?.data is DateTime) {
      expectedAt = res!.data;
      notifyListeners();
    }
  }
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
