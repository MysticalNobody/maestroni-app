// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'user_dto.dart';

class UserDTOMapper extends MapperBase<UserDTO> {
  static MapperContainer container = MapperContainer(
    mappers: {UserDTOMapper()},
  );

  @override
  UserDTOMapperElement createElement(MapperContainer container) {
    return UserDTOMapperElement._(this, container);
  }

  @override
  String get id => 'UserDTO';

  static final fromMap = container.fromMap<UserDTO>;
  static final fromJson = container.fromJson<UserDTO>;
}

class UserDTOMapperElement extends MapperElementBase<UserDTO> {
  UserDTOMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  UserDTO decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  UserDTO fromMap(Map<String, dynamic> map) => UserDTO(
      userName: container.$getOpt(map, 'userName'),
      email: container.$getOpt(map, 'email'),
      phoneNumber: container.$getOpt(map, 'phoneNumber'));

  @override
  Function get encoder => encode;
  dynamic encode(UserDTO v) => toMap(v);
  Map<String, dynamic> toMap(UserDTO u) => {
        if (container.$enc(u.userName, 'userName') != null)
          'userName': container.$enc(u.userName, 'userName'),
        if (container.$enc(u.email, 'email') != null)
          'email': container.$enc(u.email, 'email'),
        if (container.$enc(u.phoneNumber, 'phoneNumber') != null)
          'phoneNumber': container.$enc(u.phoneNumber, 'phoneNumber')
      };

  @override
  String stringify(UserDTO self) =>
      'UserDTO(userName: ${container.asString(self.userName)}, email: ${container.asString(self.email)}, phoneNumber: ${container.asString(self.phoneNumber)})';
  @override
  int hash(UserDTO self) =>
      container.hash(self.userName) ^
      container.hash(self.email) ^
      container.hash(self.phoneNumber);
  @override
  bool equals(UserDTO self, UserDTO other) =>
      container.isEqual(self.userName, other.userName) &&
      container.isEqual(self.email, other.email) &&
      container.isEqual(self.phoneNumber, other.phoneNumber);
}

mixin UserDTOMappable {
  String toJson() => UserDTOMapper.container.toJson(this as UserDTO);
  Map<String, dynamic> toMap() =>
      UserDTOMapper.container.toMap(this as UserDTO);
  UserDTOCopyWith<UserDTO, UserDTO, UserDTO> get copyWith =>
      _UserDTOCopyWithImpl(this as UserDTO, $identity, $identity);
  @override
  String toString() => UserDTOMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          UserDTOMapper.container.isEqual(this, other));
  @override
  int get hashCode => UserDTOMapper.container.hash(this);
}

extension UserDTOValueCopy<$R, $Out extends UserDTO>
    on ObjectCopyWith<$R, UserDTO, $Out> {
  UserDTOCopyWith<$R, UserDTO, $Out> get asUserDTO =>
      base.as((v, t, t2) => _UserDTOCopyWithImpl(v, t, t2));
}

typedef UserDTOCopyWithBound = UserDTO;

abstract class UserDTOCopyWith<$R, $In extends UserDTO, $Out extends UserDTO>
    implements ObjectCopyWith<$R, $In, $Out> {
  UserDTOCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends UserDTO>(
      Then<UserDTO, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? userName, String? email, String? phoneNumber});
}

class _UserDTOCopyWithImpl<$R, $Out extends UserDTO>
    extends CopyWithBase<$R, UserDTO, $Out>
    implements UserDTOCopyWith<$R, UserDTO, $Out> {
  _UserDTOCopyWithImpl(super.value, super.then, super.then2);
  @override
  UserDTOCopyWith<$R2, UserDTO, $Out2> chain<$R2, $Out2 extends UserDTO>(
          Then<UserDTO, $Out2> t, Then<$Out2, $R2> t2) =>
      _UserDTOCopyWithImpl($value, t, t2);

  @override
  $R call(
          {Object? userName = $none,
          Object? email = $none,
          Object? phoneNumber = $none}) =>
      $then(UserDTO(
          userName: or(userName, $value.userName),
          email: or(email, $value.email),
          phoneNumber: or(phoneNumber, $value.phoneNumber)));
}
