import 'package:maestroni/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/addresses_service.dart';
import '../../../services/news_service.dart';
import '../../../services/products_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  final _productsService = locator<ProductsService>();
  final _newsService = locator<NewsService>();
  final _addressesService = locator<AddressesService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 2));
    await _authService.init().then((value) async {
      runBusyFuture(
        _productsService.fetch(),
      );
      await runBusyFuture(
        _newsService.fetch(),
      );
      await runBusyFuture(_addressesService.fetch());
    });
    _navigationService.replaceWithHomeView();
  }
}
