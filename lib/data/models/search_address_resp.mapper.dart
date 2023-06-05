// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'search_address_resp.dart';

class SearchAddressRespMapper extends ClassMapperBase<SearchAddressResp> {
  SearchAddressRespMapper._();

  static SearchAddressRespMapper? _instance;
  static SearchAddressRespMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SearchAddressRespMapper._());
      SearchAddressDTOMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'SearchAddressResp';

  static List<SearchAddressDTO> _$result(SearchAddressResp v) => v.result;
  static const Field<SearchAddressResp, List<SearchAddressDTO>> _f$result =
      Field('result', _$result);

  @override
  final Map<Symbol, Field<SearchAddressResp, dynamic>> fields = const {
    #result: _f$result,
  };
  @override
  final bool ignoreNull = true;

  static SearchAddressResp _instantiate(DecodingData data) {
    return SearchAddressResp(result: data.dec(_f$result));
  }

  @override
  final Function instantiate = _instantiate;

  static SearchAddressResp fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SearchAddressResp>(map));
  }

  static SearchAddressResp fromJson(String json) {
    return _guard((c) => c.fromJson<SearchAddressResp>(json));
  }
}

mixin SearchAddressRespMappable {
  String toJson() {
    return SearchAddressRespMapper._guard(
        (c) => c.toJson(this as SearchAddressResp));
  }

  Map<String, dynamic> toMap() {
    return SearchAddressRespMapper._guard(
        (c) => c.toMap(this as SearchAddressResp));
  }

  SearchAddressRespCopyWith<SearchAddressResp, SearchAddressResp,
          SearchAddressResp>
      get copyWith => _SearchAddressRespCopyWithImpl(
          this as SearchAddressResp, $identity, $identity);
  @override
  String toString() {
    return SearchAddressRespMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SearchAddressRespMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return SearchAddressRespMapper._guard((c) => c.hash(this));
  }
}

extension SearchAddressRespValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SearchAddressResp, $Out> {
  SearchAddressRespCopyWith<$R, SearchAddressResp, $Out>
      get $asSearchAddressResp =>
          $base.as((v, t, t2) => _SearchAddressRespCopyWithImpl(v, t, t2));
}

abstract class SearchAddressRespCopyWith<$R, $In extends SearchAddressResp,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, SearchAddressDTO,
          SearchAddressDTOCopyWith<$R, SearchAddressDTO, SearchAddressDTO>>
      get result;
  $R call({List<SearchAddressDTO>? result});
  SearchAddressRespCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SearchAddressRespCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SearchAddressResp, $Out>
    implements SearchAddressRespCopyWith<$R, SearchAddressResp, $Out> {
  _SearchAddressRespCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SearchAddressResp> $mapper =
      SearchAddressRespMapper.ensureInitialized();
  @override
  ListCopyWith<$R, SearchAddressDTO,
          SearchAddressDTOCopyWith<$R, SearchAddressDTO, SearchAddressDTO>>
      get result => ListCopyWith($value.result, (v, t) => v.copyWith.$chain(t),
          (v) => call(result: v));
  @override
  $R call({List<SearchAddressDTO>? result}) =>
      $apply(FieldCopyWithData({if (result != null) #result: result}));
  @override
  SearchAddressResp $make(CopyWithData data) =>
      SearchAddressResp(result: data.get(#result, or: $value.result));

  @override
  SearchAddressRespCopyWith<$R2, SearchAddressResp, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SearchAddressRespCopyWithImpl($value, $cast, t);
}
