// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'resp_order_data.dart';

class RespOrderDataMapper extends ClassMapperBase<RespOrderData> {
  RespOrderDataMapper._();

  static RespOrderDataMapper? _instance;
  static RespOrderDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RespOrderDataMapper._());
      ResponseCreateOrderMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'RespOrderData';

  static ResponseCreateOrder _$data(RespOrderData v) => v.data;
  static const Field<RespOrderData, ResponseCreateOrder> _f$data =
      Field('data', _$data);

  @override
  final Map<Symbol, Field<RespOrderData, dynamic>> fields = const {
    #data: _f$data,
  };
  @override
  final bool ignoreNull = true;

  static RespOrderData _instantiate(DecodingData data) {
    return RespOrderData(data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static RespOrderData fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<RespOrderData>(map));
  }

  static RespOrderData fromJson(String json) {
    return _guard((c) => c.fromJson<RespOrderData>(json));
  }
}

mixin RespOrderDataMappable {
  String toJson() {
    return RespOrderDataMapper._guard((c) => c.toJson(this as RespOrderData));
  }

  Map<String, dynamic> toMap() {
    return RespOrderDataMapper._guard((c) => c.toMap(this as RespOrderData));
  }

  RespOrderDataCopyWith<RespOrderData, RespOrderData, RespOrderData>
      get copyWith => _RespOrderDataCopyWithImpl(
          this as RespOrderData, $identity, $identity);
  @override
  String toString() {
    return RespOrderDataMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            RespOrderDataMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return RespOrderDataMapper._guard((c) => c.hash(this));
  }
}

extension RespOrderDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RespOrderData, $Out> {
  RespOrderDataCopyWith<$R, RespOrderData, $Out> get $asRespOrderData =>
      $base.as((v, t, t2) => _RespOrderDataCopyWithImpl(v, t, t2));
}

abstract class RespOrderDataCopyWith<$R, $In extends RespOrderData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ResponseCreateOrderCopyWith<$R, ResponseCreateOrder, ResponseCreateOrder>
      get data;
  $R call({ResponseCreateOrder? data});
  RespOrderDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RespOrderDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RespOrderData, $Out>
    implements RespOrderDataCopyWith<$R, RespOrderData, $Out> {
  _RespOrderDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RespOrderData> $mapper =
      RespOrderDataMapper.ensureInitialized();
  @override
  ResponseCreateOrderCopyWith<$R, ResponseCreateOrder, ResponseCreateOrder>
      get data => $value.data.copyWith.$chain((v) => call(data: v));
  @override
  $R call({ResponseCreateOrder? data}) =>
      $apply(FieldCopyWithData({if (data != null) #data: data}));
  @override
  RespOrderData $make(CopyWithData data) =>
      RespOrderData(data: data.get(#data, or: $value.data));

  @override
  RespOrderDataCopyWith<$R2, RespOrderData, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RespOrderDataCopyWithImpl($value, $cast, t);
}
