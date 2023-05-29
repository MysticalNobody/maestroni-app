// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'rest_address_dto.dart';

class RestAddressDTOMapper extends ClassMapperBase<RestAddressDTO> {
  RestAddressDTOMapper._();

  static RestAddressDTOMapper? _instance;
  static RestAddressDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RestAddressDTOMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'RestAddressDTO';

  static String _$id(RestAddressDTO v) => v.id;
  static const Field<RestAddressDTO, String> _f$id = Field('id', _$id);
  static String _$objectId(RestAddressDTO v) => v.objectId;
  static const Field<RestAddressDTO, String> _f$objectId =
      Field('objectId', _$objectId);
  static String _$actualAddress(RestAddressDTO v) => v.actualAddress;
  static const Field<RestAddressDTO, String> _f$actualAddress =
      Field('actualAddress', _$actualAddress);
  static String _$state(RestAddressDTO v) => v.state;
  static const Field<RestAddressDTO, String> _f$state = Field('state', _$state);
  static double? _$actualAddressLat(RestAddressDTO v) => v.actualAddressLat;
  static const Field<RestAddressDTO, double> _f$actualAddressLat =
      Field('actualAddressLat', _$actualAddressLat);
  static double? _$actualAddressLon(RestAddressDTO v) => v.actualAddressLon;
  static const Field<RestAddressDTO, double> _f$actualAddressLon =
      Field('actualAddressLon', _$actualAddressLon);
  static String _$city(RestAddressDTO v) => v.city;
  static const Field<RestAddressDTO, String> _f$city = Field('city', _$city);
  static String? _$schedule(RestAddressDTO v) => v.schedule;
  static const Field<RestAddressDTO, String> _f$schedule =
      Field('schedule', _$schedule);

  @override
  final Map<Symbol, Field<RestAddressDTO, dynamic>> fields = const {
    #id: _f$id,
    #objectId: _f$objectId,
    #actualAddress: _f$actualAddress,
    #state: _f$state,
    #actualAddressLat: _f$actualAddressLat,
    #actualAddressLon: _f$actualAddressLon,
    #city: _f$city,
    #schedule: _f$schedule,
  };
  @override
  final bool ignoreNull = true;

  static RestAddressDTO _instantiate(DecodingData data) {
    return RestAddressDTO(
        data.dec(_f$id),
        data.dec(_f$objectId),
        data.dec(_f$actualAddress),
        data.dec(_f$state),
        data.dec(_f$actualAddressLat),
        data.dec(_f$actualAddressLon),
        data.dec(_f$city),
        data.dec(_f$schedule));
  }

  @override
  final Function instantiate = _instantiate;

  static RestAddressDTO fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<RestAddressDTO>(map));
  }

  static RestAddressDTO fromJson(String json) {
    return _guard((c) => c.fromJson<RestAddressDTO>(json));
  }
}

mixin RestAddressDTOMappable {
  String toJson() {
    return RestAddressDTOMapper._guard((c) => c.toJson(this as RestAddressDTO));
  }

  Map<String, dynamic> toMap() {
    return RestAddressDTOMapper._guard((c) => c.toMap(this as RestAddressDTO));
  }

  RestAddressDTOCopyWith<RestAddressDTO, RestAddressDTO, RestAddressDTO>
      get copyWith => _RestAddressDTOCopyWithImpl(
          this as RestAddressDTO, $identity, $identity);
  @override
  String toString() {
    return RestAddressDTOMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            RestAddressDTOMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return RestAddressDTOMapper._guard((c) => c.hash(this));
  }
}

extension RestAddressDTOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RestAddressDTO, $Out> {
  RestAddressDTOCopyWith<$R, RestAddressDTO, $Out> get $asRestAddressDTO =>
      $base.as((v, t, t2) => _RestAddressDTOCopyWithImpl(v, t, t2));
}

abstract class RestAddressDTOCopyWith<$R, $In extends RestAddressDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? objectId,
      String? actualAddress,
      String? state,
      double? actualAddressLat,
      double? actualAddressLon,
      String? city,
      String? schedule});
  RestAddressDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _RestAddressDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RestAddressDTO, $Out>
    implements RestAddressDTOCopyWith<$R, RestAddressDTO, $Out> {
  _RestAddressDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RestAddressDTO> $mapper =
      RestAddressDTOMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          String? objectId,
          String? actualAddress,
          String? state,
          Object? actualAddressLat = $none,
          Object? actualAddressLon = $none,
          String? city,
          Object? schedule = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (objectId != null) #objectId: objectId,
        if (actualAddress != null) #actualAddress: actualAddress,
        if (state != null) #state: state,
        if (actualAddressLat != $none) #actualAddressLat: actualAddressLat,
        if (actualAddressLon != $none) #actualAddressLon: actualAddressLon,
        if (city != null) #city: city,
        if (schedule != $none) #schedule: schedule
      }));
  @override
  RestAddressDTO $make(CopyWithData data) => RestAddressDTO(
      data.get(#id, or: $value.id),
      data.get(#objectId, or: $value.objectId),
      data.get(#actualAddress, or: $value.actualAddress),
      data.get(#state, or: $value.state),
      data.get(#actualAddressLat, or: $value.actualAddressLat),
      data.get(#actualAddressLon, or: $value.actualAddressLon),
      data.get(#city, or: $value.city),
      data.get(#schedule, or: $value.schedule));

  @override
  RestAddressDTOCopyWith<$R2, RestAddressDTO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RestAddressDTOCopyWithImpl($value, $cast, t);
}
