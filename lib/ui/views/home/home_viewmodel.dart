import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/services/home_menu_service.dart';
import 'package:maestroni/services/shopping_cart_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends ReactiveViewModel {
  HomeMenuService homeMenuService = locator<HomeMenuService>();
  final _shoppingCartService = locator<ShoppingCartService>();

  int get cartCount => _shoppingCartService.cartCount;

  HomePage get page => homeMenuService.page.value;

  void onChangePage(int index) => homeMenuService.changePage(index);

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [homeMenuService, _shoppingCartService];
}
