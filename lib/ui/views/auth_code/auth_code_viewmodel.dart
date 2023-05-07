import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:maestroni/data/models/login_request.dart';
import 'package:maestroni/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthCodeViewModel extends BaseViewModel {
  AuthCodeViewModel(this.phone);
  final String phone;
  final _authService = locator<AuthenticationService>();
  final _navigatorService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final controller = MaskedTextController(mask: '0 0 0 0');

  Future<void> onSend() async {
    if (controller.unmasked.length != 4) {
      _dialogService.showDialog(
          title: 'Ошибка', description: 'Код введен не полностью');
      return;
    }
    final res = await runBusyFuture(
      _authService.sendPhone(
        LoginRequest(phoneNumber: phone, smsCode: controller.unmasked),
      ),
    );
    if (res) {
      _navigatorService.back();
    }
  }
}
