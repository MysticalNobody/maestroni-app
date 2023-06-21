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
      AddressDTOMapper.ensureInitialized();
      DishDTOMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'OrderDTO';

  static int _$persons(OrderDTO v) => v.persons;
  static const Field<OrderDTO, int> _f$persons = Field('persons', _$persons);
  static String _$paymentStatus(OrderDTO v) => v.paymentStatus;
  static const Field<OrderDTO, String> _f$paymentStatus =
      Field('paymentStatus', _$paymentStatus);
  static String _$orderId(OrderDTO v) => v.orderId;
  static const Field<OrderDTO, String> _f$orderId = Field('orderId', _$orderId);
  static AddressDTO? _$address(OrderDTO v) => v.address;
  static const Field<OrderDTO, AddressDTO> _f$address =
      Field('address', _$address);
  static String _$comment(OrderDTO v) => v.comment;
  static const Field<OrderDTO, String> _f$comment = Field('comment', _$comment);
  static List<DishDTO> _$products(OrderDTO v) => v.products;
  static const Field<OrderDTO, List<DishDTO>> _f$products =
      Field('products', _$products);
  static String _$expeditionType(OrderDTO v) => v.expeditionType;
  static const Field<OrderDTO, String> _f$expeditionType =
      Field('expeditionType', _$expeditionType);
  static String _$paymentTypeId(OrderDTO v) => v.paymentTypeId;
  static const Field<OrderDTO, String> _f$paymentTypeId =
      Field('paymentTypeId', _$paymentTypeId);
  static String _$orderStatusName(OrderDTO v) => v.orderStatusName;
  static const Field<OrderDTO, String> _f$orderStatusName =
      Field('orderStatusName', _$orderStatusName);
  static String? _$restAddress(OrderDTO v) => v.restAddress;
  static const Field<OrderDTO, String> _f$restAddress =
      Field('restAddress', _$restAddress);
  static DateTime _$createdDate(OrderDTO v) => v.createdDate;
  static const Field<OrderDTO, DateTime> _f$createdDate =
      Field('createdDate', _$createdDate);

  @override
  final Map<Symbol, Field<OrderDTO, dynamic>> fields = const {
    #persons: _f$persons,
    #paymentStatus: _f$paymentStatus,
    #orderId: _f$orderId,
    #address: _f$address,
    #comment: _f$comment,
    #products: _f$products,
    #expeditionType: _f$expeditionType,
    #paymentTypeId: _f$paymentTypeId,
    #orderStatusName: _f$orderStatusName,
    #restAddress: _f$restAddress,
    #createdDate: _f$createdDate,
  };
  @override
  final bool ignoreNull = true;

  static OrderDTO _instantiate(DecodingData data) {
    return OrderDTO(
        persons: data.dec(_f$persons),
        paymentStatus: data.dec(_f$paymentStatus),
        orderId: data.dec(_f$orderId),
        address: data.dec(_f$address),
        comment: data.dec(_f$comment),
        products: data.dec(_f$products),
        expeditionType: data.dec(_f$expeditionType),
        paymentTypeId: data.dec(_f$paymentTypeId),
        orderStatusName: data.dec(_f$orderStatusName),
        restAddress: data.dec(_f$restAddress),
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
  AddressDTOCopyWith<$R, AddressDTO, AddressDTO>? get address;
  ListCopyWith<$R, DishDTO, DishDTOCopyWith<$R, DishDTO, DishDTO>> get products;
  $R call(
      {int? persons,
      String? paymentStatus,
      String? orderId,
      AddressDTO? address,
      String? comment,
      List<DishDTO>? products,
      String? expeditionType,
      String? paymentTypeId,
      String? orderStatusName,
      String? restAddress,
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
  AddressDTOCopyWith<$R, AddressDTO, AddressDTO>? get address =>
      $value.address?.copyWith.$chain((v) => call(address: v));
  @override
  ListCopyWith<$R, DishDTO, DishDTOCopyWith<$R, DishDTO, DishDTO>>
      get products => ListCopyWith($value.products,
          (v, t) => v.copyWith.$chain(t), (v) => call(products: v));
  @override
  $R call(
          {int? persons,
          String? paymentStatus,
          String? orderId,
          Object? address = $none,
          String? comment,
          List<DishDTO>? products,
          String? expeditionType,
          String? paymentTypeId,
          String? orderStatusName,
          Object? restAddress = $none,
          DateTime? createdDate}) =>
      $apply(FieldCopyWithData({
        if (persons != null) #persons: persons,
        if (paymentStatus != null) #paymentStatus: paymentStatus,
        if (orderId != null) #orderId: orderId,
        if (address != $none) #address: address,
        if (comment != null) #comment: comment,
        if (products != null) #products: products,
        if (expeditionType != null) #expeditionType: expeditionType,
        if (paymentTypeId != null) #paymentTypeId: paymentTypeId,
        if (orderStatusName != null) #orderStatusName: orderStatusName,
        if (restAddress != $none) #restAddress: restAddress,
        if (createdDate != null) #createdDate: createdDate
      }));
  @override
  OrderDTO $make(CopyWithData data) => OrderDTO(
      persons: data.get(#persons, or: $value.persons),
      paymentStatus: data.get(#paymentStatus, or: $value.paymentStatus),
      orderId: data.get(#orderId, or: $value.orderId),
      address: data.get(#address, or: $value.address),
      comment: data.get(#comment, or: $value.comment),
      products: data.get(#products, or: $value.products),
      expeditionType: data.get(#expeditionType, or: $value.expeditionType),
      paymentTypeId: data.get(#paymentTypeId, or: $value.paymentTypeId),
      orderStatusName: data.get(#orderStatusName, or: $value.orderStatusName),
      restAddress: data.get(#restAddress, or: $value.restAddress),
      createdDate: data.get(#createdDate, or: $value.createdDate));

  @override
  OrderDTOCopyWith<$R2, OrderDTO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OrderDTOCopyWithImpl($value, $cast, t);
}
