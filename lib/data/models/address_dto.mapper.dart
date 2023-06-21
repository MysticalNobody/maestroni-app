// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'address_dto.dart';

class AddressDTOMapper extends ClassMapperBase<AddressDTO> {
  AddressDTOMapper._();

  static AddressDTOMapper? _instance;
  static AddressDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AddressDTOMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'AddressDTO';

  static String _$fullAddress(AddressDTO v) => v.fullAddress;
  static const Field<AddressDTO, String> _f$fullAddress =
      Field('fullAddress', _$fullAddress);
  static String _$apartmentNumber(AddressDTO v) => v.apartmentNumber;
  static const Field<AddressDTO, String> _f$apartmentNumber =
      Field('apartmentNumber', _$apartmentNumber);
  static String _$country(AddressDTO v) => v.country;
  static const Field<AddressDTO, String> _f$country =
      Field('country', _$country);
  static String _$cityName(AddressDTO v) => v.cityName;
  static const Field<AddressDTO, String> _f$cityName =
      Field('cityName', _$cityName);
  static String _$street(AddressDTO v) => v.street;
  static const Field<AddressDTO, String> _f$street = Field('street', _$street);
  static String _$houseNumber(AddressDTO v) => v.houseNumber;
  static const Field<AddressDTO, String> _f$houseNumber =
      Field('houseNumber', _$houseNumber);
  static String _$building(AddressDTO v) => v.building;
  static const Field<AddressDTO, String> _f$building =
      Field('building', _$building);
  static double _$lat(AddressDTO v) => v.lat;
  static const Field<AddressDTO, double> _f$lat = Field('lat', _$lat);
  static double _$lon(AddressDTO v) => v.lon;
  static const Field<AddressDTO, double> _f$lon = Field('lon', _$lon);
  static String _$comment(AddressDTO v) => v.comment;
  static const Field<AddressDTO, String> _f$comment =
      Field('comment', _$comment);
  static String? _$id(AddressDTO v) => v.id;
  static const Field<AddressDTO, String> _f$id = Field('id', _$id, opt: true);

  @override
  final Map<Symbol, Field<AddressDTO, dynamic>> fields = const {
    #fullAddress: _f$fullAddress,
    #apartmentNumber: _f$apartmentNumber,
    #country: _f$country,
    #cityName: _f$cityName,
    #street: _f$street,
    #houseNumber: _f$houseNumber,
    #building: _f$building,
    #lat: _f$lat,
    #lon: _f$lon,
    #comment: _f$comment,
    #id: _f$id,
  };
  @override
  final bool ignoreNull = true;

  static AddressDTO _instantiate(DecodingData data) {
    return AddressDTO(
        fullAddress: data.dec(_f$fullAddress),
        apartmentNumber: data.dec(_f$apartmentNumber),
        country: data.dec(_f$country),
        cityName: data.dec(_f$cityName),
        street: data.dec(_f$street),
        houseNumber: data.dec(_f$houseNumber),
        building: data.dec(_f$building),
        lat: data.dec(_f$lat),
        lon: data.dec(_f$lon),
        comment: data.dec(_f$comment),
        id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static AddressDTO fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<AddressDTO>(map));
  }

  static AddressDTO fromJson(String json) {
    return _guard((c) => c.fromJson<AddressDTO>(json));
  }
}

mixin AddressDTOMappable {
  String toJson() {
    return AddressDTOMapper._guard((c) => c.toJson(this as AddressDTO));
  }

  Map<String, dynamic> toMap() {
    return AddressDTOMapper._guard((c) => c.toMap(this as AddressDTO));
  }

  AddressDTOCopyWith<AddressDTO, AddressDTO, AddressDTO> get copyWith =>
      _AddressDTOCopyWithImpl(this as AddressDTO, $identity, $identity);
  @override
  String toString() {
    return AddressDTOMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AddressDTOMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return AddressDTOMapper._guard((c) => c.hash(this));
  }
}

extension AddressDTOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AddressDTO, $Out> {
  AddressDTOCopyWith<$R, AddressDTO, $Out> get $asAddressDTO =>
      $base.as((v, t, t2) => _AddressDTOCopyWithImpl(v, t, t2));
}

abstract class AddressDTOCopyWith<$R, $In extends AddressDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? fullAddress,
      String? apartmentNumber,
      String? country,
      String? cityName,
      String? street,
      String? houseNumber,
      String? building,
      double? lat,
      double? lon,
      String? comment,
      String? id});
  AddressDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AddressDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AddressDTO, $Out>
    implements AddressDTOCopyWith<$R, AddressDTO, $Out> {
  _AddressDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AddressDTO> $mapper =
      AddressDTOMapper.ensureInitialized();
  @override
  $R call(
          {String? fullAddress,
          String? apartmentNumber,
          String? country,
          String? cityName,
          String? street,
          String? houseNumber,
          String? building,
          double? lat,
          double? lon,
          String? comment,
          Object? id = $none}) =>
      $apply(FieldCopyWithData({
        if (fullAddress != null) #fullAddress: fullAddress,
        if (apartmentNumber != null) #apartmentNumber: apartmentNumber,
        if (country != null) #country: country,
        if (cityName != null) #cityName: cityName,
        if (street != null) #street: street,
        if (houseNumber != null) #houseNumber: houseNumber,
        if (building != null) #building: building,
        if (lat != null) #lat: lat,
        if (lon != null) #lon: lon,
        if (comment != null) #comment: comment,
        if (id != $none) #id: id
      }));
  @override
  AddressDTO $make(CopyWithData data) => AddressDTO(
      fullAddress: data.get(#fullAddress, or: $value.fullAddress),
      apartmentNumber: data.get(#apartmentNumber, or: $value.apartmentNumber),
      country: data.get(#country, or: $value.country),
      cityName: data.get(#cityName, or: $value.cityName),
      street: data.get(#street, or: $value.street),
      houseNumber: data.get(#houseNumber, or: $value.houseNumber),
      building: data.get(#building, or: $value.building),
      lat: data.get(#lat, or: $value.lat),
      lon: data.get(#lon, or: $value.lon),
      comment: data.get(#comment, or: $value.comment),
      id: data.get(#id, or: $value.id));

  @override
  AddressDTOCopyWith<$R2, AddressDTO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AddressDTOCopyWithImpl($value, $cast, t);
}
