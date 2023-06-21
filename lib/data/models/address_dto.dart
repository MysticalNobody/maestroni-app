import 'package:dart_mappable/dart_mappable.dart';
part 'address_dto.mapper.dart';

@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class AddressDTO with AddressDTOMappable {
  const AddressDTO({
    required this.shortAddress,
    required this.fullAddress,
    required this.apartmentNumber,
    required this.country,
    required this.cityName,
    required this.street,
    required this.houseNumber,
    required this.building,
    required this.lat,
    required this.lon,
    required this.comment,
    this.id,
  });

  final String? id;

  final String fullAddress;
  final String shortAddress;
  final String apartmentNumber;
  final String country;
  final String cityName;
  final String street;
  final String houseNumber;
  final String building;
  final double lat;
  final double lon;
  final String comment;
}
