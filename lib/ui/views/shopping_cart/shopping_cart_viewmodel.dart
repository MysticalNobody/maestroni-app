import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:maestroni/app/app.bottomsheets.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:maestroni/data/models/item_dto.dart';
import 'package:maestroni/res/consts/work_time.dart';
import 'package:maestroni/services/home_menu_service.dart';
import 'package:maestroni/services/shopping_cart_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/authentication_service.dart';

class ShoppingCartViewModel extends ReactiveViewModel {
  HomeMenuService homeMenuService = locator<HomeMenuService>();
  ShoppingCartService shoppingCartService = locator<ShoppingCartService>();
  final _bsService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();

  Map<ItemDTO, int> get cart => shoppingCartService.cart.value;

  bool get isEmpty => cart.isEmpty;

  bool get isAuth => _authService.authToken.value?.isNotEmpty == true;

  double get total => shoppingCartService.cart.value.entries
      .map(
        (e) => e.key.price * e.value,
      )
      .sum;

  void goToMenu() {
    homeMenuService.changePage(0);
  }

  bool isWorkingTime() {
    TimeOfDay now = TimeOfDay.now();
    return ((now.hour > fromWorkTime.hour) ||
            (now.hour == fromWorkTime.hour &&
                now.minute >= fromWorkTime.minute)) &&
        ((now.hour < endWorkTime.hour) ||
            (now.hour == endWorkTime.hour && now.minute <= endWorkTime.minute));
  }

  Future<void> onDishTap(ItemDTO dish) async {
    _navigationService.navigateToDishView(dishDataModel: dish);
  }

  Future<void> onOrderConfirm() async {
    if (isWorkingTime()) {
      if (isAuth) {
        _bsService.showCustomSheet(
            variant: BottomSheetType.orderConfirm,
            isScrollControlled: true,
            ignoreSafeArea: false);
      } else {
        _navigationService.navigateToAuthPhoneView(fromCart: true);
      }
    } else {
      notifyListeners();
      return;
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [shoppingCartService, _authService];
}
