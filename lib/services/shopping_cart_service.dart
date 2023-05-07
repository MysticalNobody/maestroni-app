import 'package:collection/collection.dart';
import 'package:maestroni/data/models/item_dto.dart';
import 'package:stacked/stacked.dart';

class ShoppingCartService with ListenableServiceMixin {
  ShoppingCartService() {
    listenToReactiveValues([cart]);
  }
  ReactiveValue<Map<ItemDTO, int>> cart = ReactiveValue({});

  int get cartCount {
    int count = 0;
    for (var element in cart.value.values) {
      count += element;
    }
    return count;
  }

  int getCountById(String id) {
    final res = cart.value.keys.firstWhereOrNull((element) => element.id == id);
    return cart.value[res] ?? 0;
  }

  void addToCart(ItemDTO dishDataModel) {
    try {
      cart.value.keys.firstWhere((element) => element.id == dishDataModel.id);
      cart.value[dishDataModel] = cart.value[dishDataModel]! + 1;
    } on StateError {
      cart.value.addAll({dishDataModel: 1});
    }
    notifyListeners();
  }

  void removeFromCart(ItemDTO dishDataModel) {
    try {
      cart.value.keys.firstWhere((element) => element.id == dishDataModel.id);
      if (cart.value[dishDataModel]! > 1) {
        cart.value[dishDataModel] = cart.value[dishDataModel]! - 1;
      } else {
        cart.value.remove(dishDataModel);
      }
    } on StateError {
      notifyListeners();
      return;
    }
    notifyListeners();
  }
}
