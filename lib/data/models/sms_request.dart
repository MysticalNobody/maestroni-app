import 'package:dart_mappable/dart_mappable.dart';
part 'sms_request.mapper.dart';

/// Реквест для отправки СМС сообщения пользователю
@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class SMSRequest with SMSRequestMappable {
  const SMSRequest({
    required this.phoneNumber,
  });

  /// номер телефона пользователя
  final String phoneNumber;
}
