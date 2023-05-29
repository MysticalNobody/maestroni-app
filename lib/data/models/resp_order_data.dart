import 'package:dart_mappable/dart_mappable.dart';
import 'package:maestroni/data/models/response_create_order.dart';
part 'resp_order_data.mapper.dart';

/// Реквест для отправки СМС сообщения пользователю
@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class RespOrderData with RespOrderDataMappable {
  const RespOrderData({
    required this.data,
  });

  final ResponseCreateOrder data;
}
