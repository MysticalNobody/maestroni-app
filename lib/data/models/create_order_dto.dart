import 'package:dart_mappable/dart_mappable.dart';

import 'dish_dto.dart';
part 'create_order_dto.mapper.dart';

@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class CreateOrderDTO with CreateOrderDTOMappable {
  CreateOrderDTO({
    required this.dishList,
    required this.expeditionType,
    required this.expectedAt,
    required this.paymentTypeId,
    required this.changeFrom,
    required this.addressId,
    required this.comment,
    required this.persons,
    required this.restaurantId,
  });
  final String? comment;
  final String? restaurantId;
  final double? persons;
  final List<DishDTO> dishList;
  final String expeditionType;
  final String expectedAt;
  final String paymentTypeId;
  final String? changeFrom;
  final String? addressId;
}
