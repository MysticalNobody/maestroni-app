// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'r_restaurant.dart';

class RRestaurantMapper extends ClassMapperBase<RRestaurant> {
  RRestaurantMapper._();

  static RRestaurantMapper? _instance;
  static RRestaurantMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RRestaurantMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'RRestaurant';

  static String _$address(RRestaurant v) => v.address;
  static const Field<RRestaurant, String> _f$address =
      Field('address', _$address);
  static String _$phone(RRestaurant v) => v.phone;
  static const Field<RRestaurant, String> _f$phone = Field('phone', _$phone);

  @override
  final Map<Symbol, Field<RRestaurant, dynamic>> fields = const {
    #address: _f$address,
    #phone: _f$phone,
  };
  @override
  final bool ignoreNull = true;

  static RRestaurant _instantiate(DecodingData data) {
    return RRestaurant(
        address: data.dec(_f$address), phone: data.dec(_f$phone));
  }

  @override
  final Function instantiate = _instantiate;

  static RRestaurant fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<RRestaurant>(map));
  }

  static RRestaurant fromJson(String json) {
    return _guard((c) => c.fromJson<RRestaurant>(json));
  }
}

mixin RRestaurantMappable {
  String toJson() {
    return RRestaurantMapper._guard((c) => c.toJson(this as RRestaurant));
  }

  Map<String, dynamic> toMap() {
    return RRestaurantMapper._guard((c) => c.toMap(this as RRestaurant));
  }

  RRestaurantCopyWith<RRestaurant, RRestaurant, RRestaurant> get copyWith =>
      _RRestaurantCopyWithImpl(this as RRestaurant, $identity, $identity);
  @override
  String toString() {
    return RRestaurantMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            RRestaurantMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return RRestaurantMapper._guard((c) => c.hash(this));
  }
}

extension RRestaurantValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RRestaurant, $Out> {
  RRestaurantCopyWith<$R, RRestaurant, $Out> get $asRRestaurant =>
      $base.as((v, t, t2) => _RRestaurantCopyWithImpl(v, t, t2));
}

abstract class RRestaurantCopyWith<$R, $In extends RRestaurant, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? address, String? phone});
  RRestaurantCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RRestaurantCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RRestaurant, $Out>
    implements RRestaurantCopyWith<$R, RRestaurant, $Out> {
  _RRestaurantCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RRestaurant> $mapper =
      RRestaurantMapper.ensureInitialized();
  @override
  $R call({String? address, String? phone}) => $apply(FieldCopyWithData({
        if (address != null) #address: address,
        if (phone != null) #phone: phone
      }));
  @override
  RRestaurant $make(CopyWithData data) => RRestaurant(
      address: data.get(#address, or: $value.address),
      phone: data.get(#phone, or: $value.phone));

  @override
  RRestaurantCopyWith<$R2, RRestaurant, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RRestaurantCopyWithImpl($value, $cast, t);
}
