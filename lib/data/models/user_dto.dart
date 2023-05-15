import 'package:dart_mappable/dart_mappable.dart';
part 'user_dto.mapper.dart';

/// Респонз от сервера при успешной авторизации
@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class UserDTO with UserDTOMappable {
  const UserDTO({
    this.userName,
    this.email,
    this.phoneNumber,
  });

  final String? userName;
  final String? email;
  final String? phoneNumber;
}
