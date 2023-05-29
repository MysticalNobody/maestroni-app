import 'package:dart_mappable/dart_mappable.dart';
part 'address_dto.mapper.dart';

@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class AddressDTO with AddressDTOMappable {
  const AddressDTO({
    required this.fullAddress,
    required this.address,
    required this.apartmentNumber,
    required this.country,
    required this.region,
    required this.cityName,
    required this.street,
    required this.houseNumber,
    required this.building,
    required this.lat,
    required this.lon,
    required this.floor,
    required this.comment,
    this.id,
  });

  final String? id;

  final String fullAddress;
  final String address;
  final String apartmentNumber;
  final String country;
  final String region;
  final String cityName;
  final String street;
  final String houseNumber;
  final String building;
  final String lat;
  final String lon;
  final String floor;
  final String comment;
}
