import 'package:dart_mappable/dart_mappable.dart';

part 'dish_dto.mapper.dart';

@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class DishDTO with DishDTOMappable {
  DishDTO({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });
  final String id;
  final String name;
  final String price;
  final String quantity;
}
