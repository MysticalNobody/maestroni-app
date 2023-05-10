import 'package:dart_mappable/dart_mappable.dart';

import 'categories_active.dart';
part 'categories_response.mapper.dart';

@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class CategoriesResponse with CategoriesResponseMappable {
  const CategoriesResponse({
    required this.data,
  });
  final CategoriesActive data;
}
