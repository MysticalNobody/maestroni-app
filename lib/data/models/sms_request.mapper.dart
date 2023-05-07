// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'sms_request.dart';

class SMSRequestMapper extends MapperBase<SMSRequest> {
  static MapperContainer container = MapperContainer(
    mappers: {SMSRequestMapper()},
  );

  @override
  SMSRequestMapperElement createElement(MapperContainer container) {
    return SMSRequestMapperElement._(this, container);
  }

  @override
  String get id => 'SMSRequest';

  static final fromMap = container.fromMap<SMSRequest>;
  static final fromJson = container.fromJson<SMSRequest>;
}

class SMSRequestMapperElement extends MapperElementBase<SMSRequest> {
  SMSRequestMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  SMSRequest decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  SMSRequest fromMap(Map<String, dynamic> map) =>
      SMSRequest(phoneNumber: container.$get(map, 'phoneNumber'));

  @override
  Function get encoder => encode;
  dynamic encode(SMSRequest v) => toMap(v);
  Map<String, dynamic> toMap(SMSRequest s) =>
      {'phoneNumber': container.$enc(s.phoneNumber, 'phoneNumber')};

  @override
  String stringify(SMSRequest self) =>
      'SMSRequest(phoneNumber: ${container.asString(self.phoneNumber)})';
  @override
  int hash(SMSRequest self) => container.hash(self.phoneNumber);
  @override
  bool equals(SMSRequest self, SMSRequest other) =>
      container.isEqual(self.phoneNumber, other.phoneNumber);
}

mixin SMSRequestMappable {
  String toJson() => SMSRequestMapper.container.toJson(this as SMSRequest);
  Map<String, dynamic> toMap() =>
      SMSRequestMapper.container.toMap(this as SMSRequest);
  SMSRequestCopyWith<SMSRequest, SMSRequest, SMSRequest> get copyWith =>
      _SMSRequestCopyWithImpl(this as SMSRequest, $identity, $identity);
  @override
  String toString() => SMSRequestMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          SMSRequestMapper.container.isEqual(this, other));
  @override
  int get hashCode => SMSRequestMapper.container.hash(this);
}

extension SMSRequestValueCopy<$R, $Out extends SMSRequest>
    on ObjectCopyWith<$R, SMSRequest, $Out> {
  SMSRequestCopyWith<$R, SMSRequest, $Out> get asSMSRequest =>
      base.as((v, t, t2) => _SMSRequestCopyWithImpl(v, t, t2));
}

typedef SMSRequestCopyWithBound = SMSRequest;

abstract class SMSRequestCopyWith<$R, $In extends SMSRequest,
    $Out extends SMSRequest> implements ObjectCopyWith<$R, $In, $Out> {
  SMSRequestCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends SMSRequest>(
      Then<SMSRequest, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? phoneNumber});
}

class _SMSRequestCopyWithImpl<$R, $Out extends SMSRequest>
    extends CopyWithBase<$R, SMSRequest, $Out>
    implements SMSRequestCopyWith<$R, SMSRequest, $Out> {
  _SMSRequestCopyWithImpl(super.value, super.then, super.then2);
  @override
  SMSRequestCopyWith<$R2, SMSRequest, $Out2>
      chain<$R2, $Out2 extends SMSRequest>(
              Then<SMSRequest, $Out2> t, Then<$Out2, $R2> t2) =>
          _SMSRequestCopyWithImpl($value, t, t2);

  @override
  $R call({String? phoneNumber}) =>
      $then(SMSRequest(phoneNumber: phoneNumber ?? $value.phoneNumber));
}
