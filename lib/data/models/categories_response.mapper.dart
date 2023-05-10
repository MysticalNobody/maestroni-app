// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'categories_response.dart';

class CategoriesResponseMapper extends MapperBase<CategoriesResponse> {
  static MapperContainer container = MapperContainer(
    mappers: {CategoriesResponseMapper()},
  )..linkAll({CategoriesActiveMapper.container});

  @override
  CategoriesResponseMapperElement createElement(MapperContainer container) {
    return CategoriesResponseMapperElement._(this, container);
  }

  @override
  String get id => 'CategoriesResponse';

  static final fromMap = container.fromMap<CategoriesResponse>;
  static final fromJson = container.fromJson<CategoriesResponse>;
}

class CategoriesResponseMapperElement
    extends MapperElementBase<CategoriesResponse> {
  CategoriesResponseMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  CategoriesResponse decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  CategoriesResponse fromMap(Map<String, dynamic> map) =>
      CategoriesResponse(data: container.$get(map, 'data'));

  @override
  Function get encoder => encode;
  dynamic encode(CategoriesResponse v) => toMap(v);
  Map<String, dynamic> toMap(CategoriesResponse c) =>
      {'data': container.$enc(c.data, 'data')};

  @override
  String stringify(CategoriesResponse self) =>
      'CategoriesResponse(data: ${container.asString(self.data)})';
  @override
  int hash(CategoriesResponse self) => container.hash(self.data);
  @override
  bool equals(CategoriesResponse self, CategoriesResponse other) =>
      container.isEqual(self.data, other.data);
}

mixin CategoriesResponseMappable {
  String toJson() =>
      CategoriesResponseMapper.container.toJson(this as CategoriesResponse);
  Map<String, dynamic> toMap() =>
      CategoriesResponseMapper.container.toMap(this as CategoriesResponse);
  CategoriesResponseCopyWith<CategoriesResponse, CategoriesResponse,
          CategoriesResponse>
      get copyWith => _CategoriesResponseCopyWithImpl(
          this as CategoriesResponse, $identity, $identity);
  @override
  String toString() => CategoriesResponseMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          CategoriesResponseMapper.container.isEqual(this, other));
  @override
  int get hashCode => CategoriesResponseMapper.container.hash(this);
}

extension CategoriesResponseValueCopy<$R, $Out extends CategoriesResponse>
    on ObjectCopyWith<$R, CategoriesResponse, $Out> {
  CategoriesResponseCopyWith<$R, CategoriesResponse, $Out>
      get asCategoriesResponse =>
          base.as((v, t, t2) => _CategoriesResponseCopyWithImpl(v, t, t2));
}

typedef CategoriesResponseCopyWithBound = CategoriesResponse;

abstract class CategoriesResponseCopyWith<$R, $In extends CategoriesResponse,
    $Out extends CategoriesResponse> implements ObjectCopyWith<$R, $In, $Out> {
  CategoriesResponseCopyWith<$R2, $In, $Out2>
      chain<$R2, $Out2 extends CategoriesResponse>(
          Then<CategoriesResponse, $Out2> t, Then<$Out2, $R2> t2);
  CategoriesActiveCopyWith<$R, CategoriesActive, CategoriesActive> get data;
  $R call({CategoriesActive? data});
}

class _CategoriesResponseCopyWithImpl<$R, $Out extends CategoriesResponse>
    extends CopyWithBase<$R, CategoriesResponse, $Out>
    implements CategoriesResponseCopyWith<$R, CategoriesResponse, $Out> {
  _CategoriesResponseCopyWithImpl(super.value, super.then, super.then2);
  @override
  CategoriesResponseCopyWith<$R2, CategoriesResponse, $Out2>
      chain<$R2, $Out2 extends CategoriesResponse>(
              Then<CategoriesResponse, $Out2> t, Then<$Out2, $R2> t2) =>
          _CategoriesResponseCopyWithImpl($value, t, t2);

  @override
  CategoriesActiveCopyWith<$R, CategoriesActive, CategoriesActive> get data =>
      $value.data.copyWith.chain($identity, (v) => call(data: v));
  @override
  $R call({CategoriesActive? data}) =>
      $then(CategoriesResponse(data: data ?? $value.data));
}
