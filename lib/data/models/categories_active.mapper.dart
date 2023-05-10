// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'categories_active.dart';

class CategoriesActiveMapper extends MapperBase<CategoriesActive> {
  static MapperContainer container = MapperContainer(
    mappers: {CategoriesActiveMapper()},
  )..linkAll({CategoryDTOMapper.container});

  @override
  CategoriesActiveMapperElement createElement(MapperContainer container) {
    return CategoriesActiveMapperElement._(this, container);
  }

  @override
  String get id => 'CategoriesActive';

  static final fromMap = container.fromMap<CategoriesActive>;
  static final fromJson = container.fromJson<CategoriesActive>;
}

class CategoriesActiveMapperElement
    extends MapperElementBase<CategoriesActive> {
  CategoriesActiveMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  CategoriesActive decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  CategoriesActive fromMap(Map<String, dynamic> map) =>
      CategoriesActive(active: container.$getOpt(map, 'active') ?? const []);

  @override
  Function get encoder => encode;
  dynamic encode(CategoriesActive v) => toMap(v);
  Map<String, dynamic> toMap(CategoriesActive c) =>
      {'active': container.$enc(c.active, 'active')};

  @override
  String stringify(CategoriesActive self) =>
      'CategoriesActive(active: ${container.asString(self.active)})';
  @override
  int hash(CategoriesActive self) => container.hash(self.active);
  @override
  bool equals(CategoriesActive self, CategoriesActive other) =>
      container.isEqual(self.active, other.active);
}

mixin CategoriesActiveMappable {
  String toJson() =>
      CategoriesActiveMapper.container.toJson(this as CategoriesActive);
  Map<String, dynamic> toMap() =>
      CategoriesActiveMapper.container.toMap(this as CategoriesActive);
  CategoriesActiveCopyWith<CategoriesActive, CategoriesActive, CategoriesActive>
      get copyWith => _CategoriesActiveCopyWithImpl(
          this as CategoriesActive, $identity, $identity);
  @override
  String toString() => CategoriesActiveMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          CategoriesActiveMapper.container.isEqual(this, other));
  @override
  int get hashCode => CategoriesActiveMapper.container.hash(this);
}

extension CategoriesActiveValueCopy<$R, $Out extends CategoriesActive>
    on ObjectCopyWith<$R, CategoriesActive, $Out> {
  CategoriesActiveCopyWith<$R, CategoriesActive, $Out> get asCategoriesActive =>
      base.as((v, t, t2) => _CategoriesActiveCopyWithImpl(v, t, t2));
}

typedef CategoriesActiveCopyWithBound = CategoriesActive;

abstract class CategoriesActiveCopyWith<$R, $In extends CategoriesActive,
    $Out extends CategoriesActive> implements ObjectCopyWith<$R, $In, $Out> {
  CategoriesActiveCopyWith<$R2, $In, $Out2>
      chain<$R2, $Out2 extends CategoriesActive>(
          Then<CategoriesActive, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, CategoryDTO,
      CategoryDTOCopyWith<$R, CategoryDTO, CategoryDTO>> get active;
  $R call({List<CategoryDTO>? active});
}

class _CategoriesActiveCopyWithImpl<$R, $Out extends CategoriesActive>
    extends CopyWithBase<$R, CategoriesActive, $Out>
    implements CategoriesActiveCopyWith<$R, CategoriesActive, $Out> {
  _CategoriesActiveCopyWithImpl(super.value, super.then, super.then2);
  @override
  CategoriesActiveCopyWith<$R2, CategoriesActive, $Out2>
      chain<$R2, $Out2 extends CategoriesActive>(
              Then<CategoriesActive, $Out2> t, Then<$Out2, $R2> t2) =>
          _CategoriesActiveCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, CategoryDTO,
          CategoryDTOCopyWith<$R, CategoryDTO, CategoryDTO>>
      get active => ListCopyWith(
          $value.active,
          (v, t) => v.copyWith.chain<$R, CategoryDTO>($identity, t),
          (v) => call(active: v));
  @override
  $R call({List<CategoryDTO>? active}) =>
      $then(CategoriesActive(active: active ?? $value.active));
}
