import 'package:dart_mappable/dart_mappable.dart';
import 'package:maestroni/data/models/category_dto.dart';
part 'categories_active.mapper.dart';

@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class CategoriesActive with CategoriesActiveMappable {
  const CategoriesActive({
    this.active = const [],
  });
  /// Продукты в категории
  final List<CategoryDTO> active;
}
