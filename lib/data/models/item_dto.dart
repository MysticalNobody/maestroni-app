import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';
part 'item_dto.mapper.dart';

/// Товар
@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class ItemDTO extends Equatable with ItemDTOMappable {
  const ItemDTO({
    required this.id,
    required this.externalId,
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
  final String externalId;

  /// Название товара
  final String name;

  /// Цена товара
  final double price;

  final String description;

  final bool avability;

  final List<String> imageUrls;

  final int proteins;
  final int fats;
  final int carbohydrates;
  final int energyValue;

  @override
  List<Object> get props => [id, externalId];
}
