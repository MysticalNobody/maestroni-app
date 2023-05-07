// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'category_dto.dart';

class CategoryDTOMapper extends MapperBase<CategoryDTO> {
  static MapperContainer container = MapperContainer(
    mappers: {CategoryDTOMapper()},
  )..linkAll({ItemDTOMapper.container});

  @override
  CategoryDTOMapperElement createElement(MapperContainer container) {
    return CategoryDTOMapperElement._(this, container);
  }

  @override
  String get id => 'CategoryDTO';

  static final fromMap = container.fromMap<CategoryDTO>;
  static final fromJson = container.fromJson<CategoryDTO>;
}

class CategoryDTOMapperElement extends MapperElementBase<CategoryDTO> {
  CategoryDTOMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  CategoryDTO decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  CategoryDTO fromMap(Map<String, dynamic> map) => CategoryDTO(
      name: container.$getOpt(map, 'name') ?? 'Название отсутсвует',
      products: container.$getOpt(map, 'products') ?? const [],
      id: container.$getOpt(map, 'id'));

  @override
  Function get encoder => encode;
  dynamic encode(CategoryDTO v) => toMap(v);
  Map<String, dynamic> toMap(CategoryDTO c) => {
        'name': container.$enc(c.name, 'name'),
        'products': container.$enc(c.products, 'products'),
        if (container.$enc(c.id, 'id') != null) 'id': container.$enc(c.id, 'id')
      };

  @override
  String stringify(CategoryDTO self) =>
      'CategoryDTO(id: ${container.asString(self.id)}, name: ${container.asString(self.name)}, products: ${container.asString(self.products)})';
  @override
  int hash(CategoryDTO self) =>
      container.hash(self.id) ^
      container.hash(self.name) ^
      container.hash(self.products);
  @override
  bool equals(CategoryDTO self, CategoryDTO other) =>
      container.isEqual(self.id, other.id) &&
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.products, other.products);
}

mixin CategoryDTOMappable {
  String toJson() => CategoryDTOMapper.container.toJson(this as CategoryDTO);
  Map<String, dynamic> toMap() =>
      CategoryDTOMapper.container.toMap(this as CategoryDTO);
  CategoryDTOCopyWith<CategoryDTO, CategoryDTO, CategoryDTO> get copyWith =>
      _CategoryDTOCopyWithImpl(this as CategoryDTO, $identity, $identity);
  @override
  String toString() => CategoryDTOMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          CategoryDTOMapper.container.isEqual(this, other));
  @override
  int get hashCode => CategoryDTOMapper.container.hash(this);
}

extension CategoryDTOValueCopy<$R, $Out extends CategoryDTO>
    on ObjectCopyWith<$R, CategoryDTO, $Out> {
  CategoryDTOCopyWith<$R, CategoryDTO, $Out> get asCategoryDTO =>
      base.as((v, t, t2) => _CategoryDTOCopyWithImpl(v, t, t2));
}

typedef CategoryDTOCopyWithBound = CategoryDTO;

abstract class CategoryDTOCopyWith<$R, $In extends CategoryDTO,
    $Out extends CategoryDTO> implements ObjectCopyWith<$R, $In, $Out> {
  CategoryDTOCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends CategoryDTO>(
      Then<CategoryDTO, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, ItemDTO, ItemDTOCopyWith<$R, ItemDTO, ItemDTO>> get products;
  $R call({String? name, List<ItemDTO>? products, String? id});
}

class _CategoryDTOCopyWithImpl<$R, $Out extends CategoryDTO>
    extends CopyWithBase<$R, CategoryDTO, $Out>
    implements CategoryDTOCopyWith<$R, CategoryDTO, $Out> {
  _CategoryDTOCopyWithImpl(super.value, super.then, super.then2);
  @override
  CategoryDTOCopyWith<$R2, CategoryDTO, $Out2>
      chain<$R2, $Out2 extends CategoryDTO>(
              Then<CategoryDTO, $Out2> t, Then<$Out2, $R2> t2) =>
          _CategoryDTOCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, ItemDTO, ItemDTOCopyWith<$R, ItemDTO, ItemDTO>>
      get products => ListCopyWith(
          $value.products,
          (v, t) => v.copyWith.chain<$R, ItemDTO>($identity, t),
          (v) => call(products: v));
  @override
  $R call({String? name, List<ItemDTO>? products, Object? id = $none}) =>
      $then(CategoryDTO(
          name: name ?? $value.name,
          products: products ?? $value.products,
          id: or(id, $value.id)));
}
