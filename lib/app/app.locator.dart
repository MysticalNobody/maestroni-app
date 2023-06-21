// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/addresses_service.dart';
import '../services/api_service.dart';
import '../services/authentication_service.dart';
import '../services/home_menu_service.dart';
import '../services/news_service.dart';
import '../services/orders_history_service.dart';
import '../services/payment_service.dart';
import '../services/products_service.dart';
import '../services/profile_service.dart';
import '../services/shopping_cart_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => ShoppingCartService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => ProductsService());
  locator.registerLazySingleton(() => HomeMenuService());
  locator.registerLazySingleton(() => NewsService());
  locator.registerLazySingleton(() => PaymentService());
  locator.registerLazySingleton(() => AddressesService());
  locator.registerLazySingleton(() => ProfileService());
  locator.registerLazySingleton(() => OrdersHistoryService());
}
