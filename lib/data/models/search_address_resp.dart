import 'package:dart_mappable/dart_mappable.dart';
import 'package:maestroni/data/models/search_address_dto.dart';
part 'search_address_resp.mapper.dart';

@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class SearchAddressResp with SearchAddressRespMappable {
  const SearchAddressResp({
    required this.result,
  });

  final List<SearchAddressDTO> result;
}
