// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'login_response.dart';

class LoginResponseMapper extends ClassMapperBase<LoginResponse> {
  LoginResponseMapper._();

  static LoginResponseMapper? _instance;
  static LoginResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginResponseMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'LoginResponse';

  static String _$accessToken(LoginResponse v) => v.accessToken;
  static const Field<LoginResponse, String> _f$accessToken =
      Field('accessToken', _$accessToken);

  @override
  final Map<Symbol, Field<LoginResponse, dynamic>> fields = const {
    #accessToken: _f$accessToken,
  };
  @override
  final bool ignoreNull = true;

  static LoginResponse _instantiate(DecodingData data) {
    return LoginResponse(accessToken: data.dec(_f$accessToken));
  }

  @override
  final Function instantiate = _instantiate;

  static LoginResponse fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<LoginResponse>(map));
  }

  static LoginResponse fromJson(String json) {
    return _guard((c) => c.fromJson<LoginResponse>(json));
  }
}

mixin LoginResponseMappable {
  String toJson() {
    return LoginResponseMapper._guard((c) => c.toJson(this as LoginResponse));
  }

  Map<String, dynamic> toMap() {
    return LoginResponseMapper._guard((c) => c.toMap(this as LoginResponse));
  }

  LoginResponseCopyWith<LoginResponse, LoginResponse, LoginResponse>
      get copyWith => _LoginResponseCopyWithImpl(
          this as LoginResponse, $identity, $identity);
  @override
  String toString() {
    return LoginResponseMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            LoginResponseMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return LoginResponseMapper._guard((c) => c.hash(this));
  }
}

extension LoginResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoginResponse, $Out> {
  LoginResponseCopyWith<$R, LoginResponse, $Out> get $asLoginResponse =>
      $base.as((v, t, t2) => _LoginResponseCopyWithImpl(v, t, t2));
}

abstract class LoginResponseCopyWith<$R, $In extends LoginResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? accessToken});
  LoginResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LoginResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoginResponse, $Out>
    implements LoginResponseCopyWith<$R, LoginResponse, $Out> {
  _LoginResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoginResponse> $mapper =
      LoginResponseMapper.ensureInitialized();
  @override
  $R call({String? accessToken}) => $apply(
      FieldCopyWithData({if (accessToken != null) #accessToken: accessToken}));
  @override
  LoginResponse $make(CopyWithData data) => LoginResponse(
      accessToken: data.get(#accessToken, or: $value.accessToken));

  @override
  LoginResponseCopyWith<$R2, LoginResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LoginResponseCopyWithImpl($value, $cast, t);
}
