import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:maestroni/data/models/category_dto.dart';
import 'package:maestroni/data/models/item_dto.dart';
import 'package:maestroni/data/models/news_dto.dart';
import 'package:maestroni/services/news_service.dart';
import 'package:maestroni/services/payment_service.dart';
import 'package:maestroni/services/products_service.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tinkoff_acquiring/tinkoff_acquiring.dart';

class MenuViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _productsService = locator<ProductsService>();
  final _newsService = locator<NewsService>();
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemScrollController menuScrollController = ItemScrollController();

  int currentCategoryIndex = 0;
  PageController promotionsControler = PageController(viewportFraction: 0.9);
  ScrollController scrollController = ScrollController();

  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  List<CategoryDTO> get categories => _productsService.categories;
  List<NewsDTO> get news => _newsService.news;

  List<ItemDTO> get items {
    List<ItemDTO> itemList = [];
    for (final c in categories) {
      itemList.addAll(c.products);
    }
    return itemList;
  }

  Future<void> onReady() async {
    if (categories.isEmpty) {
      await runBusyFuture(
        _productsService.fetch(),
      );
    }
    if (news.isEmpty) {
      await runBusyFuture(
        _newsService.fetch(),
      );
    }
    itemPositionsListener.itemPositions.addListener(() {
      menuScrollController.jumpTo(
        index: itemPositionsListener.itemPositions.value.first.index,
      );
      if (itemPositionsListener.itemPositions.value.first.index != currentCategoryIndex) {
        currentCategoryIndex = itemPositionsListener.itemPositions.value.first.index;
        notifyListeners();
      }
    });
  }

  Future<void> onPay() async {
    // final TinkoffAcquiring acquiring = TinkoffAcquiring(
    //   TinkoffAcquiringConfig.credential(
    //     terminalKey: '1667394428171DEMO',
    //     // terminalKey: '1667394428171',
    //     password: '6ijd85pmrp0sxusu', // if not passed, it will work in passwordless mode
    //     // password: '07dbdvcst1vmg2sw',
    //     isDebugMode: true,
    //   ),
    // );
    // final InitResponse init = await acquiring.init(
    //   InitRequest(
    //     orderId: (99 +
    //             Random(DateTime.now().millisecondsSinceEpoch)
    //                 .nextInt(100000))
    //         .toString(),
    //     // customerKey: 'Maestroni',
    //     description: '123',
    //     amount: 100,
    //     language: Language.ru,
    //   ),
    // );
  }

  Future<void> onMenuItemTap(int index) async {
    itemScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  Future<void> onPromotionTap(NewsDTO promotion) async {
    return _navigationService.navigateToPromotionView(promotion: promotion);
  }

  Future<void> onDishTap(ItemDTO dish) async {
    _navigationService.navigateToDishView(dishDataModel: dish);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_productsService, _newsService];
}
