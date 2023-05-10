import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maestroni/app/app.bottomsheets.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:maestroni/data/models/item_dto.dart';
import 'package:maestroni/services/home_menu_service.dart';
import 'package:maestroni/services/shopping_cart_service.dart';
import 'package:maestroni/ui/bottom_sheets/order_confirm/order_confirm_sheet.dart';
import 'package:maestroni/ui/bottom_sheets/order_confirm/order_confirm_sheet_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ShoppingCartViewModel extends ReactiveViewModel {
  HomeMenuService homeMenuService = locator<HomeMenuService>();
  ShoppingCartService shoppingCartService = locator<ShoppingCartService>();
  final _bsService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  Map<ItemDTO, int> get cart => shoppingCartService.cart.value;

  bool get isEmpty => cart.isEmpty;

  double get total => shoppingCartService.cart.value.entries
      .map(
        (e) => e.key.price * e.value,
      )
      .sum;

  void goToMenu() {
    homeMenuService.changePage(0);
  }

  Future<void> onDishTap(ItemDTO dish) async {
    _navigationService.navigateToDishView(dishDataModel: dish);
  }

  Future<void> onOrderConfirm(BuildContext context) async {
    _bsService.showCustomSheet(variant: BottomSheetType.orderConfirm);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [shoppingCartService];
}
