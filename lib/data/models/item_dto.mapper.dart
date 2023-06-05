// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'item_dto.dart';

class ItemDTOMapper extends ClassMapperBase<ItemDTO> {
  ItemDTOMapper._();

  static ItemDTOMapper? _instance;
  static ItemDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ItemDTOMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ItemDTO';

  static String _$id(ItemDTO v) => v.id;
  static const Field<ItemDTO, String> _f$id = Field('id', _$id);
  static String _$externalId(ItemDTO v) => v.externalId;
  static const Field<ItemDTO, String> _f$externalId =
      Field('externalId', _$externalId);
  static double _$price(ItemDTO v) => v.price;
  static const Field<ItemDTO, double> _f$price =
      Field('price', _$price, opt: true, def: 0);
  static String _$name(ItemDTO v) => v.name;
  static const Field<ItemDTO, String> _f$name =
      Field('name', _$name, opt: true, def: 'Название отсутствует');
  static bool _$avability(ItemDTO v) => v.avability;
  static const Field<ItemDTO, bool> _f$avability =
      Field('avability', _$avability, opt: true, def: false);
  static String _$description(ItemDTO v) => v.description;
  static const Field<ItemDTO, String> _f$description = Field(
      'description', _$description,
      opt: true, def: 'Описание отсутствует');
  static List<String> _$imageUrls(ItemDTO v) => v.imageUrls;
  static const Field<ItemDTO, List<String>> _f$imageUrls =
      Field('imageUrls', _$imageUrls, opt: true, def: const []);
  static int _$carbohydrates(ItemDTO v) => v.carbohydrates;
  static const Field<ItemDTO, int> _f$carbohydrates =
      Field('carbohydrates', _$carbohydrates, opt: true, def: 0);
  static int _$proteins(ItemDTO v) => v.proteins;
  static const Field<ItemDTO, int> _f$proteins =
      Field('proteins', _$proteins, opt: true, def: 0);
  static int _$energyValue(ItemDTO v) => v.energyValue;
  static const Field<ItemDTO, int> _f$energyValue =
      Field('energyValue', _$energyValue, opt: true, def: 0);
  static int _$fats(ItemDTO v) => v.fats;
  static const Field<ItemDTO, int> _f$fats =
      Field('fats', _$fats, opt: true, def: 0);

  @override
  final Map<Symbol, Field<ItemDTO, dynamic>> fields = const {
    #id: _f$id,
    #externalId: _f$externalId,
    #price: _f$price,
    #name: _f$name,
    #avability: _f$avability,
    #description: _f$description,
    #imageUrls: _f$imageUrls,
    #carbohydrates: _f$carbohydrates,
    #proteins: _f$proteins,
    #energyValue: _f$energyValue,
    #fats: _f$fats,
  };
  @override
  final bool ignoreNull = true;

  static ItemDTO _instantiate(DecodingData data) {
    return ItemDTO(
        id: data.dec(_f$id),
        externalId: data.dec(_f$externalId),
        price: data.dec(_f$price),
        name: data.dec(_f$name),
        avability: data.dec(_f$avability),
        description: data.dec(_f$description),
        imageUrls: data.dec(_f$imageUrls),
        carbohydrates: data.dec(_f$carbohydrates),
        proteins: data.dec(_f$proteins),
        energyValue: data.dec(_f$energyValue),
        fats: data.dec(_f$fats));
  }

  @override
  final Function instantiate = _instantiate;

  static ItemDTO fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ItemDTO>(map));
  }

  static ItemDTO fromJson(String json) {
    return _guard((c) => c.fromJson<ItemDTO>(json));
  }
}

mixin ItemDTOMappable {
  String toJson() {
    return ItemDTOMapper._guard((c) => c.toJson(this as ItemDTO));
  }

  Map<String, dynamic> toMap() {
    return ItemDTOMapper._guard((c) => c.toMap(this as ItemDTO));
  }

  ItemDTOCopyWith<ItemDTO, ItemDTO, ItemDTO> get copyWith =>
      _ItemDTOCopyWithImpl(this as ItemDTO, $identity, $identity);
  @override
  String toString() {
    return ItemDTOMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ItemDTOMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ItemDTOMapper._guard((c) => c.hash(this));
  }
}

extension ItemDTOValueCopy<$R, $Out> on ObjectCopyWith<$R, ItemDTO, $Out> {
  ItemDTOCopyWith<$R, ItemDTO, $Out> get $asItemDTO =>
      $base.as((v, t, t2) => _ItemDTOCopyWithImpl(v, t, t2));
}

abstract class ItemDTOCopyWith<$R, $In extends ItemDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get imageUrls;
  $R call(
      {String? id,
      String? externalId,
      double? price,
      String? name,
      bool? avability,
      String? description,
      List<String>? imageUrls,
      int? carbohydrates,
      int? proteins,
      int? energyValue,
      int? fats});
  ItemDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ItemDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ItemDTO, $Out>
    implements ItemDTOCopyWith<$R, ItemDTO, $Out> {
  _ItemDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ItemDTO> $mapper =
      ItemDTOMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get imageUrls =>
      ListCopyWith($value.imageUrls, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(imageUrls: v));
  @override
  $R call(
          {String? id,
          String? externalId,
          double? price,
          String? name,
          bool? avability,
          String? description,
          List<String>? imageUrls,
          int? carbohydrates,
          int? proteins,
          int? energyValue,
          int? fats}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (externalId != null) #externalId: externalId,
        if (price != null) #price: price,
        if (name != null) #name: name,
        if (avability != null) #avability: avability,
        if (description != null) #description: description,
        if (imageUrls != null) #imageUrls: imageUrls,
        if (carbohydrates != null) #carbohydrates: carbohydrates,
        if (proteins != null) #proteins: proteins,
        if (energyValue != null) #energyValue: energyValue,
        if (fats != null) #fats: fats
      }));
  @override
  ItemDTO $make(CopyWithData data) => ItemDTO(
      id: data.get(#id, or: $value.id),
      externalId: data.get(#externalId, or: $value.externalId),
      price: data.get(#price, or: $value.price),
      name: data.get(#name, or: $value.name),
      avability: data.get(#avability, or: $value.avability),
      description: data.get(#description, or: $value.description),
      imageUrls: data.get(#imageUrls, or: $value.imageUrls),
      carbohydrates: data.get(#carbohydrates, or: $value.carbohydrates),
      proteins: data.get(#proteins, or: $value.proteins),
      energyValue: data.get(#energyValue, or: $value.energyValue),
      fats: data.get(#fats, or: $value.fats));

  @override
  ItemDTOCopyWith<$R2, ItemDTO, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ItemDTOCopyWithImpl($value, $cast, t);
}
