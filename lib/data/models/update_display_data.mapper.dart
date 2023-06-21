// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'update_display_data.dart';

class UpdateDisplayDataMapper extends ClassMapperBase<UpdateDisplayData> {
  UpdateDisplayDataMapper._();

  static UpdateDisplayDataMapper? _instance;
  static UpdateDisplayDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdateDisplayDataMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'UpdateDisplayData';

  static String _$id(UpdateDisplayData v) => v.id;
  static const Field<UpdateDisplayData, String> _f$id = Field('id', _$id);
  static String _$displayDataName(UpdateDisplayData v) => v.displayDataName;
  static const Field<UpdateDisplayData, String> _f$displayDataName =
      Field('displayDataName', _$displayDataName);
  static bool _$isActive(UpdateDisplayData v) => v.isActive;
  static const Field<UpdateDisplayData, bool> _f$isActive =
      Field('isActive', _$isActive);

  @override
  final Map<Symbol, Field<UpdateDisplayData, dynamic>> fields = const {
    #id: _f$id,
    #displayDataName: _f$displayDataName,
    #isActive: _f$isActive,
  };
  @override
  final bool ignoreNull = true;

  static UpdateDisplayData _instantiate(DecodingData data) {
    return UpdateDisplayData(
        id: data.dec(_f$id),
        displayDataName: data.dec(_f$displayDataName),
        isActive: data.dec(_f$isActive));
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateDisplayData fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<UpdateDisplayData>(map));
  }

  static UpdateDisplayData fromJson(String json) {
    return _guard((c) => c.fromJson<UpdateDisplayData>(json));
  }
}

mixin UpdateDisplayDataMappable {
  String toJson() {
    return UpdateDisplayDataMapper._guard(
        (c) => c.toJson(this as UpdateDisplayData));
  }

  Map<String, dynamic> toMap() {
    return UpdateDisplayDataMapper._guard(
        (c) => c.toMap(this as UpdateDisplayData));
  }

  UpdateDisplayDataCopyWith<UpdateDisplayData, UpdateDisplayData,
          UpdateDisplayData>
      get copyWith => _UpdateDisplayDataCopyWithImpl(
          this as UpdateDisplayData, $identity, $identity);
  @override
  String toString() {
    return UpdateDisplayDataMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UpdateDisplayDataMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return UpdateDisplayDataMapper._guard((c) => c.hash(this));
  }
}

extension UpdateDisplayDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdateDisplayData, $Out> {
  UpdateDisplayDataCopyWith<$R, UpdateDisplayData, $Out>
      get $asUpdateDisplayData =>
          $base.as((v, t, t2) => _UpdateDisplayDataCopyWithImpl(v, t, t2));
}

abstract class UpdateDisplayDataCopyWith<$R, $In extends UpdateDisplayData,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? displayDataName, bool? isActive});
  UpdateDisplayDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UpdateDisplayDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdateDisplayData, $Out>
    implements UpdateDisplayDataCopyWith<$R, UpdateDisplayData, $Out> {
  _UpdateDisplayDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdateDisplayData> $mapper =
      UpdateDisplayDataMapper.ensureInitialized();
  @override
  $R call({String? id, String? displayDataName, bool? isActive}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (displayDataName != null) #displayDataName: displayDataName,
        if (isActive != null) #isActive: isActive
      }));
  @override
  UpdateDisplayData $make(CopyWithData data) => UpdateDisplayData(
      id: data.get(#id, or: $value.id),
      displayDataName: data.get(#displayDataName, or: $value.displayDataName),
      isActive: data.get(#isActive, or: $value.isActive));

  @override
  UpdateDisplayDataCopyWith<$R2, UpdateDisplayData, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UpdateDisplayDataCopyWithImpl($value, $cast, t);
}
