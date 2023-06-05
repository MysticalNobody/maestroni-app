// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'search_address_dto.dart';

class SearchAddressDTOMapper extends ClassMapperBase<SearchAddressDTO> {
  SearchAddressDTOMapper._();

  static SearchAddressDTOMapper? _instance;
  static SearchAddressDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SearchAddressDTOMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'SearchAddressDTO';

  static String _$address(SearchAddressDTO v) => v.address;
  static const Field<SearchAddressDTO, String> _f$address =
      Field('address', _$address);
  static String _$fullAddress(SearchAddressDTO v) => v.fullAddress;
  static const Field<SearchAddressDTO, String> _f$fullAddress =
      Field('fullAddress', _$fullAddress);
  static String _$country(SearchAddressDTO v) => v.country;
  static const Field<SearchAddressDTO, String> _f$country =
      Field('country', _$country);
  static String _$city(SearchAddressDTO v) => v.city;
  static const Field<SearchAddressDTO, String> _f$city = Field('city', _$city);
  static String _$street(SearchAddressDTO v) => v.street;
  static const Field<SearchAddressDTO, String> _f$street =
      Field('street', _$street);
  static String _$house(SearchAddressDTO v) => v.house;
  static const Field<SearchAddressDTO, String> _f$house =
      Field('house', _$house);
  static String _$building(SearchAddressDTO v) => v.building;
  static const Field<SearchAddressDTO, String> _f$building =
      Field('building', _$building);
  static String _$postalCode(SearchAddressDTO v) => v.postalCode;
  static const Field<SearchAddressDTO, String> _f$postalCode =
      Field('postalCode', _$postalCode);
  static double _$geoLat(SearchAddressDTO v) => v.geoLat;
  static const Field<SearchAddressDTO, double> _f$geoLat =
      Field('geoLat', _$geoLat);
  static double _$geoLon(SearchAddressDTO v) => v.geoLon;
  static const Field<SearchAddressDTO, double> _f$geoLon =
      Field('geoLon', _$geoLon);

  @override
  final Map<Symbol, Field<SearchAddressDTO, dynamic>> fields = const {
    #address: _f$address,
    #fullAddress: _f$fullAddress,
    #country: _f$country,
    #city: _f$city,
    #street: _f$street,
    #house: _f$house,
    #building: _f$building,
    #postalCode: _f$postalCode,
    #geoLat: _f$geoLat,
    #geoLon: _f$geoLon,
  };
  @override
  final bool ignoreNull = true;

  static SearchAddressDTO _instantiate(DecodingData data) {
    return SearchAddressDTO(
        data.dec(_f$address),
        data.dec(_f$fullAddress),
        data.dec(_f$country),
        data.dec(_f$city),
        data.dec(_f$street),
        data.dec(_f$house),
        data.dec(_f$building),
        data.dec(_f$postalCode),
        data.dec(_f$geoLat),
        data.dec(_f$geoLon));
  }

  @override
  final Function instantiate = _instantiate;

  static SearchAddressDTO fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SearchAddressDTO>(map));
  }

  static SearchAddressDTO fromJson(String json) {
    return _guard((c) => c.fromJson<SearchAddressDTO>(json));
  }
}

mixin SearchAddressDTOMappable {
  String toJson() {
    return SearchAddressDTOMapper._guard(
        (c) => c.toJson(this as SearchAddressDTO));
  }

  Map<String, dynamic> toMap() {
    return SearchAddressDTOMapper._guard(
        (c) => c.toMap(this as SearchAddressDTO));
  }

  SearchAddressDTOCopyWith<SearchAddressDTO, SearchAddressDTO, SearchAddressDTO>
      get copyWith => _SearchAddressDTOCopyWithImpl(
          this as SearchAddressDTO, $identity, $identity);
  @override
  String toString() {
    return SearchAddressDTOMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SearchAddressDTOMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return SearchAddressDTOMapper._guard((c) => c.hash(this));
  }
}

extension SearchAddressDTOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SearchAddressDTO, $Out> {
  SearchAddressDTOCopyWith<$R, SearchAddressDTO, $Out>
      get $asSearchAddressDTO =>
          $base.as((v, t, t2) => _SearchAddressDTOCopyWithImpl(v, t, t2));
}

abstract class SearchAddressDTOCopyWith<$R, $In extends SearchAddressDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? address,
      String? fullAddress,
      String? country,
      String? city,
      String? street,
      String? house,
      String? building,
      String? postalCode,
      double? geoLat,
      double? geoLon});
  SearchAddressDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SearchAddressDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SearchAddressDTO, $Out>
    implements SearchAddressDTOCopyWith<$R, SearchAddressDTO, $Out> {
  _SearchAddressDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SearchAddressDTO> $mapper =
      SearchAddressDTOMapper.ensureInitialized();
  @override
  $R call(
          {String? address,
          String? fullAddress,
          String? country,
          String? city,
          String? street,
          String? house,
          String? building,
          String? postalCode,
          double? geoLat,
          double? geoLon}) =>
      $apply(FieldCopyWithData({
        if (address != null) #address: address,
        if (fullAddress != null) #fullAddress: fullAddress,
        if (country != null) #country: country,
        if (city != null) #city: city,
        if (street != null) #street: street,
        if (house != null) #house: house,
        if (building != null) #building: building,
        if (postalCode != null) #postalCode: postalCode,
        if (geoLat != null) #geoLat: geoLat,
        if (geoLon != null) #geoLon: geoLon
      }));
  @override
  SearchAddressDTO $make(CopyWithData data) => SearchAddressDTO(
      data.get(#address, or: $value.address),
      data.get(#fullAddress, or: $value.fullAddress),
      data.get(#country, or: $value.country),
      data.get(#city, or: $value.city),
      data.get(#street, or: $value.street),
      data.get(#house, or: $value.house),
      data.get(#building, or: $value.building),
      data.get(#postalCode, or: $value.postalCode),
      data.get(#geoLat, or: $value.geoLat),
      data.get(#geoLon, or: $value.geoLon));

  @override
  SearchAddressDTOCopyWith<$R2, SearchAddressDTO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SearchAddressDTOCopyWithImpl($value, $cast, t);
}
