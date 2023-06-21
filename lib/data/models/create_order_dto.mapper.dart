// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'create_order_dto.dart';

class CreateOrderDTOMapper extends ClassMapperBase<CreateOrderDTO> {
  CreateOrderDTOMapper._();

  static CreateOrderDTOMapper? _instance;
  static CreateOrderDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CreateOrderDTOMapper._());
      DishDTOMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'CreateOrderDTO';

  static List<DishDTO> _$dishList(CreateOrderDTO v) => v.dishList;
  static const Field<CreateOrderDTO, List<DishDTO>> _f$dishList =
      Field('dishList', _$dishList);
  static String _$expeditionType(CreateOrderDTO v) => v.expeditionType;
  static const Field<CreateOrderDTO, String> _f$expeditionType =
      Field('expeditionType', _$expeditionType);
  static bool? _$soonest(CreateOrderDTO v) => v.soonest;
  static const Field<CreateOrderDTO, bool> _f$soonest =
      Field('soonest', _$soonest);
  static String _$paymentTypeId(CreateOrderDTO v) => v.paymentTypeId;
  static const Field<CreateOrderDTO, String> _f$paymentTypeId =
      Field('paymentTypeId', _$paymentTypeId);
  static String? _$changeFrom(CreateOrderDTO v) => v.changeFrom;
  static const Field<CreateOrderDTO, String> _f$changeFrom =
      Field('changeFrom', _$changeFrom);
  static String? _$addressId(CreateOrderDTO v) => v.addressId;
  static const Field<CreateOrderDTO, String> _f$addressId =
      Field('addressId', _$addressId);
  static String? _$comment(CreateOrderDTO v) => v.comment;
  static const Field<CreateOrderDTO, String> _f$comment =
      Field('comment', _$comment);
  static double? _$persons(CreateOrderDTO v) => v.persons;
  static const Field<CreateOrderDTO, double> _f$persons =
      Field('persons', _$persons);
  static String? _$restaurantId(CreateOrderDTO v) => v.restaurantId;
  static const Field<CreateOrderDTO, String> _f$restaurantId =
      Field('restaurantId', _$restaurantId);
  static String? _$expectedAt(CreateOrderDTO v) => v.expectedAt;
  static const Field<CreateOrderDTO, String> _f$expectedAt =
      Field('expectedAt', _$expectedAt);

  @override
  final Map<Symbol, Field<CreateOrderDTO, dynamic>> fields = const {
    #dishList: _f$dishList,
    #expeditionType: _f$expeditionType,
    #soonest: _f$soonest,
    #paymentTypeId: _f$paymentTypeId,
    #changeFrom: _f$changeFrom,
    #addressId: _f$addressId,
    #comment: _f$comment,
    #persons: _f$persons,
    #restaurantId: _f$restaurantId,
    #expectedAt: _f$expectedAt,
  };
  @override
  final bool ignoreNull = true;

  static CreateOrderDTO _instantiate(DecodingData data) {
    return CreateOrderDTO(
        dishList: data.dec(_f$dishList),
        expeditionType: data.dec(_f$expeditionType),
        soonest: data.dec(_f$soonest),
        paymentTypeId: data.dec(_f$paymentTypeId),
        changeFrom: data.dec(_f$changeFrom),
        addressId: data.dec(_f$addressId),
        comment: data.dec(_f$comment),
        persons: data.dec(_f$persons),
        restaurantId: data.dec(_f$restaurantId),
        expectedAt: data.dec(_f$expectedAt));
  }

  @override
  final Function instantiate = _instantiate;

  static CreateOrderDTO fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<CreateOrderDTO>(map));
  }

  static CreateOrderDTO fromJson(String json) {
    return _guard((c) => c.fromJson<CreateOrderDTO>(json));
  }
}

mixin CreateOrderDTOMappable {
  String toJson() {
    return CreateOrderDTOMapper._guard((c) => c.toJson(this as CreateOrderDTO));
  }

  Map<String, dynamic> toMap() {
    return CreateOrderDTOMapper._guard((c) => c.toMap(this as CreateOrderDTO));
  }

  CreateOrderDTOCopyWith<CreateOrderDTO, CreateOrderDTO, CreateOrderDTO>
      get copyWith => _CreateOrderDTOCopyWithImpl(
          this as CreateOrderDTO, $identity, $identity);
  @override
  String toString() {
    return CreateOrderDTOMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CreateOrderDTOMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return CreateOrderDTOMapper._guard((c) => c.hash(this));
  }
}

extension CreateOrderDTOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreateOrderDTO, $Out> {
  CreateOrderDTOCopyWith<$R, CreateOrderDTO, $Out> get $asCreateOrderDTO =>
      $base.as((v, t, t2) => _CreateOrderDTOCopyWithImpl(v, t, t2));
}

abstract class CreateOrderDTOCopyWith<$R, $In extends CreateOrderDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, DishDTO, DishDTOCopyWith<$R, DishDTO, DishDTO>> get dishList;
  $R call(
      {List<DishDTO>? dishList,
      String? expeditionType,
      bool? soonest,
      String? paymentTypeId,
      String? changeFrom,
      String? addressId,
      String? comment,
      double? persons,
      String? restaurantId,
      String? expectedAt});
  CreateOrderDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CreateOrderDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreateOrderDTO, $Out>
    implements CreateOrderDTOCopyWith<$R, CreateOrderDTO, $Out> {
  _CreateOrderDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreateOrderDTO> $mapper =
      CreateOrderDTOMapper.ensureInitialized();
  @override
  ListCopyWith<$R, DishDTO, DishDTOCopyWith<$R, DishDTO, DishDTO>>
      get dishList => ListCopyWith($value.dishList,
          (v, t) => v.copyWith.$chain(t), (v) => call(dishList: v));
  @override
  $R call(
          {List<DishDTO>? dishList,
          String? expeditionType,
          Object? soonest = $none,
          String? paymentTypeId,
          Object? changeFrom = $none,
          Object? addressId = $none,
          Object? comment = $none,
          Object? persons = $none,
          Object? restaurantId = $none,
          Object? expectedAt = $none}) =>
      $apply(FieldCopyWithData({
        if (dishList != null) #dishList: dishList,
        if (expeditionType != null) #expeditionType: expeditionType,
        if (soonest != $none) #soonest: soonest,
        if (paymentTypeId != null) #paymentTypeId: paymentTypeId,
        if (changeFrom != $none) #changeFrom: changeFrom,
        if (addressId != $none) #addressId: addressId,
        if (comment != $none) #comment: comment,
        if (persons != $none) #persons: persons,
        if (restaurantId != $none) #restaurantId: restaurantId,
        if (expectedAt != $none) #expectedAt: expectedAt
      }));
  @override
  CreateOrderDTO $make(CopyWithData data) => CreateOrderDTO(
      dishList: data.get(#dishList, or: $value.dishList),
      expeditionType: data.get(#expeditionType, or: $value.expeditionType),
      soonest: data.get(#soonest, or: $value.soonest),
      paymentTypeId: data.get(#paymentTypeId, or: $value.paymentTypeId),
      changeFrom: data.get(#changeFrom, or: $value.changeFrom),
      addressId: data.get(#addressId, or: $value.addressId),
      comment: data.get(#comment, or: $value.comment),
      persons: data.get(#persons, or: $value.persons),
      restaurantId: data.get(#restaurantId, or: $value.restaurantId),
      expectedAt: data.get(#expectedAt, or: $value.expectedAt));

  @override
  CreateOrderDTOCopyWith<$R2, CreateOrderDTO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CreateOrderDTOCopyWithImpl($value, $cast, t);
}
