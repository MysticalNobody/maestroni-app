import 'package:dart_mappable/dart_mappable.dart';
import 'package:maestroni/data/models/item_dto.dart';

import 'display_data.dart';
part 'category_dto.mapper.dart';

/// Категория
@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class CategoryDTO with CategoryDTOMappable {
  const CategoryDTO({
    this.name = 'Название отсутсвует',
    this.products = const [],
    this.id,
    this.displayData,
  });

  /// Уникальный идентификатор товара
  final String? id;

  /// Название категории
  final String name;

  /// Продукты в категории
  final List<ItemDTO> products;

  final DisplayData? displayData;

  String get displayName => displayData?.displayDataName ?? name;
}
