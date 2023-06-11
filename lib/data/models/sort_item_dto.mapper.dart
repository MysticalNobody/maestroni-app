// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'sort_item_dto.dart';

class SortItemDTOMapper extends ClassMapperBase<SortItemDTO> {
  SortItemDTOMapper._();

  static SortItemDTOMapper? _instance;
  static SortItemDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SortItemDTOMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'SortItemDTO';

  static String _$productId(SortItemDTO v) => v.productId;
  static const Field<SortItemDTO, String> _f$productId =
      Field('productId', _$productId);
  static int _$listNumber(SortItemDTO v) => v.listNumber;
  static const Field<SortItemDTO, int> _f$listNumber =
      Field('listNumber', _$listNumber);

  @override
  final Map<Symbol, Field<SortItemDTO, dynamic>> fields = const {
    #productId: _f$productId,
    #listNumber: _f$listNumber,
  };
  @override
  final bool ignoreNull = true;

  static SortItemDTO _instantiate(DecodingData data) {
    return SortItemDTO(
        productId: data.dec(_f$productId), listNumber: data.dec(_f$listNumber));
  }

  @override
  final Function instantiate = _instantiate;

  static SortItemDTO fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SortItemDTO>(map));
  }

  static SortItemDTO fromJson(String json) {
    return _guard((c) => c.fromJson<SortItemDTO>(json));
  }
}

mixin SortItemDTOMappable {
  String toJson() {
    return SortItemDTOMapper._guard((c) => c.toJson(this as SortItemDTO));
  }

  Map<String, dynamic> toMap() {
    return SortItemDTOMapper._guard((c) => c.toMap(this as SortItemDTO));
  }

  SortItemDTOCopyWith<SortItemDTO, SortItemDTO, SortItemDTO> get copyWith =>
      _SortItemDTOCopyWithImpl(this as SortItemDTO, $identity, $identity);
  @override
  String toString() {
    return SortItemDTOMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SortItemDTOMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return SortItemDTOMapper._guard((c) => c.hash(this));
  }
}

extension SortItemDTOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SortItemDTO, $Out> {
  SortItemDTOCopyWith<$R, SortItemDTO, $Out> get $asSortItemDTO =>
      $base.as((v, t, t2) => _SortItemDTOCopyWithImpl(v, t, t2));
}

abstract class SortItemDTOCopyWith<$R, $In extends SortItemDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? productId, int? listNumber});
  SortItemDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SortItemDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SortItemDTO, $Out>
    implements SortItemDTOCopyWith<$R, SortItemDTO, $Out> {
  _SortItemDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SortItemDTO> $mapper =
      SortItemDTOMapper.ensureInitialized();
  @override
  $R call({String? productId, int? listNumber}) => $apply(FieldCopyWithData({
        if (productId != null) #productId: productId,
        if (listNumber != null) #listNumber: listNumber
      }));
  @override
  SortItemDTO $make(CopyWithData data) => SortItemDTO(
      productId: data.get(#productId, or: $value.productId),
      listNumber: data.get(#listNumber, or: $value.listNumber));

  @override
  SortItemDTOCopyWith<$R2, SortItemDTO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SortItemDTOCopyWithImpl($value, $cast, t);
}
