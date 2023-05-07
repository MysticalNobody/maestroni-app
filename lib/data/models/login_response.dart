import 'package:dart_mappable/dart_mappable.dart';
part 'login_response.mapper.dart';

/// Респонз от сервера при успешной авторизации
@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class LoginResponse with LoginResponseMappable {
  const LoginResponse({
    required this.accessToken,
  });

  /// JWT токен пользователя
  final String accessToken;
}
