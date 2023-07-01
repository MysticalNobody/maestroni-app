import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/services/authentication_service.dart';

class AuthInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    // log(locator<AuthenticationService>().authToken.value.toString());
    // log(request.toString());
    return request.copyWith(
      headers: {
        ...request.headers,
        if (locator<AuthenticationService>().authToken.value != null)
          'Authorization':
              'Bearer ${locator<AuthenticationService>().authToken.value}',
      },
    );
  }
}
