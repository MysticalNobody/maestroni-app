// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'login_request.dart';

class LoginRequestMapper extends MapperBase<LoginRequest> {
  static MapperContainer container = MapperContainer(
    mappers: {LoginRequestMapper()},
  );

  @override
  LoginRequestMapperElement createElement(MapperContainer container) {
    return LoginRequestMapperElement._(this, container);
  }

  @override
  String get id => 'LoginRequest';

  static final fromMap = container.fromMap<LoginRequest>;
  static final fromJson = container.fromJson<LoginRequest>;
}

class LoginRequestMapperElement extends MapperElementBase<LoginRequest> {
  LoginRequestMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  LoginRequest decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  LoginRequest fromMap(Map<String, dynamic> map) => LoginRequest(
      phoneNumber: container.$get(map, 'phoneNumber'),
      smsCode: container.$get(map, 'smsCode'));

  @override
  Function get encoder => encode;
  dynamic encode(LoginRequest v) => toMap(v);
  Map<String, dynamic> toMap(LoginRequest l) => {
        'phoneNumber': container.$enc(l.phoneNumber, 'phoneNumber'),
        'smsCode': container.$enc(l.smsCode, 'smsCode')
      };

  @override
  String stringify(LoginRequest self) =>
      'LoginRequest(phoneNumber: ${container.asString(self.phoneNumber)}, smsCode: ${container.asString(self.smsCode)})';
  @override
  int hash(LoginRequest self) =>
      container.hash(self.phoneNumber) ^ container.hash(self.smsCode);
  @override
  bool equals(LoginRequest self, LoginRequest other) =>
      container.isEqual(self.phoneNumber, other.phoneNumber) &&
      container.isEqual(self.smsCode, other.smsCode);
}

mixin LoginRequestMappable {
  String toJson() => LoginRequestMapper.container.toJson(this as LoginRequest);
  Map<String, dynamic> toMap() =>
      LoginRequestMapper.container.toMap(this as LoginRequest);
  LoginRequestCopyWith<LoginRequest, LoginRequest, LoginRequest> get copyWith =>
      _LoginRequestCopyWithImpl(this as LoginRequest, $identity, $identity);
  @override
  String toString() => LoginRequestMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          LoginRequestMapper.container.isEqual(this, other));
  @override
  int get hashCode => LoginRequestMapper.container.hash(this);
}

extension LoginRequestValueCopy<$R, $Out extends LoginRequest>
    on ObjectCopyWith<$R, LoginRequest, $Out> {
  LoginRequestCopyWith<$R, LoginRequest, $Out> get asLoginRequest =>
      base.as((v, t, t2) => _LoginRequestCopyWithImpl(v, t, t2));
}

typedef LoginRequestCopyWithBound = LoginRequest;

abstract class LoginRequestCopyWith<$R, $In extends LoginRequest,
    $Out extends LoginRequest> implements ObjectCopyWith<$R, $In, $Out> {
  LoginRequestCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends LoginRequest>(
      Then<LoginRequest, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? phoneNumber, String? smsCode});
}

class _LoginRequestCopyWithImpl<$R, $Out extends LoginRequest>
    extends CopyWithBase<$R, LoginRequest, $Out>
    implements LoginRequestCopyWith<$R, LoginRequest, $Out> {
  _LoginRequestCopyWithImpl(super.value, super.then, super.then2);
  @override
  LoginRequestCopyWith<$R2, LoginRequest, $Out2>
      chain<$R2, $Out2 extends LoginRequest>(
              Then<LoginRequest, $Out2> t, Then<$Out2, $R2> t2) =>
          _LoginRequestCopyWithImpl($value, t, t2);

  @override
  $R call({String? phoneNumber, String? smsCode}) => $then(LoginRequest(
      phoneNumber: phoneNumber ?? $value.phoneNumber,
      smsCode: smsCode ?? $value.smsCode));
}
