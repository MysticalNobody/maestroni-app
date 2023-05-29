// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'login_request.dart';

class LoginRequestMapper extends ClassMapperBase<LoginRequest> {
  LoginRequestMapper._();

  static LoginRequestMapper? _instance;
  static LoginRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginRequestMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'LoginRequest';

  static String _$phoneNumber(LoginRequest v) => v.phoneNumber;
  static const Field<LoginRequest, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber);
  static String _$smsCode(LoginRequest v) => v.smsCode;
  static const Field<LoginRequest, String> _f$smsCode =
      Field('smsCode', _$smsCode);

  @override
  final Map<Symbol, Field<LoginRequest, dynamic>> fields = const {
    #phoneNumber: _f$phoneNumber,
    #smsCode: _f$smsCode,
  };
  @override
  final bool ignoreNull = true;

  static LoginRequest _instantiate(DecodingData data) {
    return LoginRequest(
        phoneNumber: data.dec(_f$phoneNumber), smsCode: data.dec(_f$smsCode));
  }

  @override
  final Function instantiate = _instantiate;

  static LoginRequest fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<LoginRequest>(map));
  }

  static LoginRequest fromJson(String json) {
    return _guard((c) => c.fromJson<LoginRequest>(json));
  }
}

mixin LoginRequestMappable {
  String toJson() {
    return LoginRequestMapper._guard((c) => c.toJson(this as LoginRequest));
  }

  Map<String, dynamic> toMap() {
    return LoginRequestMapper._guard((c) => c.toMap(this as LoginRequest));
  }

  LoginRequestCopyWith<LoginRequest, LoginRequest, LoginRequest> get copyWith =>
      _LoginRequestCopyWithImpl(this as LoginRequest, $identity, $identity);
  @override
  String toString() {
    return LoginRequestMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            LoginRequestMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return LoginRequestMapper._guard((c) => c.hash(this));
  }
}

extension LoginRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoginRequest, $Out> {
  LoginRequestCopyWith<$R, LoginRequest, $Out> get $asLoginRequest =>
      $base.as((v, t, t2) => _LoginRequestCopyWithImpl(v, t, t2));
}

abstract class LoginRequestCopyWith<$R, $In extends LoginRequest, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? phoneNumber, String? smsCode});
  LoginRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LoginRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoginRequest, $Out>
    implements LoginRequestCopyWith<$R, LoginRequest, $Out> {
  _LoginRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoginRequest> $mapper =
      LoginRequestMapper.ensureInitialized();
  @override
  $R call({String? phoneNumber, String? smsCode}) => $apply(FieldCopyWithData({
        if (phoneNumber != null) #phoneNumber: phoneNumber,
        if (smsCode != null) #smsCode: smsCode
      }));
  @override
  LoginRequest $make(CopyWithData data) => LoginRequest(
      phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
      smsCode: data.get(#smsCode, or: $value.smsCode));

  @override
  LoginRequestCopyWith<$R2, LoginRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LoginRequestCopyWithImpl($value, $cast, t);
}
