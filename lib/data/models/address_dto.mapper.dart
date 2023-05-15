// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'address_dto.dart';

class AddressDTOMapper extends MapperBase<AddressDTO> {
  static MapperContainer container = MapperContainer(
    mappers: {AddressDTOMapper()},
  );

  @override
  AddressDTOMapperElement createElement(MapperContainer container) {
    return AddressDTOMapperElement._(this, container);
  }

  @override
  String get id => 'AddressDTO';

  static final fromMap = container.fromMap<AddressDTO>;
  static final fromJson = container.fromJson<AddressDTO>;
}

class AddressDTOMapperElement extends MapperElementBase<AddressDTO> {
  AddressDTOMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  AddressDTO decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  AddressDTO fromMap(Map<String, dynamic> map) => AddressDTO(
      address: container.$get(map, 'address'),
      apartmentNumber: container.$get(map, 'apartmentNumber'),
      country: container.$get(map, 'country'),
      region: container.$get(map, 'region'),
      city: container.$get(map, 'city'),
      street: container.$get(map, 'street'),
      house: container.$get(map, 'house'),
      building: container.$get(map, 'building'),
      lat: container.$get(map, 'lat'),
      lon: container.$get(map, 'lon'),
      floor: container.$get(map, 'floor'),
      comment: container.$get(map, 'comment'),
      id: container.$getOpt(map, 'id'));

  @override
  Function get encoder => encode;
  dynamic encode(AddressDTO v) => toMap(v);
  Map<String, dynamic> toMap(AddressDTO a) => {
        'address': container.$enc(a.address, 'address'),
        'apartmentNumber': container.$enc(a.apartmentNumber, 'apartmentNumber'),
        'country': container.$enc(a.country, 'country'),
        'region': container.$enc(a.region, 'region'),
        'city': container.$enc(a.city, 'city'),
        'street': container.$enc(a.street, 'street'),
        'house': container.$enc(a.house, 'house'),
        'building': container.$enc(a.building, 'building'),
        'lat': container.$enc(a.lat, 'lat'),
        'lon': container.$enc(a.lon, 'lon'),
        'floor': container.$enc(a.floor, 'floor'),
        'comment': container.$enc(a.comment, 'comment'),
        if (container.$enc(a.id, 'id') != null) 'id': container.$enc(a.id, 'id')
      };

  @override
  String stringify(AddressDTO self) =>
      'AddressDTO(id: ${container.asString(self.id)}, address: ${container.asString(self.address)}, apartmentNumber: ${container.asString(self.apartmentNumber)}, country: ${container.asString(self.country)}, region: ${container.asString(self.region)}, city: ${container.asString(self.city)}, street: ${container.asString(self.street)}, house: ${container.asString(self.house)}, building: ${container.asString(self.building)}, lat: ${container.asString(self.lat)}, lon: ${container.asString(self.lon)}, floor: ${container.asString(self.floor)}, comment: ${container.asString(self.comment)})';
  @override
  int hash(AddressDTO self) =>
      container.hash(self.id) ^
      container.hash(self.address) ^
      container.hash(self.apartmentNumber) ^
      container.hash(self.country) ^
      container.hash(self.region) ^
      container.hash(self.city) ^
      container.hash(self.street) ^
      container.hash(self.house) ^
      container.hash(self.building) ^
      container.hash(self.lat) ^
      container.hash(self.lon) ^
      container.hash(self.floor) ^
      container.hash(self.comment);
  @override
  bool equals(AddressDTO self, AddressDTO other) =>
      container.isEqual(self.id, other.id) &&
      container.isEqual(self.address, other.address) &&
      container.isEqual(self.apartmentNumber, other.apartmentNumber) &&
      container.isEqual(self.country, other.country) &&
      container.isEqual(self.region, other.region) &&
      container.isEqual(self.city, other.city) &&
      container.isEqual(self.street, other.street) &&
      container.isEqual(self.house, other.house) &&
      container.isEqual(self.building, other.building) &&
      container.isEqual(self.lat, other.lat) &&
      container.isEqual(self.lon, other.lon) &&
      container.isEqual(self.floor, other.floor) &&
      container.isEqual(self.comment, other.comment);
}

mixin AddressDTOMappable {
  String toJson() => AddressDTOMapper.container.toJson(this as AddressDTO);
  Map<String, dynamic> toMap() =>
      AddressDTOMapper.container.toMap(this as AddressDTO);
  AddressDTOCopyWith<AddressDTO, AddressDTO, AddressDTO> get copyWith =>
      _AddressDTOCopyWithImpl(this as AddressDTO, $identity, $identity);
  @override
  String toString() => AddressDTOMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          AddressDTOMapper.container.isEqual(this, other));
  @override
  int get hashCode => AddressDTOMapper.container.hash(this);
}

extension AddressDTOValueCopy<$R, $Out extends AddressDTO>
    on ObjectCopyWith<$R, AddressDTO, $Out> {
  AddressDTOCopyWith<$R, AddressDTO, $Out> get asAddressDTO =>
      base.as((v, t, t2) => _AddressDTOCopyWithImpl(v, t, t2));
}

typedef AddressDTOCopyWithBound = AddressDTO;

abstract class AddressDTOCopyWith<$R, $In extends AddressDTO,
    $Out extends AddressDTO> implements ObjectCopyWith<$R, $In, $Out> {
  AddressDTOCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends AddressDTO>(
      Then<AddressDTO, $Out2> t, Then<$Out2, $R2> t2);
  $R call(
      {String? address,
      String? apartmentNumber,
      String? country,
      String? region,
      String? city,
      String? street,
      String? house,
      String? building,
      String? lat,
      String? lon,
      String? floor,
      String? comment,
      String? id});
}

class _AddressDTOCopyWithImpl<$R, $Out extends AddressDTO>
    extends CopyWithBase<$R, AddressDTO, $Out>
    implements AddressDTOCopyWith<$R, AddressDTO, $Out> {
  _AddressDTOCopyWithImpl(super.value, super.then, super.then2);
  @override
  AddressDTOCopyWith<$R2, AddressDTO, $Out2>
      chain<$R2, $Out2 extends AddressDTO>(
              Then<AddressDTO, $Out2> t, Then<$Out2, $R2> t2) =>
          _AddressDTOCopyWithImpl($value, t, t2);

  @override
  $R call(
          {String? address,
          String? apartmentNumber,
          String? country,
          String? region,
          String? city,
          String? street,
          String? house,
          String? building,
          String? lat,
          String? lon,
          String? floor,
          String? comment,
          Object? id = $none}) =>
      $then(AddressDTO(
          address: address ?? $value.address,
          apartmentNumber: apartmentNumber ?? $value.apartmentNumber,
          country: country ?? $value.country,
          region: region ?? $value.region,
          city: city ?? $value.city,
          street: street ?? $value.street,
          house: house ?? $value.house,
          building: building ?? $value.building,
          lat: lat ?? $value.lat,
          lon: lon ?? $value.lon,
          floor: floor ?? $value.floor,
          comment: comment ?? $value.comment,
          id: or(id, $value.id)));
}
