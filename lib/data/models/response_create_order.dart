import 'package:dart_mappable/dart_mappable.dart';
part 'response_create_order.mapper.dart';

/// Реквест для отправки СМС сообщения пользователю
@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class ResponseCreateOrder with ResponseCreateOrderMappable {
  const ResponseCreateOrder({
    required this.systemOrderId,
    required this.status,
    required this.paymentTypeId,
  });

  final int systemOrderId;
  final String status;
  final String paymentTypeId;
}
