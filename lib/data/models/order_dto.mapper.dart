// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'order_dto.dart';

class OrderDTOMapper extends ClassMapperBase<OrderDTO> {
  OrderDTOMapper._();

  static OrderDTOMapper? _instance;
  static OrderDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OrderDTOMapper._());
      ShortAddressMapper.ensureInitialized();
      DishDTOMapper.ensureInitialized();
      ROrderRespMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'OrderDTO';

  static String _$id(OrderDTO v) => v.id;
  static const Field<OrderDTO, String> _f$id = Field('id', _$id);
  static ShortAddress? _$address(OrderDTO v) => v.address;
  static const Field<OrderDTO, ShortAddress> _f$address =
      Field('address', _$address);
  static String _$comment(OrderDTO v) => v.comment;
  static const Field<OrderDTO, String> _f$comment = Field('comment', _$comment);
  static List<DishDTO> _$dishList(OrderDTO v) => v.dishList;
  static const Field<OrderDTO, List<DishDTO>> _f$dishList =
      Field('dishList', _$dishList);
  static String _$expeditionType(OrderDTO v) => v.expeditionType;
  static const Field<OrderDTO, String> _f$expeditionType =
      Field('expeditionType', _$expeditionType);
  static ROrderResp _$orderResponse(OrderDTO v) => v.orderResponse;
  static const Field<OrderDTO, ROrderResp> _f$orderResponse =
      Field('orderResponse', _$orderResponse);
  static String _$paymentTypeId(OrderDTO v) => v.paymentTypeId;
  static const Field<OrderDTO, String> _f$paymentTypeId =
      Field('paymentTypeId', _$paymentTypeId);
  static String _$restaurantId(OrderDTO v) => v.restaurantId;
  static const Field<OrderDTO, String> _f$restaurantId =
      Field('restaurantId', _$restaurantId);
  static int _$systemOrderId(OrderDTO v) => v.systemOrderId;
  static const Field<OrderDTO, int> _f$systemOrderId =
      Field('systemOrderId', _$systemOrderId);
  static String _$orderStatusName(OrderDTO v) => v.orderStatusName;
  static const Field<OrderDTO, String> _f$orderStatusName =
      Field('orderStatusName', _$orderStatusName);
  static DateTime _$createdDate(OrderDTO v) => v.createdDate;
  static const Field<OrderDTO, DateTime> _f$createdDate =
      Field('createdDate', _$createdDate);

  @override
  final Map<Symbol, Field<OrderDTO, dynamic>> fields = const {
    #id: _f$id,
    #address: _f$address,
    #comment: _f$comment,
    #dishList: _f$dishList,
    #expeditionType: _f$expeditionType,
    #orderResponse: _f$orderResponse,
    #paymentTypeId: _f$paymentTypeId,
    #restaurantId: _f$restaurantId,
    #systemOrderId: _f$systemOrderId,
    #orderStatusName: _f$orderStatusName,
    #createdDate: _f$createdDate,
  };
  @override
  final bool ignoreNull = true;

  static OrderDTO _instantiate(DecodingData data) {
    return OrderDTO(
        id: data.dec(_f$id),
        address: data.dec(_f$address),
        comment: data.dec(_f$comment),
        dishList: data.dec(_f$dishList),
        expeditionType: data.dec(_f$expeditionType),
        orderResponse: data.dec(_f$orderResponse),
        paymentTypeId: data.dec(_f$paymentTypeId),
        restaurantId: data.dec(_f$restaurantId),
        systemOrderId: data.dec(_f$systemOrderId),
        orderStatusName: data.dec(_f$orderStatusName),
        createdDate: data.dec(_f$createdDate));
  }

  @override
  final Function instantiate = _instantiate;

  static OrderDTO fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<OrderDTO>(map));
  }

  static OrderDTO fromJson(String json) {
    return _guard((c) => c.fromJson<OrderDTO>(json));
  }
}

