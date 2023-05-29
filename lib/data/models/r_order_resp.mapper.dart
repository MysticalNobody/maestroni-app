// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'r_order_resp.dart';

class ROrderRespMapper extends ClassMapperBase<ROrderResp> {
  ROrderRespMapper._();

  static ROrderRespMapper? _instance;
  static ROrderRespMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ROrderRespMapper._());
      RRestaurantMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ROrderResp';

  static String? _$orderId(ROrderResp v) => v.orderId;
  static const Field<ROrderResp, String> _f$orderId =
      Field('orderId', _$orderId);
  static RRestaurant? _$restaurant(ROrderResp v) => v.restaurant;
  static const Field<ROrderResp, RRestaurant> _f$restaurant =
      Field('restaurant', _$restaurant);
  static String? _$onlinePayUrl(ROrderResp v) => v.onlinePayUrl;
  static const Field<ROrderResp, String> _f$onlinePayUrl =
      Field('onlinePayUrl', _$onlinePayUrl);

  @override
  final Map<Symbol, Field<ROrderResp, dynamic>> fields = const {
    #orderId: _f$orderId,
    #restaurant: _f$restaurant,
    #onlinePayUrl: _f$onlinePayUrl,
  };
  @override
  final bool ignoreNull = true;

  static ROrderResp _instantiate(DecodingData data) {
    return ROrderResp(
        orderId: data.dec(_f$orderId),
        restaurant: data.dec(_f$restaurant),
        onlinePayUrl: data.dec(_f$onlinePayUrl));
  }

  @override
  final Function instantiate = _instantiate;

  static ROrderResp fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ROrderResp>(map));
  }

  static ROrderResp fromJson(String json) {
    return _guard((c) => c.fromJson<ROrderResp>(json));
  }
}

mixin ROrderRespMappable {
  String toJson() {
    return ROrderRespMapper._guard((c) => c.toJson(this as ROrderResp));
  }

  Map<String, dynamic> toMap() {
    return ROrderRespMapper._guard((c) => c.toMap(this as ROrderResp));
  }

  ROrderRespCopyWith<ROrderResp, ROrderResp, ROrderResp> get copyWith =>
      _ROrderRespCopyWithImpl(this as ROrderResp, $identity, $identity);
  @override
  String toString() {
    return ROrderRespMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ROrderRespMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ROrderRespMapper._guard((c) => c.hash(this));
  }
}

extension ROrderRespValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ROrderResp, $Out> {
  ROrderRespCopyWith<$R, ROrderResp, $Out> get $asROrderResp =>
      $base.as((v, t, t2) => _ROrderRespCopyWithImpl(v, t, t2));
}

abstract class ROrderRespCopyWith<$R, $In extends ROrderResp, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  RRestaurantCopyWith<$R, RRestaurant, RRestaurant>? get restaurant;
  $R call({String? orderId, RRestaurant? restaurant, String? onlinePayUrl});
  ROrderRespCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ROrderRespCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ROrderResp, $Out>
    implements ROrderRespCopyWith<$R, ROrderResp, $Out> {
  _ROrderRespCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ROrderResp> $mapper =
      ROrderRespMapper.ensureInitialized();
  @override
  RRestaurantCopyWith<$R, RRestaurant, RRestaurant>? get restaurant =>
      $value.restaurant?.copyWith.$chain((v) => call(restaurant: v));
  @override
  $R call(
          {Object? orderId = $none,
          Object? restaurant = $none,
          Object? onlinePayUrl = $none}) =>
      $apply(FieldCopyWithData({
        if (orderId != $none) #orderId: orderId,
        if (restaurant != $none) #restaurant: restaurant,
        if (onlinePayUrl != $none) #onlinePayUrl: onlinePayUrl
      }));
  @override
  ROrderResp $make(CopyWithData data) => ROrderResp(
      orderId: data.get(#orderId, or: $value.orderId),
      restaurant: data.get(#restaurant, or: $value.restaurant),
      onlinePayUrl: data.get(#onlinePayUrl, or: $value.onlinePayUrl));

  @override
  ROrderRespCopyWith<$R2, ROrderResp, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ROrderRespCopyWithImpl($value, $cast, t);
}
