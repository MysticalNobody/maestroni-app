import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:maestroni/data/models/sms_request.dart';
import 'package:maestroni/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthPhoneViewModel extends BaseViewModel {
  final _authService = locator<AuthenticationService>();
  final _navigatorService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final controller = MaskedTextController(mask: '+7 (000) 000-00-00');

  Future<void> onSend() async {
    if (controller.unmasked.length != 10) {
      _dialogService.showDialog(
          title: 'Ошибка', description: 'Телефон введен не полностью');
      return;
    }
    final res = await runBusyFuture<bool>(
      _authService.sendSms(
        SMSRequest(
          phoneNumber: controller.text
              .replaceAll(' ', '')
              .replaceAll('+', '')
              .replaceAll('(', '')
              .replaceAll(')', '')
              .replaceAll('-', ''),
        ),
      ),
    );
    if (!res) {
      // remove "!"
      _navigatorService.replaceWithAuthCodeView(
          phone: controller.text
              .replaceAll(' ', '')
              .replaceAll('+', '')
              .replaceAll('(', '')
              .replaceAll(')', '')
              .replaceAll('-', ''));
    } else {
      _dialogService.showDialog(
          title: 'Непредвиденная Ошибка', description: 'Ошибка сервера');
    }
  }

  Future<void> toPolitics() async {
    if (!await launchUrl(Uri.parse('https://maestroni.ru/privacy_policy'),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch');
    }
  }
}
