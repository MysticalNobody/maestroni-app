// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'short_address.dart';

class ShortAddressMapper extends ClassMapperBase<ShortAddress> {
  ShortAddressMapper._();

  static ShortAddressMapper? _instance;
  static ShortAddressMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ShortAddressMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ShortAddress';

  static String? _$fullAddress(ShortAddress v) => v.fullAddress;
  static const Field<ShortAddress, String> _f$fullAddress =
      Field('fullAddress', _$fullAddress);

  @override
  final Map<Symbol, Field<ShortAddress, dynamic>> fields = const {
    #fullAddress: _f$fullAddress,
  };
  @override
  final bool ignoreNull = true;

  static ShortAddress _instantiate(DecodingData data) {
    return ShortAddress(fullAddress: data.dec(_f$fullAddress));
  }

  @override
  final Function instantiate = _instantiate;

  static ShortAddress fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ShortAddress>(map));
  }

  static ShortAddress fromJson(String json) {
    return _guard((c) => c.fromJson<ShortAddress>(json));
  }
}

mixin ShortAddressMappable {
  String toJson() {
    return ShortAddressMapper._guard((c) => c.toJson(this as ShortAddress));
  }

  Map<String, dynamic> toMap() {
    return ShortAddressMapper._guard((c) => c.toMap(this as ShortAddress));
  }

  ShortAddressCopyWith<ShortAddress, ShortAddress, ShortAddress> get copyWith =>
      _ShortAddressCopyWithImpl(this as ShortAddress, $identity, $identity);
  @override
  String toString() {
    return ShortAddressMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ShortAddressMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ShortAddressMapper._guard((c) => c.hash(this));
  }
}

extension ShortAddressValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ShortAddress, $Out> {
  ShortAddressCopyWith<$R, ShortAddress, $Out> get $asShortAddress =>
      $base.as((v, t, t2) => _ShortAddressCopyWithImpl(v, t, t2));
}

abstract class ShortAddressCopyWith<$R, $In extends ShortAddress, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? fullAddress});
  ShortAddressCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ShortAddressCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ShortAddress, $Out>
    implements ShortAddressCopyWith<$R, ShortAddress, $Out> {
  _ShortAddressCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ShortAddress> $mapper =
      ShortAddressMapper.ensureInitialized();
  @override
  $R call({Object? fullAddress = $none}) => $apply(
      FieldCopyWithData({if (fullAddress != $none) #fullAddress: fullAddress}));
  @override
  ShortAddress $make(CopyWithData data) =>
      ShortAddress(fullAddress: data.get(#fullAddress, or: $value.fullAddress));

  @override
  ShortAddressCopyWith<$R2, ShortAddress, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ShortAddressCopyWithImpl($value, $cast, t);
}
