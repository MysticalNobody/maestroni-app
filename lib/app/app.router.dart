// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i15;
import 'package:flutter/material.dart';
import 'package:maestroni/data/models/item_dto.dart' as _i16;
import 'package:maestroni/data/models/news_dto.dart' as _i17;
import 'package:maestroni/ui/views/add_address/add_address_view.dart' as _i14;
import 'package:maestroni/ui/views/addresses/addresses_view.dart' as _i13;
import 'package:maestroni/ui/views/auth_code/auth_code_view.dart' as _i11;
import 'package:maestroni/ui/views/auth_phone/auth_phone_view.dart' as _i10;
import 'package:maestroni/ui/views/contacts/contacts_view.dart' as _i9;
import 'package:maestroni/ui/views/dish/dish_view.dart' as _i8;
import 'package:maestroni/ui/views/home/home_view.dart' as _i2;
import 'package:maestroni/ui/views/login/login_view.dart' as _i4;
import 'package:maestroni/ui/views/menu/menu_view.dart' as _i7;
import 'package:maestroni/ui/views/profile/profile_view.dart' as _i6;
import 'package:maestroni/ui/views/promotion/promotion_view.dart' as _i12;
import 'package:maestroni/ui/views/shopping_cart/shopping_cart_view.dart'
    as _i5;
import 'package:maestroni/ui/views/startup/startup_view.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i18;

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
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
        maintainState: false,
      );
    },
    _i4.LoginView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginView(),
        settings: data,
        maintainState: false,
      );
    },
    _i5.ShoppingCartView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.ShoppingCartView(),
        settings: data,
        maintainState: false,
      );
    },
    _i6.ProfileView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ProfileView(),
        settings: data,
        maintainState: false,
      );
    },
    _i7.MenuView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.MenuView(),
        settings: data,
      );
    },
    _i8.DishView: (data) {
      final args = data.getArgs<DishViewArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i8.DishView(dishDataModel: args.dishDataModel, key: args.key),
        settings: data,
        maintainState: false,
      );
    },
    _i9.ContactsView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ContactsView(),
        settings: data,
        maintainState: false,
      );
    },
    _i10.AuthPhoneView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.AuthPhoneView(),
        settings: data,
        maintainState: false,
      );
    },
    _i11.AuthCodeView: (data) {
      final args = data.getArgs<AuthCodeViewArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i11.AuthCodeView(phone: args.phone, key: args.key),
        settings: data,
        maintainState: false,
      );
    },
    _i12.PromotionView: (data) {
      final args = data.getArgs<PromotionViewArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i12.PromotionView(promotion: args.promotion, key: args.key),
        settings: data,
        maintainState: false,
      );
    },
    _i13.AddressesView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.AddressesView(),
        settings: data,
        maintainState: false,
      );
    },
    _i14.AddAddressView: (data) {
      final args = data.getArgs<AddAddressViewArguments>(
        orElse: () => const AddAddressViewArguments(),
      );
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i14.AddAddressView(key: args.key),
        settings: data,
        maintainState: false,
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

  final _i16.ItemDTO dishDataModel;

  final _i15.Key? key;

  @override
  String toString() {
    return '{"dishDataModel": "$dishDataModel", "key": "$key"}';
  }
}

class AuthCodeViewArguments {
  const AuthCodeViewArguments({
    required this.phone,
    this.key,
  });

  final String phone;

  final _i15.Key? key;

  @override
  String toString() {
    return '{"phone": "$phone", "key": "$key"}';
  }
}

class PromotionViewArguments {
  const PromotionViewArguments({
    required this.promotion,
    this.key,
  });

  final _i17.NewsDTO promotion;

  final _i15.Key? key;

  @override
  String toString() {
    return '{"promotion": "$promotion", "key": "$key"}';
  }
}

class AddAddressViewArguments {
  const AddAddressViewArguments({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }
}

extension NavigatorStateExtension on _i18.NavigationService {
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
    required _i16.ItemDTO dishDataModel,
    _i15.Key? key,
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

  Future<dynamic> navigateToAuthPhoneView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.authPhoneView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAuthCodeView({
    required String phone,
    _i15.Key? key,
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
    required _i17.NewsDTO promotion,
    _i15.Key? key,
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
    _i15.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addAddressView,
        arguments: AddAddressViewArguments(key: key),
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
    required _i16.ItemDTO dishDataModel,
    _i15.Key? key,
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

  Future<dynamic> replaceWithAuthPhoneView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.authPhoneView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAuthCodeView({
    required String phone,
    _i15.Key? key,
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
    required _i17.NewsDTO promotion,
    _i15.Key? key,
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
    _i15.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addAddressView,
        arguments: AddAddressViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
