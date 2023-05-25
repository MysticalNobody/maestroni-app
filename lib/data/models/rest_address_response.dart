import 'package:dart_mappable/dart_mappable.dart';
import 'package:maestroni/data/models/rest_address_dto.dart';

part 'rest_address_response.mapper.dart';

@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class RestAddressResponse with RestAddressResponseMappable {
  const RestAddressResponse(
    this.result,
  );

  final List<RestAddressDTO> result;
}
