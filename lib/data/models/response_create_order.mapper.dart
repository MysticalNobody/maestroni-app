// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'response_create_order.dart';

class ResponseCreateOrderMapper extends ClassMapperBase<ResponseCreateOrder> {
  ResponseCreateOrderMapper._();

  static ResponseCreateOrderMapper? _instance;
  static ResponseCreateOrderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ResponseCreateOrderMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ResponseCreateOrder';

  static int _$systemOrderId(ResponseCreateOrder v) => v.systemOrderId;
  static const Field<ResponseCreateOrder, int> _f$systemOrderId =
      Field('systemOrderId', _$systemOrderId);
  static String _$status(ResponseCreateOrder v) => v.status;
  static const Field<ResponseCreateOrder, String> _f$status =
      Field('status', _$status);
  static String _$paymentTypeId(ResponseCreateOrder v) => v.paymentTypeId;
  static const Field<ResponseCreateOrder, String> _f$paymentTypeId =
      Field('paymentTypeId', _$paymentTypeId);

  @override
  final Map<Symbol, Field<ResponseCreateOrder, dynamic>> fields = const {
    #systemOrderId: _f$systemOrderId,
    #status: _f$status,
    #paymentTypeId: _f$paymentTypeId,
  };
  @override
  final bool ignoreNull = true;

  static ResponseCreateOrder _instantiate(DecodingData data) {
    return ResponseCreateOrder(
        systemOrderId: data.dec(_f$systemOrderId),
        status: data.dec(_f$status),
        paymentTypeId: data.dec(_f$paymentTypeId));
  }

  @override
  final Function instantiate = _instantiate;

  static ResponseCreateOrder fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ResponseCreateOrder>(map));
  }

  static ResponseCreateOrder fromJson(String json) {
    return _guard((c) => c.fromJson<ResponseCreateOrder>(json));
  }
}

mixin ResponseCreateOrderMappable {
  String toJson() {
    return ResponseCreateOrderMapper._guard(
        (c) => c.toJson(this as ResponseCreateOrder));
  }

  Map<String, dynamic> toMap() {
    return ResponseCreateOrderMapper._guard(
        (c) => c.toMap(this as ResponseCreateOrder));
  }

  ResponseCreateOrderCopyWith<ResponseCreateOrder, ResponseCreateOrder,
          ResponseCreateOrder>
      get copyWith => _ResponseCreateOrderCopyWithImpl(
          this as ResponseCreateOrder, $identity, $identity);
  @override
  String toString() {
    return ResponseCreateOrderMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ResponseCreateOrderMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ResponseCreateOrderMapper._guard((c) => c.hash(this));
  }
}

extension ResponseCreateOrderValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ResponseCreateOrder, $Out> {
  ResponseCreateOrderCopyWith<$R, ResponseCreateOrder, $Out>
      get $asResponseCreateOrder =>
          $base.as((v, t, t2) => _ResponseCreateOrderCopyWithImpl(v, t, t2));
}

abstract class ResponseCreateOrderCopyWith<$R, $In extends ResponseCreateOrder,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? systemOrderId, String? status, String? paymentTypeId});
  ResponseCreateOrderCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ResponseCreateOrderCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ResponseCreateOrder, $Out>
    implements ResponseCreateOrderCopyWith<$R, ResponseCreateOrder, $Out> {
  _ResponseCreateOrderCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ResponseCreateOrder> $mapper =
      ResponseCreateOrderMapper.ensureInitialized();
  @override
  $R call({int? systemOrderId, String? status, String? paymentTypeId}) =>
      $apply(FieldCopyWithData({
        if (systemOrderId != null) #systemOrderId: systemOrderId,
        if (status != null) #status: status,
        if (paymentTypeId != null) #paymentTypeId: paymentTypeId
      }));
  @override
  ResponseCreateOrder $make(CopyWithData data) => ResponseCreateOrder(
      systemOrderId: data.get(#systemOrderId, or: $value.systemOrderId),
      status: data.get(#status, or: $value.status),
      paymentTypeId: data.get(#paymentTypeId, or: $value.paymentTypeId));

  @override
  ResponseCreateOrderCopyWith<$R2, ResponseCreateOrder, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ResponseCreateOrderCopyWithImpl($value, $cast, t);
}
