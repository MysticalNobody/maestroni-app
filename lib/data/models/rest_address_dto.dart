import 'package:dart_mappable/dart_mappable.dart';
part 'rest_address_dto.mapper.dart';

@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class RestAddressDTO with RestAddressDTOMappable {
  const RestAddressDTO(
    this.id,
    this.objectId,
    this.actualAddress,
    this.state,
    this.actualAddressLat,
    this.actualAddressLon,
    this.city,
    this.schedule,
  );

  final String id;
  final String objectId;
  final String actualAddress;
  final String state;
  final double? actualAddressLat;
  final double? actualAddressLon;
  final String city;
  final String? schedule;
}
