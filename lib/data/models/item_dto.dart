import 'package:dart_mappable/dart_mappable.dart';
part 'item_dto.mapper.dart';

/// Товар
@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class ItemDTO with ItemDTOMappable {
  const ItemDTO({
    required this.id,
    this.price = 0,
    this.name = 'Название отсутствует',
    this.avability = false,
    this.description = 'Описание отсутствует',
    this.imageUrls = const [],
    this.carbohydrates = 0,
    this.proteins = 0,
    this.energyValue = 0,
    this.fats = 0,
  });

  /// Уникальный идентификатор товара
  final String id;

  /// Название товара
  final String name;

  /// Цена товара (В копейках)
  final int price;

  final String description;

  final bool avability;

  final List<String> imageUrls;

  final int proteins;
  final int fats;
  final int carbohydrates;
  final int energyValue;
}
