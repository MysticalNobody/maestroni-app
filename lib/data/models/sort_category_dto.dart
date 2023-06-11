import 'package:dart_mappable/dart_mappable.dart';

import 'sort_item_dto.dart';
part 'sort_category_dto.mapper.dart';

/// Реквест для отправки СМС сообщения пользователю
@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class SortCategoryDTO with SortCategoryDTOMappable {
  const SortCategoryDTO({
    required this.categoryId,
    required this.listNumber,
    required this.productsSortList,
  });

  final String categoryId;
  final int listNumber;
  final List<SortItemDTO> productsSortList;
}
