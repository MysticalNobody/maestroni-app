// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'user_dto.dart';

class UserDTOMapper extends ClassMapperBase<UserDTO> {
  UserDTOMapper._();

  static UserDTOMapper? _instance;
  static UserDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserDTOMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'UserDTO';

  static String? _$userName(UserDTO v) => v.userName;
  static const Field<UserDTO, String> _f$userName =
      Field('userName', _$userName, opt: true);
  static String? _$email(UserDTO v) => v.email;
  static const Field<UserDTO, String> _f$email =
      Field('email', _$email, opt: true);
  static String? _$phoneNumber(UserDTO v) => v.phoneNumber;
  static const Field<UserDTO, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber, opt: true);

  @override
  final Map<Symbol, Field<UserDTO, dynamic>> fields = const {
    #userName: _f$userName,
    #email: _f$email,
    #phoneNumber: _f$phoneNumber,
  };
  @override
  final bool ignoreNull = true;

  static UserDTO _instantiate(DecodingData data) {
    return UserDTO(
        userName: data.dec(_f$userName),
        email: data.dec(_f$email),
        phoneNumber: data.dec(_f$phoneNumber));
  }

  @override
  final Function instantiate = _instantiate;

  static UserDTO fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<UserDTO>(map));
  }

  static UserDTO fromJson(String json) {
    return _guard((c) => c.fromJson<UserDTO>(json));
  }
}

mixin UserDTOMappable {
  String toJson() {
    return UserDTOMapper._guard((c) => c.toJson(this as UserDTO));
  }

  Map<String, dynamic> toMap() {
    return UserDTOMapper._guard((c) => c.toMap(this as UserDTO));
  }

  UserDTOCopyWith<UserDTO, UserDTO, UserDTO> get copyWith =>
      _UserDTOCopyWithImpl(this as UserDTO, $identity, $identity);
  @override
  String toString() {
    return UserDTOMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UserDTOMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return UserDTOMapper._guard((c) => c.hash(this));
  }
}

extension UserDTOValueCopy<$R, $Out> on ObjectCopyWith<$R, UserDTO, $Out> {
  UserDTOCopyWith<$R, UserDTO, $Out> get $asUserDTO =>
      $base.as((v, t, t2) => _UserDTOCopyWithImpl(v, t, t2));
}

abstract class UserDTOCopyWith<$R, $In extends UserDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? userName, String? email, String? phoneNumber});
  UserDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserDTO, $Out>
    implements UserDTOCopyWith<$R, UserDTO, $Out> {
  _UserDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserDTO> $mapper =
      UserDTOMapper.ensureInitialized();
  @override
  $R call(
          {Object? userName = $none,
          Object? email = $none,
          Object? phoneNumber = $none}) =>
      $apply(FieldCopyWithData({
        if (userName != $none) #userName: userName,
        if (email != $none) #email: email,
        if (phoneNumber != $none) #phoneNumber: phoneNumber
      }));
  @override
  UserDTO $make(CopyWithData data) => UserDTO(
      userName: data.get(#userName, or: $value.userName),
      email: data.get(#email, or: $value.email),
      phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber));

  @override
  UserDTOCopyWith<$R2, UserDTO, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserDTOCopyWithImpl($value, $cast, t);
}
