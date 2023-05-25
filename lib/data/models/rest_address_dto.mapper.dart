// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'rest_address_dto.dart';

class RestAddressDTOMapper extends MapperBase<RestAddressDTO> {
  static MapperContainer container = MapperContainer(
    mappers: {RestAddressDTOMapper()},
  );

  @override
  RestAddressDTOMapperElement createElement(MapperContainer container) {
    return RestAddressDTOMapperElement._(this, container);
  }

  @override
  String get id => 'RestAddressDTO';

  static final fromMap = container.fromMap<RestAddressDTO>;
  static final fromJson = container.fromJson<RestAddressDTO>;
}

class RestAddressDTOMapperElement extends MapperElementBase<RestAddressDTO> {
  RestAddressDTOMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  RestAddressDTO decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  RestAddressDTO fromMap(Map<String, dynamic> map) => RestAddressDTO(
      container.$get(map, 'id'),
      container.$get(map, 'objectId'),
      container.$get(map, 'actualAddress'),
      container.$get(map, 'state'),
      container.$getOpt(map, 'actualAddressLat'),
      container.$getOpt(map, 'actualAddressLon'),
      container.$get(map, 'city'),
      container.$getOpt(map, 'schedule'));

  @override
  Function get encoder => encode;
  dynamic encode(RestAddressDTO v) => toMap(v);
  Map<String, dynamic> toMap(RestAddressDTO r) => {
        'id': container.$enc(r.id, 'id'),
        'objectId': container.$enc(r.objectId, 'objectId'),
        'actualAddress': container.$enc(r.actualAddress, 'actualAddress'),
        'state': container.$enc(r.state, 'state'),
        if (container.$enc(r.actualAddressLat, 'actualAddressLat') != null)
          'actualAddressLat':
              container.$enc(r.actualAddressLat, 'actualAddressLat'),
        if (container.$enc(r.actualAddressLon, 'actualAddressLon') != null)
          'actualAddressLon':
              container.$enc(r.actualAddressLon, 'actualAddressLon'),
        'city': container.$enc(r.city, 'city'),
        if (container.$enc(r.schedule, 'schedule') != null)
          'schedule': container.$enc(r.schedule, 'schedule')
      };

  @override
  String stringify(RestAddressDTO self) =>
      'RestAddressDTO(id: ${container.asString(self.id)}, objectId: ${container.asString(self.objectId)}, actualAddress: ${container.asString(self.actualAddress)}, state: ${container.asString(self.state)}, actualAddressLat: ${container.asString(self.actualAddressLat)}, actualAddressLon: ${container.asString(self.actualAddressLon)}, city: ${container.asString(self.city)}, schedule: ${container.asString(self.schedule)})';
  @override
  int hash(RestAddressDTO self) =>
      container.hash(self.id) ^
      container.hash(self.objectId) ^
      container.hash(self.actualAddress) ^
      container.hash(self.state) ^
      container.hash(self.actualAddressLat) ^
      container.hash(self.actualAddressLon) ^
      container.hash(self.city) ^
      container.hash(self.schedule);
  @override
  bool equals(RestAddressDTO self, RestAddressDTO other) =>
      container.isEqual(self.id, other.id) &&
      container.isEqual(self.objectId, other.objectId) &&
      container.isEqual(self.actualAddress, other.actualAddress) &&
      container.isEqual(self.state, other.state) &&
      container.isEqual(self.actualAddressLat, other.actualAddressLat) &&
      container.isEqual(self.actualAddressLon, other.actualAddressLon) &&
      container.isEqual(self.city, other.city) &&
      container.isEqual(self.schedule, other.schedule);
}

mixin RestAddressDTOMappable {
  String toJson() =>
      RestAddressDTOMapper.container.toJson(this as RestAddressDTO);
  Map<String, dynamic> toMap() =>
      RestAddressDTOMapper.container.toMap(this as RestAddressDTO);
  RestAddressDTOCopyWith<RestAddressDTO, RestAddressDTO, RestAddressDTO>
      get copyWith => _RestAddressDTOCopyWithImpl(
          this as RestAddressDTO, $identity, $identity);
  @override
  String toString() => RestAddressDTOMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          RestAddressDTOMapper.container.isEqual(this, other));
  @override
  int get hashCode => RestAddressDTOMapper.container.hash(this);
}

extension RestAddressDTOValueCopy<$R, $Out extends RestAddressDTO>
    on ObjectCopyWith<$R, RestAddressDTO, $Out> {
  RestAddressDTOCopyWith<$R, RestAddressDTO, $Out> get asRestAddressDTO =>
      base.as((v, t, t2) => _RestAddressDTOCopyWithImpl(v, t, t2));
}

typedef RestAddressDTOCopyWithBound = RestAddressDTO;

abstract class RestAddressDTOCopyWith<$R, $In extends RestAddressDTO,
    $Out extends RestAddressDTO> implements ObjectCopyWith<$R, $In, $Out> {
  RestAddressDTOCopyWith<$R2, $In, $Out2>
      chain<$R2, $Out2 extends RestAddressDTO>(
          Then<RestAddressDTO, $Out2> t, Then<$Out2, $R2> t2);
  $R call(
      {String? id,
      String? objectId,
      String? actualAddress,
      String? state,
      double? actualAddressLat,
      double? actualAddressLon,
      String? city,
      String? schedule});
}

class _RestAddressDTOCopyWithImpl<$R, $Out extends RestAddressDTO>
    extends CopyWithBase<$R, RestAddressDTO, $Out>
    implements RestAddressDTOCopyWith<$R, RestAddressDTO, $Out> {
  _RestAddressDTOCopyWithImpl(super.value, super.then, super.then2);
  @override
  RestAddressDTOCopyWith<$R2, RestAddressDTO, $Out2>
      chain<$R2, $Out2 extends RestAddressDTO>(
              Then<RestAddressDTO, $Out2> t, Then<$Out2, $R2> t2) =>
          _RestAddressDTOCopyWithImpl($value, t, t2);

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
      $then(RestAddressDTO(
          id ?? $value.id,
          objectId ?? $value.objectId,
          actualAddress ?? $value.actualAddress,
          state ?? $value.state,
          or(actualAddressLat, $value.actualAddressLat),
          or(actualAddressLon, $value.actualAddressLon),
          city ?? $value.city,
          or(schedule, $value.schedule)));
}
