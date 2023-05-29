import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/item_dto.dart';
import 'package:maestroni/services/shopping_cart_service.dart';
import 'package:stacked/stacked.dart';

class DishCardViewModel extends ReactiveViewModel {
  DishCardViewModel(this.item);
  final _shoppingCartService = locator<ShoppingCartService>();
  final ItemDTO item;

  int get currentItemCount => _shoppingCartService.cart.value[item] ?? 0;

  void addToCart() {
    if (currentItemCount >= 99) return;
    _shoppingCartService.addToCart(item);
  }

  void removeFromCart() {
    _shoppingCartService.removeFromCart(item);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_shoppingCartService];
}
