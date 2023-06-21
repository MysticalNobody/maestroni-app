import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/login_request.dart';
import 'package:maestroni/data/models/sms_request.dart';
import 'package:maestroni/services/addresses_service.dart';
import 'package:maestroni/services/profile_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import 'api_service.dart';

class AuthenticationService with ListenableServiceMixin {
  AuthenticationService() {
    listenToReactiveValues([
      authToken,
    ]);
  }
  final api = locator<ApiService>();
  late final SharedPreferences? prefs;
  ReactiveValue<String?> authToken = ReactiveValue(null);

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    authToken.value = prefs!.getString('token');
  }

  Future<bool> sendSms(SMSRequest request) async {
    final res =
        await api.remoteDataSource.sendSms(phoneNumber: request.phoneNumber);
    return res.isSuccessful;
  }

  Future<bool> sendPhone(LoginRequest request) async {
    final res = await api.remoteDataSource
        .login(
            phoneNumber: request.phoneNumber,
            smsCode: int.parse(request.smsCode))
        .then((value) async {
      if (value.isSuccessful) {
        prefs!.setString('token', value.body!.accessToken);
        authToken.value = value.body!.accessToken;
        await loadData();
      }
      return value.isSuccessful;
    });

    return res;
  }

  Future<void> loadData() async {
    await locator<AddressesService>().fetch();
    await locator<ProfileService>().getProfile();
  }

  Future<void> onExit() async {
    await prefs!.remove('token');
    authToken.value = null;
  }
}
