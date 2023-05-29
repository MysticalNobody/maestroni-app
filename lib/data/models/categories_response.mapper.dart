// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'categories_response.dart';

class CategoriesResponseMapper extends ClassMapperBase<CategoriesResponse> {
  CategoriesResponseMapper._();

  static CategoriesResponseMapper? _instance;
  static CategoriesResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoriesResponseMapper._());
      CategoriesActiveMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'CategoriesResponse';

  static CategoriesActive _$data(CategoriesResponse v) => v.data;
  static const Field<CategoriesResponse, CategoriesActive> _f$data =
      Field('data', _$data);

  @override
  final Map<Symbol, Field<CategoriesResponse, dynamic>> fields = const {
    #data: _f$data,
  };
  @override
  final bool ignoreNull = true;

  static CategoriesResponse _instantiate(DecodingData data) {
    return CategoriesResponse(data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static CategoriesResponse fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<CategoriesResponse>(map));
  }

  static CategoriesResponse fromJson(String json) {
    return _guard((c) => c.fromJson<CategoriesResponse>(json));
  }
}

mixin CategoriesResponseMappable {
  String toJson() {
    return CategoriesResponseMapper._guard(
        (c) => c.toJson(this as CategoriesResponse));
  }

  Map<String, dynamic> toMap() {
    return CategoriesResponseMapper._guard(
        (c) => c.toMap(this as CategoriesResponse));
  }

  CategoriesResponseCopyWith<CategoriesResponse, CategoriesResponse,
          CategoriesResponse>
      get copyWith => _CategoriesResponseCopyWithImpl(
          this as CategoriesResponse, $identity, $identity);
  @override
  String toString() {
    return CategoriesResponseMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CategoriesResponseMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return CategoriesResponseMapper._guard((c) => c.hash(this));
  }
}

extension CategoriesResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CategoriesResponse, $Out> {
  CategoriesResponseCopyWith<$R, CategoriesResponse, $Out>
      get $asCategoriesResponse =>
          $base.as((v, t, t2) => _CategoriesResponseCopyWithImpl(v, t, t2));
}

abstract class CategoriesResponseCopyWith<$R, $In extends CategoriesResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  CategoriesActiveCopyWith<$R, CategoriesActive, CategoriesActive> get data;
  $R call({CategoriesActive? data});
  CategoriesResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CategoriesResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CategoriesResponse, $Out>
    implements CategoriesResponseCopyWith<$R, CategoriesResponse, $Out> {
  _CategoriesResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CategoriesResponse> $mapper =
      CategoriesResponseMapper.ensureInitialized();
  @override
  CategoriesActiveCopyWith<$R, CategoriesActive, CategoriesActive> get data =>
      $value.data.copyWith.$chain((v) => call(data: v));
  @override
  $R call({CategoriesActive? data}) =>
      $apply(FieldCopyWithData({if (data != null) #data: data}));
  @override
  CategoriesResponse $make(CopyWithData data) =>
      CategoriesResponse(data: data.get(#data, or: $value.data));

  @override
  CategoriesResponseCopyWith<$R2, CategoriesResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CategoriesResponseCopyWithImpl($value, $cast, t);
}
