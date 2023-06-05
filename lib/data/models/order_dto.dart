import 'package:dart_mappable/dart_mappable.dart';
import 'package:maestroni/data/models/dish_dto.dart';

import 'r_order_resp.dart';
import 'short_address.dart';
part 'order_dto.mapper.dart';

/// Реквест для отправки СМС сообщения пользователю
@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class OrderDTO with OrderDTOMappable {
  const OrderDTO({
    required this.id,
    required this.address,
    required this.comment,
    required this.dishList,
    required this.expeditionType,
    required this.orderResponse,
    required this.paymentTypeId,
    required this.restaurantId,
    required this.systemOrderId,
    required this.orderStatusName,
  });

  final String id;
  final String comment;
  final String restaurantId;
  final String expeditionType;
  final String paymentTypeId;
  final List<DishDTO> dishList;
  final int systemOrderId;
  final ROrderResp orderResponse;
  final ShortAddress? address;
  final String orderStatusName;
}
