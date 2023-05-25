// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'rest_address_response.dart';

class RestAddressResponseMapper extends MapperBase<RestAddressResponse> {
  static MapperContainer container = MapperContainer(
    mappers: {RestAddressResponseMapper()},
  )..linkAll({RestAddressDTOMapper.container});

  @override
  RestAddressResponseMapperElement createElement(MapperContainer container) {
    return RestAddressResponseMapperElement._(this, container);
  }

  @override
  String get id => 'RestAddressResponse';

  static final fromMap = container.fromMap<RestAddressResponse>;
  static final fromJson = container.fromJson<RestAddressResponse>;
}

class RestAddressResponseMapperElement
    extends MapperElementBase<RestAddressResponse> {
  RestAddressResponseMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  RestAddressResponse decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  RestAddressResponse fromMap(Map<String, dynamic> map) =>
      RestAddressResponse(container.$get(map, 'result'));

  @override
  Function get encoder => encode;
  dynamic encode(RestAddressResponse v) => toMap(v);
  Map<String, dynamic> toMap(RestAddressResponse r) =>
      {'result': container.$enc(r.result, 'result')};

  @override
  String stringify(RestAddressResponse self) =>
      'RestAddressResponse(result: ${container.asString(self.result)})';
  @override
  int hash(RestAddressResponse self) => container.hash(self.result);
  @override
  bool equals(RestAddressResponse self, RestAddressResponse other) =>
      container.isEqual(self.result, other.result);
}

mixin RestAddressResponseMappable {
  String toJson() =>
      RestAddressResponseMapper.container.toJson(this as RestAddressResponse);
  Map<String, dynamic> toMap() =>
      RestAddressResponseMapper.container.toMap(this as RestAddressResponse);
  RestAddressResponseCopyWith<RestAddressResponse, RestAddressResponse,
          RestAddressResponse>
      get copyWith => _RestAddressResponseCopyWithImpl(
          this as RestAddressResponse, $identity, $identity);
  @override
  String toString() => RestAddressResponseMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          RestAddressResponseMapper.container.isEqual(this, other));
  @override
  int get hashCode => RestAddressResponseMapper.container.hash(this);
}

extension RestAddressResponseValueCopy<$R, $Out extends RestAddressResponse>
    on ObjectCopyWith<$R, RestAddressResponse, $Out> {
  RestAddressResponseCopyWith<$R, RestAddressResponse, $Out>
      get asRestAddressResponse =>
          base.as((v, t, t2) => _RestAddressResponseCopyWithImpl(v, t, t2));
}

typedef RestAddressResponseCopyWithBound = RestAddressResponse;

abstract class RestAddressResponseCopyWith<$R, $In extends RestAddressResponse,
    $Out extends RestAddressResponse> implements ObjectCopyWith<$R, $In, $Out> {
  RestAddressResponseCopyWith<$R2, $In, $Out2>
      chain<$R2, $Out2 extends RestAddressResponse>(
          Then<RestAddressResponse, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, RestAddressDTO,
      RestAddressDTOCopyWith<$R, RestAddressDTO, RestAddressDTO>> get result;
  $R call({List<RestAddressDTO>? result});
}

class _RestAddressResponseCopyWithImpl<$R, $Out extends RestAddressResponse>
    extends CopyWithBase<$R, RestAddressResponse, $Out>
    implements RestAddressResponseCopyWith<$R, RestAddressResponse, $Out> {
  _RestAddressResponseCopyWithImpl(super.value, super.then, super.then2);
  @override
  RestAddressResponseCopyWith<$R2, RestAddressResponse, $Out2>
      chain<$R2, $Out2 extends RestAddressResponse>(
              Then<RestAddressResponse, $Out2> t, Then<$Out2, $R2> t2) =>
          _RestAddressResponseCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, RestAddressDTO,
          RestAddressDTOCopyWith<$R, RestAddressDTO, RestAddressDTO>>
      get result => ListCopyWith(
          $value.result,
          (v, t) => v.copyWith.chain<$R, RestAddressDTO>($identity, t),
          (v) => call(result: v));
  @override
  $R call({List<RestAddressDTO>? result}) =>
      $then(RestAddressResponse(result ?? $value.result));
}
