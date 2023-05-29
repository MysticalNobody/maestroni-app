// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'dish_dto.dart';

class DishDTOMapper extends ClassMapperBase<DishDTO> {
  DishDTOMapper._();

  static DishDTOMapper? _instance;
  static DishDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DishDTOMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'DishDTO';

  static String _$id(DishDTO v) => v.id;
  static const Field<DishDTO, String> _f$id = Field('id', _$id);
  static String _$name(DishDTO v) => v.name;
  static const Field<DishDTO, String> _f$name = Field('name', _$name);
  static String _$price(DishDTO v) => v.price;
  static const Field<DishDTO, String> _f$price = Field('price', _$price);
  static String _$quantity(DishDTO v) => v.quantity;
  static const Field<DishDTO, String> _f$quantity =
      Field('quantity', _$quantity);

  @override
  final Map<Symbol, Field<DishDTO, dynamic>> fields = const {
    #id: _f$id,
    #name: _f$name,
    #price: _f$price,
    #quantity: _f$quantity,
  };
  @override
  final bool ignoreNull = true;

  static DishDTO _instantiate(DecodingData data) {
    return DishDTO(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        price: data.dec(_f$price),
        quantity: data.dec(_f$quantity));
  }

  @override
  final Function instantiate = _instantiate;

  static DishDTO fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<DishDTO>(map));
  }

  static DishDTO fromJson(String json) {
    return _guard((c) => c.fromJson<DishDTO>(json));
  }
}

mixin DishDTOMappable {
  String toJson() {
    return DishDTOMapper._guard((c) => c.toJson(this as DishDTO));
  }

  Map<String, dynamic> toMap() {
    return DishDTOMapper._guard((c) => c.toMap(this as DishDTO));
  }

  DishDTOCopyWith<DishDTO, DishDTO, DishDTO> get copyWith =>
      _DishDTOCopyWithImpl(this as DishDTO, $identity, $identity);
  @override
  String toString() {
    return DishDTOMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DishDTOMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return DishDTOMapper._guard((c) => c.hash(this));
  }
}

extension DishDTOValueCopy<$R, $Out> on ObjectCopyWith<$R, DishDTO, $Out> {
  DishDTOCopyWith<$R, DishDTO, $Out> get $asDishDTO =>
      $base.as((v, t, t2) => _DishDTOCopyWithImpl(v, t, t2));
}

abstract class DishDTOCopyWith<$R, $In extends DishDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name, String? price, String? quantity});
  DishDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DishDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DishDTO, $Out>
    implements DishDTOCopyWith<$R, DishDTO, $Out> {
  _DishDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DishDTO> $mapper =
      DishDTOMapper.ensureInitialized();
  @override
  $R call({String? id, String? name, String? price, String? quantity}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (price != null) #price: price,
        if (quantity != null) #quantity: quantity
      }));
  @override
  DishDTO $make(CopyWithData data) => DishDTO(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      price: data.get(#price, or: $value.price),
      quantity: data.get(#quantity, or: $value.quantity));

  @override
  DishDTOCopyWith<$R2, DishDTO, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DishDTOCopyWithImpl($value, $cast, t);
}
