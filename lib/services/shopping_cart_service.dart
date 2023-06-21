import 'package:collection/collection.dart';
import 'package:maestroni/data/models/item_dto.dart';
import 'package:stacked/stacked.dart';

class ShoppingCartService with ListenableServiceMixin {
  ShoppingCartService() {
    listenToReactiveValues([cart]);
  }
  ReactiveValue<Map<ItemDTO, int>> cart = ReactiveValue({});

  clear() {
    cart.value.clear();
    notifyListeners();
  }

  int get cartCount {
    int count = 0;
    for (var element in cart.value.values) {
      count += element;
    }
    return count;
  }

  double get cartPrice {
    double count = 0;
    for (var element in cart.value.keys) {
      count += element.price * (cart.value[element] ?? 0);
    }
    return count;
  }

  int getCountById(String id) {
    final res = cart.value.keys.firstWhereOrNull((element) => element.id == id);
    return cart.value[res] ?? 0;
  }

  void addToCart(ItemDTO dishDataModel) {
    cart.value[dishDataModel] = (cart.value[dishDataModel] ?? 0) + 1;
    notifyListeners();
  }

  void removeFromCart(ItemDTO dishDataModel) {
    try {
      if (cart.value[dishDataModel]! > 1) {
        cart.value[dishDataModel] = cart.value[dishDataModel]! - 1;
      } else {
        cart.value.removeWhere((key, value) => key == dishDataModel);
      }
    } on StateError {
      notifyListeners();
      return;
    }
    notifyListeners();
  }
}
