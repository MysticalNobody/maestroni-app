import 'package:dart_mappable/dart_mappable.dart';
import 'package:maestroni/data/models/dish_dto.dart';

import 'address_dto.dart';
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
      required this.products,
      required this.expeditionType,
      required this.paymentTypeId,
      required this.orderStatusName,
      required this.restaurantAddress,
      required this.createdDate,
      required this.expectedAt,
      this.soonest});

  final String orderId;

  final String comment;
  final int persons;
  final String expeditionType;
  final String paymentTypeId;
  final String paymentStatus;
  final List<DishDTO> products;
  final AddressDTO? address;
  final String orderStatusName;
  final String? restaurantAddress;
  final bool? soonest;
  final DateTime expectedAt;
  final DateTime createdDate;

  DateTime get localCreatedDate => createdDate.toLocal();
  DateTime get localExpectedAt => expectedAt.toLocal();
}
