// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'sms_request.dart';

class SMSRequestMapper extends ClassMapperBase<SMSRequest> {
  SMSRequestMapper._();

  static SMSRequestMapper? _instance;
  static SMSRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SMSRequestMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'SMSRequest';

  static String _$phoneNumber(SMSRequest v) => v.phoneNumber;
  static const Field<SMSRequest, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber);

  @override
  final Map<Symbol, Field<SMSRequest, dynamic>> fields = const {
    #phoneNumber: _f$phoneNumber,
  };
  @override
  final bool ignoreNull = true;

  static SMSRequest _instantiate(DecodingData data) {
    return SMSRequest(phoneNumber: data.dec(_f$phoneNumber));
  }

  @override
  final Function instantiate = _instantiate;

  static SMSRequest fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SMSRequest>(map));
  }

  static SMSRequest fromJson(String json) {
    return _guard((c) => c.fromJson<SMSRequest>(json));
  }
}

mixin SMSRequestMappable {
  String toJson() {
    return SMSRequestMapper._guard((c) => c.toJson(this as SMSRequest));
  }

  Map<String, dynamic> toMap() {
    return SMSRequestMapper._guard((c) => c.toMap(this as SMSRequest));
  }

  SMSRequestCopyWith<SMSRequest, SMSRequest, SMSRequest> get copyWith =>
      _SMSRequestCopyWithImpl(this as SMSRequest, $identity, $identity);
  @override
  String toString() {
    return SMSRequestMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SMSRequestMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return SMSRequestMapper._guard((c) => c.hash(this));
  }
}

extension SMSRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SMSRequest, $Out> {
  SMSRequestCopyWith<$R, SMSRequest, $Out> get $asSMSRequest =>
      $base.as((v, t, t2) => _SMSRequestCopyWithImpl(v, t, t2));
}

abstract class SMSRequestCopyWith<$R, $In extends SMSRequest, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? phoneNumber});
  SMSRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SMSRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SMSRequest, $Out>
    implements SMSRequestCopyWith<$R, SMSRequest, $Out> {
  _SMSRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SMSRequest> $mapper =
      SMSRequestMapper.ensureInitialized();
  @override
  $R call({String? phoneNumber}) => $apply(
      FieldCopyWithData({if (phoneNumber != null) #phoneNumber: phoneNumber}));
  @override
  SMSRequest $make(CopyWithData data) =>
      SMSRequest(phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber));

  @override
  SMSRequestCopyWith<$R2, SMSRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SMSRequestCopyWithImpl($value, $cast, t);
}
