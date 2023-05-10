// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'item_dto.dart';

class ItemDTOMapper extends MapperBase<ItemDTO> {
  static MapperContainer container = MapperContainer(
    mappers: {ItemDTOMapper()},
  );

  @override
  ItemDTOMapperElement createElement(MapperContainer container) {
    return ItemDTOMapperElement._(this, container);
  }

  @override
  String get id => 'ItemDTO';

  static final fromMap = container.fromMap<ItemDTO>;
  static final fromJson = container.fromJson<ItemDTO>;
}

class ItemDTOMapperElement extends MapperElementBase<ItemDTO> {
  ItemDTOMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  ItemDTO decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  ItemDTO fromMap(Map<String, dynamic> map) => ItemDTO(
      id: container.$get(map, 'id'),
      price: container.$getOpt(map, 'price') ?? 0,
      name: container.$getOpt(map, 'name') ?? 'Название отсутствует',
      avability: container.$getOpt(map, 'avability') ?? false,
      description:
          container.$getOpt(map, 'description') ?? 'Описание отсутствует',
      imageUrls: container.$getOpt(map, 'imageUrls') ?? const [],
      carbohydrates: container.$getOpt(map, 'carbohydrates') ?? 0,
      proteins: container.$getOpt(map, 'proteins') ?? 0,
      energyValue: container.$getOpt(map, 'energyValue') ?? 0,
      fats: container.$getOpt(map, 'fats') ?? 0);

  @override
  Function get encoder => encode;
  dynamic encode(ItemDTO v) => toMap(v);
  Map<String, dynamic> toMap(ItemDTO i) => {
        'id': container.$enc(i.id, 'id'),
        'price': container.$enc(i.price, 'price'),
        'name': container.$enc(i.name, 'name'),
        'avability': container.$enc(i.avability, 'avability'),
        'description': container.$enc(i.description, 'description'),
        'imageUrls': container.$enc(i.imageUrls, 'imageUrls'),
        'carbohydrates': container.$enc(i.carbohydrates, 'carbohydrates'),
        'proteins': container.$enc(i.proteins, 'proteins'),
        'energyValue': container.$enc(i.energyValue, 'energyValue'),
        'fats': container.$enc(i.fats, 'fats')
      };

  @override
  String stringify(ItemDTO self) =>
      'ItemDTO(id: ${container.asString(self.id)}, name: ${container.asString(self.name)}, price: ${container.asString(self.price)}, description: ${container.asString(self.description)}, avability: ${container.asString(self.avability)}, imageUrls: ${container.asString(self.imageUrls)}, proteins: ${container.asString(self.proteins)}, fats: ${container.asString(self.fats)}, carbohydrates: ${container.asString(self.carbohydrates)}, energyValue: ${container.asString(self.energyValue)})';
  @override
  int hash(ItemDTO self) =>
      container.hash(self.id) ^
      container.hash(self.name) ^
      container.hash(self.price) ^
      container.hash(self.description) ^
      container.hash(self.avability) ^
      container.hash(self.imageUrls) ^
      container.hash(self.proteins) ^
      container.hash(self.fats) ^
      container.hash(self.carbohydrates) ^
      container.hash(self.energyValue);
  @override
  bool equals(ItemDTO self, ItemDTO other) =>
      container.isEqual(self.id, other.id) &&
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.price, other.price) &&
      container.isEqual(self.description, other.description) &&
      container.isEqual(self.avability, other.avability) &&
      container.isEqual(self.imageUrls, other.imageUrls) &&
      container.isEqual(self.proteins, other.proteins) &&
      container.isEqual(self.fats, other.fats) &&
      container.isEqual(self.carbohydrates, other.carbohydrates) &&
      container.isEqual(self.energyValue, other.energyValue);
}

mixin ItemDTOMappable {
  String toJson() => ItemDTOMapper.container.toJson(this as ItemDTO);
  Map<String, dynamic> toMap() =>
      ItemDTOMapper.container.toMap(this as ItemDTO);
  ItemDTOCopyWith<ItemDTO, ItemDTO, ItemDTO> get copyWith =>
      _ItemDTOCopyWithImpl(this as ItemDTO, $identity, $identity);
  @override
  String toString() => ItemDTOMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          ItemDTOMapper.container.isEqual(this, other));
  @override
  int get hashCode => ItemDTOMapper.container.hash(this);
}

extension ItemDTOValueCopy<$R, $Out extends ItemDTO>
    on ObjectCopyWith<$R, ItemDTO, $Out> {
  ItemDTOCopyWith<$R, ItemDTO, $Out> get asItemDTO =>
      base.as((v, t, t2) => _ItemDTOCopyWithImpl(v, t, t2));
}

typedef ItemDTOCopyWithBound = ItemDTO;

abstract class ItemDTOCopyWith<$R, $In extends ItemDTO, $Out extends ItemDTO>
    implements ObjectCopyWith<$R, $In, $Out> {
  ItemDTOCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends ItemDTO>(
      Then<ItemDTO, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get imageUrls;
  $R call(
      {String? id,
      double? price,
      String? name,
      bool? avability,
      String? description,
      List<String>? imageUrls,
      int? carbohydrates,
      int? proteins,
      int? energyValue,
      int? fats});
}

class _ItemDTOCopyWithImpl<$R, $Out extends ItemDTO>
    extends CopyWithBase<$R, ItemDTO, $Out>
    implements ItemDTOCopyWith<$R, ItemDTO, $Out> {
  _ItemDTOCopyWithImpl(super.value, super.then, super.then2);
  @override
  ItemDTOCopyWith<$R2, ItemDTO, $Out2> chain<$R2, $Out2 extends ItemDTO>(
          Then<ItemDTO, $Out2> t, Then<$Out2, $R2> t2) =>
      _ItemDTOCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get imageUrls =>
      ListCopyWith($value.imageUrls, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(imageUrls: v));
  @override
  $R call(
          {String? id,
          double? price,
          String? name,
          bool? avability,
          String? description,
          List<String>? imageUrls,
          int? carbohydrates,
          int? proteins,
          int? energyValue,
          int? fats}) =>
      $then(ItemDTO(
          id: id ?? $value.id,
          price: price ?? $value.price,
          name: name ?? $value.name,
          avability: avability ?? $value.avability,
          description: description ?? $value.description,
          imageUrls: imageUrls ?? $value.imageUrls,
          carbohydrates: carbohydrates ?? $value.carbohydrates,
          proteins: proteins ?? $value.proteins,
          energyValue: energyValue ?? $value.energyValue,
          fats: fats ?? $value.fats));
}
