// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'sort_category_dto.dart';

class SortCategoryDTOMapper extends ClassMapperBase<SortCategoryDTO> {
  SortCategoryDTOMapper._();

  static SortCategoryDTOMapper? _instance;
  static SortCategoryDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SortCategoryDTOMapper._());
      SortItemDTOMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'SortCategoryDTO';

  static String _$categoryId(SortCategoryDTO v) => v.categoryId;
  static const Field<SortCategoryDTO, String> _f$categoryId =
      Field('categoryId', _$categoryId);
  static int _$listNumber(SortCategoryDTO v) => v.listNumber;
  static const Field<SortCategoryDTO, int> _f$listNumber =
      Field('listNumber', _$listNumber);
  static List<SortItemDTO> _$productsSortList(SortCategoryDTO v) =>
      v.productsSortList;
  static const Field<SortCategoryDTO, List<SortItemDTO>> _f$productsSortList =
      Field('productsSortList', _$productsSortList);

  @override
  final Map<Symbol, Field<SortCategoryDTO, dynamic>> fields = const {
    #categoryId: _f$categoryId,
    #listNumber: _f$listNumber,
    #productsSortList: _f$productsSortList,
  };
  @override
  final bool ignoreNull = true;

  static SortCategoryDTO _instantiate(DecodingData data) {
    return SortCategoryDTO(
        categoryId: data.dec(_f$categoryId),
        listNumber: data.dec(_f$listNumber),
        productsSortList: data.dec(_f$productsSortList));
  }

  @override
  final Function instantiate = _instantiate;

  static SortCategoryDTO fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SortCategoryDTO>(map));
  }

  static SortCategoryDTO fromJson(String json) {
    return _guard((c) => c.fromJson<SortCategoryDTO>(json));
  }
}

mixin SortCategoryDTOMappable {
  String toJson() {
    return SortCategoryDTOMapper._guard(
        (c) => c.toJson(this as SortCategoryDTO));
  }

  Map<String, dynamic> toMap() {
    return SortCategoryDTOMapper._guard(
        (c) => c.toMap(this as SortCategoryDTO));
  }

  SortCategoryDTOCopyWith<SortCategoryDTO, SortCategoryDTO, SortCategoryDTO>
      get copyWith => _SortCategoryDTOCopyWithImpl(
          this as SortCategoryDTO, $identity, $identity);
  @override
  String toString() {
    return SortCategoryDTOMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SortCategoryDTOMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return SortCategoryDTOMapper._guard((c) => c.hash(this));
  }
}

extension SortCategoryDTOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SortCategoryDTO, $Out> {
  SortCategoryDTOCopyWith<$R, SortCategoryDTO, $Out> get $asSortCategoryDTO =>
      $base.as((v, t, t2) => _SortCategoryDTOCopyWithImpl(v, t, t2));
}

abstract class SortCategoryDTOCopyWith<$R, $In extends SortCategoryDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, SortItemDTO,
      SortItemDTOCopyWith<$R, SortItemDTO, SortItemDTO>> get productsSortList;
  $R call(
      {String? categoryId,
      int? listNumber,
      List<SortItemDTO>? productsSortList});
  SortCategoryDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SortCategoryDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SortCategoryDTO, $Out>
    implements SortCategoryDTOCopyWith<$R, SortCategoryDTO, $Out> {
  _SortCategoryDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SortCategoryDTO> $mapper =
      SortCategoryDTOMapper.ensureInitialized();
  @override
  ListCopyWith<$R, SortItemDTO,
          SortItemDTOCopyWith<$R, SortItemDTO, SortItemDTO>>
      get productsSortList => ListCopyWith($value.productsSortList,
          (v, t) => v.copyWith.$chain(t), (v) => call(productsSortList: v));
  @override
  $R call(
          {String? categoryId,
          int? listNumber,
          List<SortItemDTO>? productsSortList}) =>
      $apply(FieldCopyWithData({
        if (categoryId != null) #categoryId: categoryId,
        if (listNumber != null) #listNumber: listNumber,
        if (productsSortList != null) #productsSortList: productsSortList
      }));
  @override
  SortCategoryDTO $make(CopyWithData data) => SortCategoryDTO(
      categoryId: data.get(#categoryId, or: $value.categoryId),
      listNumber: data.get(#listNumber, or: $value.listNumber),
      productsSortList:
          data.get(#productsSortList, or: $value.productsSortList));

  @override
  SortCategoryDTOCopyWith<$R2, SortCategoryDTO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SortCategoryDTOCopyWithImpl($value, $cast, t);
}