mixin OrderDTOMappable {
  String toJson() {
    return OrderDTOMapper._guard((c) => c.toJson(this as OrderDTO));
  }

  Map<String, dynamic> toMap() {
    return OrderDTOMapper._guard((c) => c.toMap(this as OrderDTO));
  }

  OrderDTOCopyWith<OrderDTO, OrderDTO, OrderDTO> get copyWith =>
      _OrderDTOCopyWithImpl(this as OrderDTO, $identity, $identity);
  @override
  String toString() {
    return OrderDTOMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            OrderDTOMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return OrderDTOMapper._guard((c) => c.hash(this));
  }
}

extension OrderDTOValueCopy<$R, $Out> on ObjectCopyWith<$R, OrderDTO, $Out> {
  OrderDTOCopyWith<$R, OrderDTO, $Out> get $asOrderDTO =>
      $base.as((v, t, t2) => _OrderDTOCopyWithImpl(v, t, t2));
}

abstract class OrderDTOCopyWith<$R, $In extends OrderDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ShortAddressCopyWith<$R, ShortAddress, ShortAddress>? get address;
  ListCopyWith<$R, DishDTO, DishDTOCopyWith<$R, DishDTO, DishDTO>> get dishList;
  ROrderRespCopyWith<$R, ROrderResp, ROrderResp> get orderResponse;
  $R call(
      {String? id,
      ShortAddress? address,
      String? comment,
      List<DishDTO>? dishList,
      String? expeditionType,
      ROrderResp? orderResponse,
      String? paymentTypeId,
      String? restaurantId,
      int? systemOrderId,
      String? orderStatusName,
      DateTime? createdDate});
  OrderDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OrderDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OrderDTO, $Out>
    implements OrderDTOCopyWith<$R, OrderDTO, $Out> {
  _OrderDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OrderDTO> $mapper =
      OrderDTOMapper.ensureInitialized();
  @override
  ShortAddressCopyWith<$R, ShortAddress, ShortAddress>? get address =>
      $value.address?.copyWith.$chain((v) => call(address: v));
  @override
  ListCopyWith<$R, DishDTO, DishDTOCopyWith<$R, DishDTO, DishDTO>>
      get dishList => ListCopyWith($value.dishList,
          (v, t) => v.copyWith.$chain(t), (v) => call(dishList: v));
  @override
  ROrderRespCopyWith<$R, ROrderResp, ROrderResp> get orderResponse =>
      $value.orderResponse.copyWith.$chain((v) => call(orderResponse: v));
  @override
  $R call(
          {String? id,
          Object? address = $none,
          String? comment,
          List<DishDTO>? dishList,
          String? expeditionType,
          ROrderResp? orderResponse,
          String? paymentTypeId,
          String? restaurantId,
          int? systemOrderId,
          String? orderStatusName,
          DateTime? createdDate}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (address != $none) #address: address,
        if (comment != null) #comment: comment,
        if (dishList != null) #dishList: dishList,
        if (expeditionType != null) #expeditionType: expeditionType,
        if (orderResponse != null) #orderResponse: orderResponse,
        if (paymentTypeId != null) #paymentTypeId: paymentTypeId,
        if (restaurantId != null) #restaurantId: restaurantId,
        if (systemOrderId != null) #systemOrderId: systemOrderId,
        if (orderStatusName != null) #orderStatusName: orderStatusName,
        if (createdDate != null) #createdDate: createdDate
      }));
  @override
  OrderDTO $make(CopyWithData data) => OrderDTO(
      id: data.get(#id, or: $value.id),
      address: data.get(#address, or: $value.address),
      comment: data.get(#comment, or: $value.comment),
      dishList: data.get(#dishList, or: $value.dishList),
      expeditionType: data.get(#expeditionType, or: $value.expeditionType),
      orderResponse: data.get(#orderResponse, or: $value.orderResponse),
      paymentTypeId: data.get(#paymentTypeId, or: $value.paymentTypeId),
      restaurantId: data.get(#restaurantId, or: $value.restaurantId),
      systemOrderId: data.get(#systemOrderId, or: $value.systemOrderId),
      orderStatusName: data.get(#orderStatusName, or: $value.orderStatusName),
      createdDate: data.get(#createdDate, or: $value.createdDate));

  @override
  OrderDTOCopyWith<$R2, OrderDTO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OrderDTOCopyWithImpl($value, $cast, t);
}
