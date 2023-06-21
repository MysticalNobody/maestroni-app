import 'package:dart_mappable/dart_mappable.dart';
part 'update_display_data.mapper.dart';

/// Реквест для отправки СМС сообщения пользователю
@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class UpdateDisplayData with UpdateDisplayDataMappable {
  const UpdateDisplayData({
    required this.id,
    required this.displayDataName,
    required this.isActive,
  });

  final String id;
  final String displayDataName;
  final bool isActive;
}
