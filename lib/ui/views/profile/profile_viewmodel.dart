import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:maestroni/services/authentication_service.dart';
import 'package:maestroni/services/profile_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../data/models/user_dto.dart';

class ProfileViewModel extends ReactiveViewModel {
  final _authService = locator<AuthenticationService>();
  final _profileService = locator<ProfileService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  bool get isLoggedIn => _authService.authToken.value?.isNotEmpty ?? false;

  UserDTO? get user => _profileService.user.value;

  bool get isAdmin => checkAdmin();

  bool checkAdmin() {
    final admins = [
      '79634254994',
      '79637971145',
      '79285580558',
      '79884718326', // test new
      '79992370073', // Sergey
    ];
    return admins.contains(_profileService.user.value?.phoneNumber);
  }

  Future<void> onTapLogin() async {
    _navigationService.navigateToAuthPhoneView(fromCart: false);
  }

  Future<void> runStartupLogic() async {
    await _profileService.getProfile();
    notifyListeners();
  }

  Future<void> onAdminNews() async {
    _navigationService.navigateToNewsView();
  }

  Future<void> onAdminMenu() async {
    _navigationService.navigateToAdminMenuView();
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
    _navigationService.navigateToOrdersHistoryView();
  }

  Future<void> onAddressesTap() async {
    _navigationService.navigateToAddressesView();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService, _profileService];
}
