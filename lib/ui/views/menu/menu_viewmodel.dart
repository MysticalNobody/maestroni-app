import 'package:flutter/cupertino.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/data/models/category_dto.dart';
import 'package:maestroni/data/models/item_dto.dart';
import 'package:maestroni/data/models/news_dto.dart';
import 'package:maestroni/services/addresses_service.dart';
import 'package:maestroni/services/authentication_service.dart';
import 'package:maestroni/services/news_service.dart';
import 'package:maestroni/services/products_service.dart';
import 'package:scrollview_observer/scrollview_observer.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MenuViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _productsService = locator<ProductsService>();
  final _newsService = locator<NewsService>();
  final _addressesService = locator<AddressesService>();
  final _authService = locator<AuthenticationService>();

  final GlobalKey appBarKey = GlobalKey();

  int currentCategoryIndex = 0;
  final ScrollController tabsScrollController = ScrollController();
  late final ListObserverController tabsObserverController = ListObserverController(controller: tabsScrollController);
  final ScrollController listScrollController = ScrollController();
  late final ListObserverController listObserverController = ListObserverController(controller: listScrollController);

  late final SliverObserverController observerController = SliverObserverController(controller: listScrollController);
  BuildContext? listCtx;

  List<CategoryDTO> get categories => _productsService.categories
      .where((p0) => p0.displayData?.isActive ?? true)
      .map((e) => e.copyWith(products: e.products.where((element) => element.displayData?.isActive ?? true).toList()))
      .toList();
  List<NewsDTO> get news => _newsService.news;

  List<AddressDTO> get addresses => _addressesService.addresses;
  AddressDTO? get selectedAddress => _addressesService.selectedAddress.value;

  bool get isAuth => _authService.authToken.value?.isNotEmpty == true;

  double calcPersistentHeaderExtent(double offset) {
    return ObserverUtils.calcPersistentHeaderExtent(
      key: appBarKey,
      offset: offset,
    );
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
    await runBusyFuture(_addressesService.fetch());
  }

  Future<void> onMenuItemTap(int index, double screenWidth, double bottom) async {
    observerController.animateTo(
        sliverContext: listCtx,
        index: index,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        offset: calcPersistentHeaderExtent);
    tabsObserverController.animateTo(
      index: index,
      duration: const Duration(milliseconds: 700),
      alignment: 0,
      curve: Curves.easeInOut,
    );
    currentCategoryIndex = index;
    notifyListeners();
  }

  void onObserve(ListViewObserveModel model) {
    currentCategoryIndex = ObserverUtils.calcAnchorTabIndex(
      observeModel: model,
      tabIndexs: List.generate(categories.length, (index) => index),
      currentTabIndex: currentCategoryIndex,
    );
    tabsObserverController.animateTo(
      index: currentCategoryIndex,
      alignment: 0,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  Future<void> onAddAddressTap() async {
    _navigationService.navigateToAddAddressView(addressDTO: null);
  }

  Future<void> onRegTap() async {
    _navigationService.navigateToAuthPhoneView(fromCart: false);
  }

  Future<void> onPromotionTap(NewsDTO promotion) async {
    return _navigationService.navigateToPromotionView(promotion: promotion);
  }

  Future<void> onDishTap(ItemDTO dish) async {
    _navigationService.navigateToDishView(dishDataModel: dish);
  }

  void selectAddress(AddressDTO address) {
    _addressesService.selectedAddress.value = address;
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_productsService, _newsService, _addressesService, _authService];
}
