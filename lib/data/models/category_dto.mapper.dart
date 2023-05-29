// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'category_dto.dart';

class CategoryDTOMapper extends ClassMapperBase<CategoryDTO> {
  CategoryDTOMapper._();

  static CategoryDTOMapper? _instance;
  static CategoryDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoryDTOMapper._());
      ItemDTOMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'CategoryDTO';

  static String _$name(CategoryDTO v) => v.name;
  static const Field<CategoryDTO, String> _f$name =
      Field('name', _$name, opt: true, def: 'Название отсутсвует');
  static List<ItemDTO> _$products(CategoryDTO v) => v.products;
  static const Field<CategoryDTO, List<ItemDTO>> _f$products =
      Field('products', _$products, opt: true, def: const []);
  static String? _$id(CategoryDTO v) => v.id;
  static const Field<CategoryDTO, String> _f$id = Field('id', _$id, opt: true);

  @override
  final Map<Symbol, Field<CategoryDTO, dynamic>> fields = const {
    #name: _f$name,
    #products: _f$products,
    #id: _f$id,
  };
  @override
  final bool ignoreNull = true;

  static CategoryDTO _instantiate(DecodingData data) {
    return CategoryDTO(
        name: data.dec(_f$name),
        products: data.dec(_f$products),
        id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static CategoryDTO fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<CategoryDTO>(map));
  }

  static CategoryDTO fromJson(String json) {
    return _guard((c) => c.fromJson<CategoryDTO>(json));
  }
}

mixin CategoryDTOMappable {
  String toJson() {
    return CategoryDTOMapper._guard((c) => c.toJson(this as CategoryDTO));
  }

  Map<String, dynamic> toMap() {
    return CategoryDTOMapper._guard((c) => c.toMap(this as CategoryDTO));
  }

  CategoryDTOCopyWith<CategoryDTO, CategoryDTO, CategoryDTO> get copyWith =>
      _CategoryDTOCopyWithImpl(this as CategoryDTO, $identity, $identity);
  @override
  String toString() {
    return CategoryDTOMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CategoryDTOMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return CategoryDTOMapper._guard((c) => c.hash(this));
  }
}

extension CategoryDTOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CategoryDTO, $Out> {
  CategoryDTOCopyWith<$R, CategoryDTO, $Out> get $asCategoryDTO =>
      $base.as((v, t, t2) => _CategoryDTOCopyWithImpl(v, t, t2));
}

abstract class CategoryDTOCopyWith<$R, $In extends CategoryDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, ItemDTO, ItemDTOCopyWith<$R, ItemDTO, ItemDTO>> get products;
  $R call({String? name, List<ItemDTO>? products, String? id});
  CategoryDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CategoryDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CategoryDTO, $Out>
    implements CategoryDTOCopyWith<$R, CategoryDTO, $Out> {
  _CategoryDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CategoryDTO> $mapper =
      CategoryDTOMapper.ensureInitialized();
  @override
  ListCopyWith<$R, ItemDTO, ItemDTOCopyWith<$R, ItemDTO, ItemDTO>>
      get products => ListCopyWith($value.products,
          (v, t) => v.copyWith.$chain(t), (v) => call(products: v));
  @override
  $R call({String? name, List<ItemDTO>? products, Object? id = $none}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (products != null) #products: products,
        if (id != $none) #id: id
      }));
  @override
  CategoryDTO $make(CopyWithData data) => CategoryDTO(
      name: data.get(#name, or: $value.name),
      products: data.get(#products, or: $value.products),
      id: data.get(#id, or: $value.id));

  @override
  CategoryDTOCopyWith<$R2, CategoryDTO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CategoryDTOCopyWithImpl($value, $cast, t);
}
