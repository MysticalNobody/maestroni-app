import 'package:dart_mappable/dart_mappable.dart';
part 'sort_item_dto.mapper.dart';

/// Реквест для отправки СМС сообщения пользователю
@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class SortItemDTO with SortItemDTOMappable {
  const SortItemDTO({
    required this.productId,
    required this.listNumber,
  });

  final String productId;
  final int listNumber;
}
