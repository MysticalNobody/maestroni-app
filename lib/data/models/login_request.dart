import 'package:dart_mappable/dart_mappable.dart';
part 'login_request.mapper.dart';

/// Реквест для авторизации пользователя
@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class LoginRequest with LoginRequestMappable {
  const LoginRequest({
    required this.phoneNumber,
    required this.smsCode,
  });

  /// номер телефона пользователя
  final String phoneNumber;

  /// Код из СМС
  final String smsCode;
}
