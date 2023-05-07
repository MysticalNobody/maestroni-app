import 'package:maestroni/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await _authService.init();
    _navigationService.replaceWithHomeView();
  }
}
