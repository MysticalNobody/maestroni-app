import 'package:chopper/chopper.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/login_request.dart';
import 'package:maestroni/data/models/sms_request.dart';
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

  Future<dynamic> sendSms(SMSRequest request) =>
      api.remoteDataSource.sendSms(request.phoneNumber);

  Future<bool> sendPhone(LoginRequest request) async {
    final res = await api.remoteDataSource
        .login(request.phoneNumber, int.parse(request.smsCode));
    if (res.isSuccessful) {
      prefs!.setString('token', res.body!.accessToken);
      authToken.value = res.body!.accessToken;
    }
    return res.isSuccessful;
  }

  Future<void> onExit() async {
    await prefs!.remove('token');
    authToken.value = null;
  }
}
