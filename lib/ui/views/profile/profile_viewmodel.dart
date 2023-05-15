import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:maestroni/services/authentication_service.dart';
import 'package:maestroni/services/profile_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends ReactiveViewModel {
  final _authService = locator<AuthenticationService>();
  final _profileService = locator<ProfileService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  bool get isLoggedIn => _authService.authToken.value?.isNotEmpty ?? false;

  Future<void> onTapLogin() async {
    _navigationService.navigateToAuthPhoneView();
  }

  Future<void> runStartupLogic() async {
    _profileService.getProfile();
  }

  Future<void> onTapLogout() async {
    final res = await _dialogService.showConfirmationDialog(
      title: 'Выход',
      description: 'Вы точно хотите выйти из приложения?',
      cancelTitle: 'Выйти',
      confirmationTitle: 'Отменить',
    );
    if (!(res?.confirmed ?? true)) {
      await _authService.onExit();
    }
  }

  Future<void> onOrdersTap() async {
    _dialogService.showDialog(
        title: 'В разработке',
        description: 'Функционал заказов пока в разработке');
  }

  Future<void> onAddressesTap() async {
    _navigationService.navigateToAddressesView();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
