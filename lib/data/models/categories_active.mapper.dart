// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'categories_active.dart';

class CategoriesActiveMapper extends ClassMapperBase<CategoriesActive> {
  CategoriesActiveMapper._();

  static CategoriesActiveMapper? _instance;
  static CategoriesActiveMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoriesActiveMapper._());
      CategoryDTOMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'CategoriesActive';

  static List<CategoryDTO> _$active(CategoriesActive v) => v.active;
  static const Field<CategoriesActive, List<CategoryDTO>> _f$active =
      Field('active', _$active, opt: true, def: const []);

  @override
  final Map<Symbol, Field<CategoriesActive, dynamic>> fields = const {
    #active: _f$active,
  };
  @override
  final bool ignoreNull = true;

  static CategoriesActive _instantiate(DecodingData data) {
    return CategoriesActive(active: data.dec(_f$active));
  }

  @override
  final Function instantiate = _instantiate;

  static CategoriesActive fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<CategoriesActive>(map));
  }

  static CategoriesActive fromJson(String json) {
    return _guard((c) => c.fromJson<CategoriesActive>(json));
  }
}

mixin CategoriesActiveMappable {
  String toJson() {
    return CategoriesActiveMapper._guard(
        (c) => c.toJson(this as CategoriesActive));
  }

  Map<String, dynamic> toMap() {
    return CategoriesActiveMapper._guard(
        (c) => c.toMap(this as CategoriesActive));
  }

  CategoriesActiveCopyWith<CategoriesActive, CategoriesActive, CategoriesActive>
      get copyWith => _CategoriesActiveCopyWithImpl(
          this as CategoriesActive, $identity, $identity);
  @override
  String toString() {
    return CategoriesActiveMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CategoriesActiveMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return CategoriesActiveMapper._guard((c) => c.hash(this));
  }
}

extension CategoriesActiveValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CategoriesActive, $Out> {
  CategoriesActiveCopyWith<$R, CategoriesActive, $Out>
      get $asCategoriesActive =>
          $base.as((v, t, t2) => _CategoriesActiveCopyWithImpl(v, t, t2));
}

abstract class CategoriesActiveCopyWith<$R, $In extends CategoriesActive, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, CategoryDTO,
      CategoryDTOCopyWith<$R, CategoryDTO, CategoryDTO>> get active;
  $R call({List<CategoryDTO>? active});
  CategoriesActiveCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CategoriesActiveCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CategoriesActive, $Out>
    implements CategoriesActiveCopyWith<$R, CategoriesActive, $Out> {
  _CategoriesActiveCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CategoriesActive> $mapper =
      CategoriesActiveMapper.ensureInitialized();
  @override
  ListCopyWith<$R, CategoryDTO,
          CategoryDTOCopyWith<$R, CategoryDTO, CategoryDTO>>
      get active => ListCopyWith($value.active, (v, t) => v.copyWith.$chain(t),
          (v) => call(active: v));
  @override
  $R call({List<CategoryDTO>? active}) =>
      $apply(FieldCopyWithData({if (active != null) #active: active}));
  @override
  CategoriesActive $make(CopyWithData data) =>
      CategoriesActive(active: data.get(#active, or: $value.active));

  @override
  CategoriesActiveCopyWith<$R2, CategoriesActive, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CategoriesActiveCopyWithImpl($value, $cast, t);
}
