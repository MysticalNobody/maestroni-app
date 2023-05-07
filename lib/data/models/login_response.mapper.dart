// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'login_response.dart';

class LoginResponseMapper extends MapperBase<LoginResponse> {
  static MapperContainer container = MapperContainer(
    mappers: {LoginResponseMapper()},
  );

  @override
  LoginResponseMapperElement createElement(MapperContainer container) {
    return LoginResponseMapperElement._(this, container);
  }

  @override
  String get id => 'LoginResponse';

  static final fromMap = container.fromMap<LoginResponse>;
  static final fromJson = container.fromJson<LoginResponse>;
}

class LoginResponseMapperElement extends MapperElementBase<LoginResponse> {
  LoginResponseMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  LoginResponse decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  LoginResponse fromMap(Map<String, dynamic> map) =>
      LoginResponse(accessToken: container.$get(map, 'accessToken'));

  @override
  Function get encoder => encode;
  dynamic encode(LoginResponse v) => toMap(v);
  Map<String, dynamic> toMap(LoginResponse l) =>
      {'accessToken': container.$enc(l.accessToken, 'accessToken')};

  @override
  String stringify(LoginResponse self) =>
      'LoginResponse(accessToken: ${container.asString(self.accessToken)})';
  @override
  int hash(LoginResponse self) => container.hash(self.accessToken);
  @override
  bool equals(LoginResponse self, LoginResponse other) =>
      container.isEqual(self.accessToken, other.accessToken);
}

mixin LoginResponseMappable {
  String toJson() =>
      LoginResponseMapper.container.toJson(this as LoginResponse);
  Map<String, dynamic> toMap() =>
      LoginResponseMapper.container.toMap(this as LoginResponse);
  LoginResponseCopyWith<LoginResponse, LoginResponse, LoginResponse>
      get copyWith => _LoginResponseCopyWithImpl(
          this as LoginResponse, $identity, $identity);
  @override
  String toString() => LoginResponseMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          LoginResponseMapper.container.isEqual(this, other));
  @override
  int get hashCode => LoginResponseMapper.container.hash(this);
}

extension LoginResponseValueCopy<$R, $Out extends LoginResponse>
    on ObjectCopyWith<$R, LoginResponse, $Out> {
  LoginResponseCopyWith<$R, LoginResponse, $Out> get asLoginResponse =>
      base.as((v, t, t2) => _LoginResponseCopyWithImpl(v, t, t2));
}

typedef LoginResponseCopyWithBound = LoginResponse;

abstract class LoginResponseCopyWith<$R, $In extends LoginResponse,
    $Out extends LoginResponse> implements ObjectCopyWith<$R, $In, $Out> {
  LoginResponseCopyWith<$R2, $In, $Out2>
      chain<$R2, $Out2 extends LoginResponse>(
          Then<LoginResponse, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? accessToken});
}

class _LoginResponseCopyWithImpl<$R, $Out extends LoginResponse>
    extends CopyWithBase<$R, LoginResponse, $Out>
    implements LoginResponseCopyWith<$R, LoginResponse, $Out> {
  _LoginResponseCopyWithImpl(super.value, super.then, super.then2);
  @override
  LoginResponseCopyWith<$R2, LoginResponse, $Out2>
      chain<$R2, $Out2 extends LoginResponse>(
              Then<LoginResponse, $Out2> t, Then<$Out2, $R2> t2) =>
          _LoginResponseCopyWithImpl($value, t, t2);

  @override
  $R call({String? accessToken}) =>
      $then(LoginResponse(accessToken: accessToken ?? $value.accessToken));
}
