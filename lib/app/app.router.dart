// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i22;
import 'package:flutter/material.dart';
import 'package:maestroni/data/models/address_dto.dart' as _i25;
import 'package:maestroni/data/models/category_dto.dart' as _i26;
import 'package:maestroni/data/models/item_dto.dart' as _i23;
import 'package:maestroni/data/models/news_dto.dart' as _i24;
import 'package:maestroni/ui/views/add_address/add_address_view.dart' as _i14;
import 'package:maestroni/ui/views/add_edit_news/add_edit_news_view.dart'
    as _i19;
import 'package:maestroni/ui/views/addresses/addresses_view.dart' as _i13;
import 'package:maestroni/ui/views/admin_menu/admin_menu_view.dart' as _i20;
import 'package:maestroni/ui/views/admin_menu_category/admin_menu_category_view.dart'
    as _i21;
import 'package:maestroni/ui/views/auth_code/auth_code_view.dart' as _i11;
import 'package:maestroni/ui/views/auth_phone/auth_phone_view.dart' as _i10;
import 'package:maestroni/ui/views/contacts/contacts_view.dart' as _i9;
import 'package:maestroni/ui/views/dish/dish_view.dart' as _i8;
import 'package:maestroni/ui/views/home/home_view.dart' as _i2;
import 'package:maestroni/ui/views/login/login_view.dart' as _i4;
import 'package:maestroni/ui/views/map/map_view.dart' as _i17;
import 'package:maestroni/ui/views/menu/menu_view.dart' as _i7;
import 'package:maestroni/ui/views/news/news_view.dart' as _i18;
import 'package:maestroni/ui/views/order/order_view.dart' as _i16;
import 'package:maestroni/ui/views/orders_history/orders_history_view.dart'
    as _i15;
import 'package:maestroni/ui/views/profile/profile_view.dart' as _i6;
import 'package:maestroni/ui/views/promotion/promotion_view.dart' as _i12;
import 'package:maestroni/ui/views/shopping_cart/shopping_cart_view.dart'
    as _i5;
