// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'display_data.dart';

class DisplayDataMapper extends ClassMapperBase<DisplayData> {
  DisplayDataMapper._();

  static DisplayDataMapper? _instance;
  static DisplayDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DisplayDataMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'DisplayData';

  static String _$displayDataName(DisplayData v) => v.displayDataName;
  static const Field<DisplayData, String> _f$displayDataName =
      Field('displayDataName', _$displayDataName);
  static bool _$isActive(DisplayData v) => v.isActive;
  static const Field<DisplayData, bool> _f$isActive =
      Field('isActive', _$isActive);

  @override
  final Map<Symbol, Field<DisplayData, dynamic>> fields = const {
    #displayDataName: _f$displayDataName,
    #isActive: _f$isActive,
  };
  @override
  final bool ignoreNull = true;

  static DisplayData _instantiate(DecodingData data) {
    return DisplayData(
        displayDataName: data.dec(_f$displayDataName),
        isActive: data.dec(_f$isActive));
  }

  @override
  final Function instantiate = _instantiate;

  static DisplayData fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<DisplayData>(map));
  }

  static DisplayData fromJson(String json) {
    return _guard((c) => c.fromJson<DisplayData>(json));
  }
}

mixin DisplayDataMappable {
  String toJson() {
    return DisplayDataMapper._guard((c) => c.toJson(this as DisplayData));
  }

  Map<String, dynamic> toMap() {
    return DisplayDataMapper._guard((c) => c.toMap(this as DisplayData));
  }

  DisplayDataCopyWith<DisplayData, DisplayData, DisplayData> get copyWith =>
      _DisplayDataCopyWithImpl(this as DisplayData, $identity, $identity);
  @override
  String toString() {
    return DisplayDataMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DisplayDataMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return DisplayDataMapper._guard((c) => c.hash(this));
  }
}

extension DisplayDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DisplayData, $Out> {
  DisplayDataCopyWith<$R, DisplayData, $Out> get $asDisplayData =>
      $base.as((v, t, t2) => _DisplayDataCopyWithImpl(v, t, t2));
}

abstract class DisplayDataCopyWith<$R, $In extends DisplayData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? displayDataName, bool? isActive});
  DisplayDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DisplayDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DisplayData, $Out>
    implements DisplayDataCopyWith<$R, DisplayData, $Out> {
  _DisplayDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DisplayData> $mapper =
      DisplayDataMapper.ensureInitialized();
  @override
  $R call({String? displayDataName, bool? isActive}) =>
      $apply(FieldCopyWithData({
        if (displayDataName != null) #displayDataName: displayDataName,
        if (isActive != null) #isActive: isActive
      }));
  @override
  DisplayData $make(CopyWithData data) => DisplayData(
      displayDataName: data.get(#displayDataName, or: $value.displayDataName),
      isActive: data.get(#isActive, or: $value.isActive));

  @override
  DisplayDataCopyWith<$R2, DisplayData, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DisplayDataCopyWithImpl($value, $cast, t);
}
