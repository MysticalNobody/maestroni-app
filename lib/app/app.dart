import 'package:maestroni/services/payment_service.dart';
import 'package:maestroni/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:maestroni/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:maestroni/ui/views/home/home_view.dart';
import 'package:maestroni/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:maestroni/ui/views/login/login_view.dart';
import 'package:maestroni/ui/views/shopping_cart/shopping_cart_view.dart';
import 'package:maestroni/ui/views/profile/profile_view.dart';
import 'package:maestroni/ui/views/menu/menu_view.dart';
import 'package:maestroni/ui/views/dish/dish_view.dart';
import 'package:maestroni/services/authentication_service.dart';
import 'package:maestroni/services/shopping_cart_service.dart';
import 'package:maestroni/services/api_service.dart';
import 'package:maestroni/services/products_service.dart';
import 'package:maestroni/ui/views/contacts/contacts_view.dart';
import 'package:maestroni/services/home_menu_service.dart';
import 'package:maestroni/services/news_service.dart';
import 'package:maestroni/ui/views/auth_phone/auth_phone_view.dart';
import 'package:maestroni/ui/views/auth_code/auth_code_view.dart';
import 'package:maestroni/ui/bottom_sheets/order_confirm/order_confirm_sheet.dart';
import 'package:maestroni/ui/views/promotion/promotion_view.dart';
import 'package:maestroni/services/addresses_service.dart';
import 'package:maestroni/ui/views/addresses/addresses_view.dart';
import 'package:maestroni/ui/views/add_address/add_address_view.dart';
import 'package:maestroni/services/profile_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, maintainState: true),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: ShoppingCartView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: MenuView, maintainState: true),
    MaterialRoute(page: DishView),
    MaterialRoute(page: ContactsView),
    MaterialRoute(page: AuthPhoneView),
    MaterialRoute(page: AuthCodeView),
    MaterialRoute(page: PromotionView),
    MaterialRoute(page: AddressesView),
    MaterialRoute(page: AddAddressView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: ShoppingCartService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: ProductsService),
    LazySingleton(classType: HomeMenuService),
    LazySingleton(classType: NewsService),
    LazySingleton(
      classType: PaymentService,
    ),
    LazySingleton(classType: AddressesService),
    LazySingleton(classType: ProfileService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: OrderConfirmSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