import 'package:maestroni/ui/views/startup/startup_view.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i27;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const loginView = '/login-view';

  static const shoppingCartView = '/shopping-cart-view';

  static const profileView = '/profile-view';

  static const menuView = '/menu-view';

  static const dishView = '/dish-view';

  static const contactsView = '/contacts-view';

  static const authPhoneView = '/auth-phone-view';

  static const authCodeView = '/auth-code-view';

  static const promotionView = '/promotion-view';

  static const addressesView = '/addresses-view';

  static const addAddressView = '/add-address-view';

  static const ordersHistoryView = '/orders-history-view';

  static const orderView = '/order-view';

  static const mapView = '/map-view';

  static const newsView = '/news-view';

  static const addEditNewsView = '/add-edit-news-view';

  static const adminMenuView = '/admin-menu-view';

  static const adminMenuCategoryView = '/admin-menu-category-view';

  static const all = <String>{
    homeView,
    startupView,
    loginView,
    shoppingCartView,
    profileView,
    menuView,
    dishView,
    contactsView,
    authPhoneView,
    authCodeView,
    promotionView,
    addressesView,
    addAddressView,
    ordersHistoryView,
    orderView,
    mapView,
    newsView,
    addEditNewsView,
    adminMenuView,
    adminMenuCategoryView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i4.LoginView,
    ),
    _i1.RouteDef(
      Routes.shoppingCartView,
      page: _i5.ShoppingCartView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i6.ProfileView,
    ),
    _i1.RouteDef(
      Routes.menuView,
      page: _i7.MenuView,
    ),
    _i1.RouteDef(
      Routes.dishView,
      page: _i8.DishView,
    ),
    _i1.RouteDef(
      Routes.contactsView,
      page: _i9.ContactsView,
    ),
    _i1.RouteDef(
      Routes.authPhoneView,
      page: _i10.AuthPhoneView,
    ),
    _i1.RouteDef(
      Routes.authCodeView,
      page: _i11.AuthCodeView,
    ),
    _i1.RouteDef(
      Routes.promotionView,
      page: _i12.PromotionView,
    ),
    _i1.RouteDef(
      Routes.addressesView,
      page: _i13.AddressesView,
    ),
    _i1.RouteDef(
      Routes.addAddressView,
      page: _i14.AddAddressView,
    ),
    _i1.RouteDef(
      Routes.ordersHistoryView,
      page: _i15.OrdersHistoryView,
    ),
    _i1.RouteDef(
      Routes.orderView,
      page: _i16.OrderView,
    ),
    _i1.RouteDef(
      Routes.mapView,
      page: _i17.MapView,
    ),
    _i1.RouteDef(
      Routes.newsView,
      page: _i18.NewsView,
    ),
    _i1.RouteDef(
      Routes.addEditNewsView,
      page: _i19.AddEditNewsView,
    ),
    _i1.RouteDef(
      Routes.adminMenuView,
      page: _i20.AdminMenuView,
    ),
    _i1.RouteDef(
      Routes.adminMenuCategoryView,
      page: _i21.AdminMenuCategoryView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.LoginView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginView(),
        settings: data,
      );
    },
    _i5.ShoppingCartView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.ShoppingCartView(),
        settings: data,
      );
    },
    _i6.ProfileView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ProfileView(),
        settings: data,
      );
    },
    _i7.MenuView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.MenuView(),
        settings: data,
      );
    },
    _i8.DishView: (data) {
      final args = data.getArgs<DishViewArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i8.DishView(dishDataModel: args.dishDataModel, key: args.key),
        settings: data,
      );
    },
    _i9.ContactsView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ContactsView(),
        settings: data,
      );
    },
    _i10.AuthPhoneView: (data) {
      final args = data.getArgs<AuthPhoneViewArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.AuthPhoneView(fromCart: args.fromCart, key: args.key),
        settings: data,
      );
    },
    _i11.AuthCodeView: (data) {
      final args = data.getArgs<AuthCodeViewArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i11.AuthCodeView(phone: args.phone, key: args.key),
        settings: data,
      );
    },
    _i12.PromotionView: (data) {
      final args = data.getArgs<PromotionViewArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i12.PromotionView(promotion: args.promotion, key: args.key),
        settings: data,
      );
    },
    _i13.AddressesView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.AddressesView(),
        settings: data,
      );
    },
    _i14.AddAddressView: (data) {
      final args = data.getArgs<AddAddressViewArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i14.AddAddressView(addressDTO: args.addressDTO, key: args.key),
        settings: data,
      );
    },
    _i15.OrdersHistoryView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.OrdersHistoryView(),
        settings: data,
      );
    },
    _i16.OrderView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.OrderView(),
        settings: data,
      );
    },
    _i17.MapView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.MapView(),
        settings: data,
      );
    },
    _i18.NewsView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.NewsView(),
        settings: data,
      );
    },
    _i19.AddEditNewsView: (data) {
      final args = data.getArgs<AddEditNewsViewArguments>(
        orElse: () => const AddEditNewsViewArguments(),
      );
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i19.AddEditNewsView(news: args.news, key: args.key),
        settings: data,
      );
    },
    _i20.AdminMenuView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.AdminMenuView(),
        settings: data,
      );
    },
    _i21.AdminMenuCategoryView: (data) {
      final args = data.getArgs<AdminMenuCategoryViewArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => _i21.AdminMenuCategoryView(
            category: args.category, catIndex: args.catIndex, key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class DishViewArguments {
  const DishViewArguments({
    required this.dishDataModel,
    this.key,
  });

  final _i23.ItemDTO dishDataModel;

  final _i22.Key? key;

  @override
  String toString() {
    return '{"dishDataModel": "$dishDataModel", "key": "$key"}';
  }

  @override
  bool operator ==(covariant DishViewArguments other) {
    if (identical(this, other)) return true;
    return other.dishDataModel == dishDataModel && other.key == key;
  }

  @override
  int get hashCode {
    return dishDataModel.hashCode ^ key.hashCode;
  }
}

class AuthPhoneViewArguments {
  const AuthPhoneViewArguments({
    required this.fromCart,
    this.key,
  });

  final bool fromCart;

  final _i22.Key? key;

  @override
  String toString() {
    return '{"fromCart": "$fromCart", "key": "$key"}';
  }

  @override
  bool operator ==(covariant AuthPhoneViewArguments other) {
    if (identical(this, other)) return true;
    return other.fromCart == fromCart && other.key == key;
  }

  @override
  int get hashCode {
    return fromCart.hashCode ^ key.hashCode;
  }
}

class AuthCodeViewArguments {
  const AuthCodeViewArguments({
    required this.phone,
    this.key,
  });

  final String phone;

  final _i22.Key? key;

  @override
  String toString() {
    return '{"phone": "$phone", "key": "$key"}';
  }

  @override
  bool operator ==(covariant AuthCodeViewArguments other) {
    if (identical(this, other)) return true;
    return other.phone == phone && other.key == key;
  }

  @override
  int get hashCode {
    return phone.hashCode ^ key.hashCode;
  }
}

class PromotionViewArguments {
  const PromotionViewArguments({
    required this.promotion,
    this.key,
  });

  final _i24.NewsDTO promotion;

  final _i22.Key? key;

  @override
  String toString() {
    return '{"promotion": "$promotion", "key": "$key"}';
  }

  @override
  bool operator ==(covariant PromotionViewArguments other) {
    if (identical(this, other)) return true;
    return other.promotion == promotion && other.key == key;
  }

  @override
  int get hashCode {
    return promotion.hashCode ^ key.hashCode;
  }
}

class AddAddressViewArguments {
  const AddAddressViewArguments({
    required this.addressDTO,
    this.key,
  });

  final _i25.AddressDTO? addressDTO;

  final _i22.Key? key;

  @override
  String toString() {
    return '{"addressDTO": "$addressDTO", "key": "$key"}';
  }

  @override
  bool operator ==(covariant AddAddressViewArguments other) {
    if (identical(this, other)) return true;
    return other.addressDTO == addressDTO && other.key == key;
  }

  @override
  int get hashCode {
    return addressDTO.hashCode ^ key.hashCode;
  }
}

class AddEditNewsViewArguments {
  const AddEditNewsViewArguments({
    this.news,
    this.key,
  });

  final _i24.NewsDTO? news;

  final _i22.Key? key;

  @override
  String toString() {
    return '{"news": "$news", "key": "$key"}';
  }

  @override
  bool operator ==(covariant AddEditNewsViewArguments other) {
    if (identical(this, other)) return true;
    return other.news == news && other.key == key;
  }

  @override
  int get hashCode {
    return news.hashCode ^ key.hashCode;
  }
}

class AdminMenuCategoryViewArguments {
  const AdminMenuCategoryViewArguments({
    required this.category,
    required this.catIndex,
    this.key,
  });

  final _i26.CategoryDTO category;

  final int catIndex;

  final _i22.Key? key;

  @override
  String toString() {
    return '{"category": "$category", "catIndex": "$catIndex", "key": "$key"}';
  }

  @override
  bool operator ==(covariant AdminMenuCategoryViewArguments other) {
    if (identical(this, other)) return true;
    return other.category == category &&
        other.catIndex == catIndex &&
        other.key == key;
  }

  @override
  int get hashCode {
    return category.hashCode ^ catIndex.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i27.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToShoppingCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.shoppingCartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMenuView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.menuView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDishView({
    required _i23.ItemDTO dishDataModel,
    _i22.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.dishView,
        arguments: DishViewArguments(dishDataModel: dishDataModel, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToContactsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.contactsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAuthPhoneView({
    required bool fromCart,
    _i22.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.authPhoneView,
        arguments: AuthPhoneViewArguments(fromCart: fromCart, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAuthCodeView({
    required String phone,
    _i22.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.authCodeView,
        arguments: AuthCodeViewArguments(phone: phone, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPromotionView({
    required _i24.NewsDTO promotion,
    _i22.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.promotionView,
        arguments: PromotionViewArguments(promotion: promotion, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddressesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addressesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddAddressView({
    required _i25.AddressDTO? addressDTO,
    _i22.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addAddressView,
        arguments: AddAddressViewArguments(addressDTO: addressDTO, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrdersHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.ordersHistoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrderView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.orderView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMapView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mapView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNewsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.newsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddEditNewsView({
    _i24.NewsDTO? news,
    _i22.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addEditNewsView,
        arguments: AddEditNewsViewArguments(news: news, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminMenuView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminMenuView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminMenuCategoryView({
    required _i26.CategoryDTO category,
    required int catIndex,
    _i22.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.adminMenuCategoryView,
        arguments: AdminMenuCategoryViewArguments(
            category: category, catIndex: catIndex, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithShoppingCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.shoppingCartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMenuView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.menuView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDishView({
    required _i23.ItemDTO dishDataModel,
    _i22.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.dishView,
        arguments: DishViewArguments(dishDataModel: dishDataModel, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithContactsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.contactsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAuthPhoneView({
    required bool fromCart,
    _i22.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.authPhoneView,
        arguments: AuthPhoneViewArguments(fromCart: fromCart, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAuthCodeView({
    required String phone,
    _i22.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.authCodeView,
        arguments: AuthCodeViewArguments(phone: phone, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPromotionView({
    required _i24.NewsDTO promotion,
    _i22.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.promotionView,
        arguments: PromotionViewArguments(promotion: promotion, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddressesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addressesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddAddressView({
    required _i25.AddressDTO? addressDTO,
    _i22.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addAddressView,
        arguments: AddAddressViewArguments(addressDTO: addressDTO, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOrdersHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.ordersHistoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOrderView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.orderView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMapView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mapView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNewsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.newsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddEditNewsView({
    _i24.NewsDTO? news,
    _i22.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addEditNewsView,
        arguments: AddEditNewsViewArguments(news: news, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAdminMenuView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.adminMenuView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAdminMenuCategoryView({
    required _i26.CategoryDTO category,
    required int catIndex,
    _i22.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.adminMenuCategoryView,
        arguments: AdminMenuCategoryViewArguments(
            category: category, catIndex: catIndex, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
