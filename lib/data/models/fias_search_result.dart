import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';
part 'fias_search_result.mapper.dart';

@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class FIASSearchResult with FIASSearchResultMappable {
  FIASSearchResult({required this.result});
  final List<FIASObject> result;
}

@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class FIASObject with FIASObjectMappable {
  FIASObject(
      {required this.name,
      required this.typeShort,
      required this.type,
      required this.parents,
      required this.contentType});
  final String name;
  final String typeShort;
  final String type;
  final List<FIASSubObject> parents;
  final String? contentType;
  String get city =>
      parents
          .firstWhereOrNull((element) => element.contentType == 'city')
          ?.fullValue ??
      '';
  String get district =>
      parents
          .firstWhereOrNull((element) => element.contentType == 'district')
          ?.fullValue ??
      '';
  String get region =>
      parents
          .firstWhereOrNull((element) => element.contentType == 'region')
          ?.fullValue ??
      '';
  String get fullValue => getFullString(this);
}

@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class FIASSubObject with FIASSubObjectMappable {
  FIASSubObject(
      {required this.name,
      required this.typeShort,
      required this.type,
      required this.contentType});
  final String name;
  final String typeShort;
  final String type;
  final String contentType;

  String get fullValue => '$typeShort. $name';
}

String getFullString(FIASObject v) {
  final List<String> fs = [];
  if (v.parents.any((element) => element.contentType == 'region')) {
    fs.add(v.parents
        .firstWhere((element) => element.contentType == 'region')
        .fullValue);
  }
  if (v.parents.any((element) => element.contentType == 'district')) {
    fs.add(v.parents
        .firstWhere((element) => element.contentType == 'city')
        .fullValue);
  }
  if (v.parents.any((element) => element.contentType == 'city')) {
    fs.add(v.parents
        .firstWhere((element) => element.contentType == 'city')
        .fullValue);
  }
  fs.add('${v.typeShort}. ${v.name}');
  return fs.join(', ');
}
