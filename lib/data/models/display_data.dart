import 'package:dart_mappable/dart_mappable.dart';

part 'display_data.mapper.dart';

@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class DisplayData with DisplayDataMappable {
  DisplayData({
    required this.displayDataName,
    required this.isActive,
  });
  final String displayDataName;
  final bool isActive;
}
