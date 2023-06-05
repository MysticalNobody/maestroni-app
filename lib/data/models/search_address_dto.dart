import 'package:dart_mappable/dart_mappable.dart';
part 'search_address_dto.mapper.dart';

@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class SearchAddressDTO with SearchAddressDTOMappable {
  const SearchAddressDTO(
    this.address,
    this.fullAddress,
    this.country,
    this.city,
    this.street,
    this.house,
    this.building,
    this.postalCode,
    this.geoLat,
    this.geoLon,
  );

  final String address;
  final String fullAddress;
  final String country;
  final String city;
  final String street;
  final String house;
  final String building;
  final String postalCode;
  final double geoLat;
  final double geoLon;
}
