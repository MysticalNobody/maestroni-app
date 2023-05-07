import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/item_dto.dart';
import 'package:maestroni/services/home_menu_service.dart';
import 'package:maestroni/services/shopping_cart_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DishViewModel extends ReactiveViewModel {
  DishViewModel(this.item);

  final ItemDTO item;
  final _shoppingCartService = locator<ShoppingCartService>();
  final _navigationService = locator<NavigationService>();
  final _homeMenuService = locator<HomeMenuService>();

  int get count => _shoppingCartService.getCountById(item.id);

  void addToCart() {
    _shoppingCartService.addToCart(item);
  }

  void removeFromCart() {
    _shoppingCartService.removeFromCart(item);
  }

  Future<void> goToCart() async {
    _navigationService.back();
    _homeMenuService.changePage(3);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_shoppingCartService];
}
