import 'package:dart_mappable/dart_mappable.dart';
import 'package:maestroni/data/models/dish_dto.dart';

import 'short_address.dart';
part 'order_dto.mapper.dart';

/// Реквест для отправки СМС сообщения пользователю
@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class OrderDTO with OrderDTOMappable {
  const OrderDTO(
      {required this.persons,
      required this.paymentStatus,
      required this.orderId,
      required this.address,
      required this.comment,
      required this.dishList,
      required this.expeditionType,
      required this.paymentTypeId,
      required this.orderStatusName,
      required this.restAddress,
      required this.createdDate});

  final String orderId;

  final String comment;
  final int persons;
  final String expeditionType;
  final String paymentTypeId;
  final String paymentStatus;
  final List<DishDTO> dishList;
  final ShortAddress? address;
  final String orderStatusName;
  final String? restAddress;
  final DateTime createdDate;
}
