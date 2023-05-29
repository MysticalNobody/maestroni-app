// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'fias_search_result.dart';

class FIASSearchResultMapper extends ClassMapperBase<FIASSearchResult> {
  FIASSearchResultMapper._();

  static FIASSearchResultMapper? _instance;
  static FIASSearchResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FIASSearchResultMapper._());
      FIASObjectMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'FIASSearchResult';

  static List<FIASObject> _$result(FIASSearchResult v) => v.result;
  static const Field<FIASSearchResult, List<FIASObject>> _f$result =
      Field('result', _$result);

  @override
  final Map<Symbol, Field<FIASSearchResult, dynamic>> fields = const {
    #result: _f$result,
  };
  @override
  final bool ignoreNull = true;

  static FIASSearchResult _instantiate(DecodingData data) {
    return FIASSearchResult(result: data.dec(_f$result));
  }

  @override
  final Function instantiate = _instantiate;

  static FIASSearchResult fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<FIASSearchResult>(map));
  }

  static FIASSearchResult fromJson(String json) {
    return _guard((c) => c.fromJson<FIASSearchResult>(json));
  }
}

mixin FIASSearchResultMappable {
  String toJson() {
    return FIASSearchResultMapper._guard(
        (c) => c.toJson(this as FIASSearchResult));
  }

  Map<String, dynamic> toMap() {
    return FIASSearchResultMapper._guard(
        (c) => c.toMap(this as FIASSearchResult));
  }

  FIASSearchResultCopyWith<FIASSearchResult, FIASSearchResult, FIASSearchResult>
      get copyWith => _FIASSearchResultCopyWithImpl(
          this as FIASSearchResult, $identity, $identity);
  @override
  String toString() {
    return FIASSearchResultMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            FIASSearchResultMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return FIASSearchResultMapper._guard((c) => c.hash(this));
  }
}

extension FIASSearchResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FIASSearchResult, $Out> {
  FIASSearchResultCopyWith<$R, FIASSearchResult, $Out>
      get $asFIASSearchResult =>
          $base.as((v, t, t2) => _FIASSearchResultCopyWithImpl(v, t, t2));
}

abstract class FIASSearchResultCopyWith<$R, $In extends FIASSearchResult, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, FIASObject, FIASObjectCopyWith<$R, FIASObject, FIASObject>>
      get result;
  $R call({List<FIASObject>? result});
  FIASSearchResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FIASSearchResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FIASSearchResult, $Out>
    implements FIASSearchResultCopyWith<$R, FIASSearchResult, $Out> {
  _FIASSearchResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FIASSearchResult> $mapper =
      FIASSearchResultMapper.ensureInitialized();
  @override
  ListCopyWith<$R, FIASObject, FIASObjectCopyWith<$R, FIASObject, FIASObject>>
      get result => ListCopyWith($value.result, (v, t) => v.copyWith.$chain(t),
          (v) => call(result: v));
  @override
  $R call({List<FIASObject>? result}) =>
      $apply(FieldCopyWithData({if (result != null) #result: result}));
  @override
  FIASSearchResult $make(CopyWithData data) =>
      FIASSearchResult(result: data.get(#result, or: $value.result));

  @override
  FIASSearchResultCopyWith<$R2, FIASSearchResult, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FIASSearchResultCopyWithImpl($value, $cast, t);
}

class FIASObjectMapper extends ClassMapperBase<FIASObject> {
  FIASObjectMapper._();

  static FIASObjectMapper? _instance;
  static FIASObjectMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FIASObjectMapper._());
      FIASSubObjectMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'FIASObject';

  static String _$name(FIASObject v) => v.name;
  static const Field<FIASObject, String> _f$name = Field('name', _$name);
  static String _$typeShort(FIASObject v) => v.typeShort;
  static const Field<FIASObject, String> _f$typeShort =
      Field('typeShort', _$typeShort);
  static String _$type(FIASObject v) => v.type;
  static const Field<FIASObject, String> _f$type = Field('type', _$type);
  static List<FIASSubObject> _$parents(FIASObject v) => v.parents;
  static const Field<FIASObject, List<FIASSubObject>> _f$parents =
      Field('parents', _$parents);
  static String? _$contentType(FIASObject v) => v.contentType;
  static const Field<FIASObject, String> _f$contentType =
      Field('contentType', _$contentType);

  @override
  final Map<Symbol, Field<FIASObject, dynamic>> fields = const {
    #name: _f$name,
    #typeShort: _f$typeShort,
    #type: _f$type,
    #parents: _f$parents,
    #contentType: _f$contentType,
  };
  @override
  final bool ignoreNull = true;

  static FIASObject _instantiate(DecodingData data) {
    return FIASObject(
        name: data.dec(_f$name),
        typeShort: data.dec(_f$typeShort),
        type: data.dec(_f$type),
        parents: data.dec(_f$parents),
        contentType: data.dec(_f$contentType));
  }

  @override
  final Function instantiate = _instantiate;

  static FIASObject fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<FIASObject>(map));
  }

  static FIASObject fromJson(String json) {
    return _guard((c) => c.fromJson<FIASObject>(json));
  }
}

mixin FIASObjectMappable {
  String toJson() {
    return FIASObjectMapper._guard((c) => c.toJson(this as FIASObject));
  }

  Map<String, dynamic> toMap() {
    return FIASObjectMapper._guard((c) => c.toMap(this as FIASObject));
  }

  FIASObjectCopyWith<FIASObject, FIASObject, FIASObject> get copyWith =>
      _FIASObjectCopyWithImpl(this as FIASObject, $identity, $identity);
  @override
  String toString() {
    return FIASObjectMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            FIASObjectMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return FIASObjectMapper._guard((c) => c.hash(this));
  }
}

extension FIASObjectValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FIASObject, $Out> {
  FIASObjectCopyWith<$R, FIASObject, $Out> get $asFIASObject =>
      $base.as((v, t, t2) => _FIASObjectCopyWithImpl(v, t, t2));
}

abstract class FIASObjectCopyWith<$R, $In extends FIASObject, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, FIASSubObject,
      FIASSubObjectCopyWith<$R, FIASSubObject, FIASSubObject>> get parents;
  $R call(
      {String? name,
      String? typeShort,
      String? type,
      List<FIASSubObject>? parents,
      String? contentType});
  FIASObjectCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FIASObjectCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FIASObject, $Out>
    implements FIASObjectCopyWith<$R, FIASObject, $Out> {
  _FIASObjectCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FIASObject> $mapper =
      FIASObjectMapper.ensureInitialized();
  @override
  ListCopyWith<$R, FIASSubObject,
          FIASSubObjectCopyWith<$R, FIASSubObject, FIASSubObject>>
      get parents => ListCopyWith($value.parents,
          (v, t) => v.copyWith.$chain(t), (v) => call(parents: v));
  @override
  $R call(
          {String? name,
          String? typeShort,
          String? type,
          List<FIASSubObject>? parents,
          Object? contentType = $none}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (typeShort != null) #typeShort: typeShort,
        if (type != null) #type: type,
        if (parents != null) #parents: parents,
        if (contentType != $none) #contentType: contentType
      }));
  @override
  FIASObject $make(CopyWithData data) => FIASObject(
      name: data.get(#name, or: $value.name),
      typeShort: data.get(#typeShort, or: $value.typeShort),
      type: data.get(#type, or: $value.type),
      parents: data.get(#parents, or: $value.parents),
      contentType: data.get(#contentType, or: $value.contentType));

  @override
  FIASObjectCopyWith<$R2, FIASObject, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FIASObjectCopyWithImpl($value, $cast, t);
}

class FIASSubObjectMapper extends ClassMapperBase<FIASSubObject> {
  FIASSubObjectMapper._();

  static FIASSubObjectMapper? _instance;
  static FIASSubObjectMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FIASSubObjectMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'FIASSubObject';

  static String _$name(FIASSubObject v) => v.name;
  static const Field<FIASSubObject, String> _f$name = Field('name', _$name);
  static String _$typeShort(FIASSubObject v) => v.typeShort;
  static const Field<FIASSubObject, String> _f$typeShort =
      Field('typeShort', _$typeShort);
  static String _$type(FIASSubObject v) => v.type;
  static const Field<FIASSubObject, String> _f$type = Field('type', _$type);
  static String _$contentType(FIASSubObject v) => v.contentType;
  static const Field<FIASSubObject, String> _f$contentType =
      Field('contentType', _$contentType);

  @override
  final Map<Symbol, Field<FIASSubObject, dynamic>> fields = const {
    #name: _f$name,
    #typeShort: _f$typeShort,
    #type: _f$type,
    #contentType: _f$contentType,
  };
  @override
  final bool ignoreNull = true;

  static FIASSubObject _instantiate(DecodingData data) {
    return FIASSubObject(
        name: data.dec(_f$name),
        typeShort: data.dec(_f$typeShort),
        type: data.dec(_f$type),
        contentType: data.dec(_f$contentType));
  }

  @override
  final Function instantiate = _instantiate;

  static FIASSubObject fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<FIASSubObject>(map));
  }

  static FIASSubObject fromJson(String json) {
    return _guard((c) => c.fromJson<FIASSubObject>(json));
  }
}

mixin FIASSubObjectMappable {
  String toJson() {
    return FIASSubObjectMapper._guard((c) => c.toJson(this as FIASSubObject));
  }

  Map<String, dynamic> toMap() {
    return FIASSubObjectMapper._guard((c) => c.toMap(this as FIASSubObject));
  }

  FIASSubObjectCopyWith<FIASSubObject, FIASSubObject, FIASSubObject>
      get copyWith => _FIASSubObjectCopyWithImpl(
          this as FIASSubObject, $identity, $identity);
  @override
  String toString() {
    return FIASSubObjectMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            FIASSubObjectMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return FIASSubObjectMapper._guard((c) => c.hash(this));
  }
}

extension FIASSubObjectValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FIASSubObject, $Out> {
  FIASSubObjectCopyWith<$R, FIASSubObject, $Out> get $asFIASSubObject =>
      $base.as((v, t, t2) => _FIASSubObjectCopyWithImpl(v, t, t2));
}

abstract class FIASSubObjectCopyWith<$R, $In extends FIASSubObject, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? typeShort, String? type, String? contentType});
  FIASSubObjectCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FIASSubObjectCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FIASSubObject, $Out>
    implements FIASSubObjectCopyWith<$R, FIASSubObject, $Out> {
  _FIASSubObjectCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FIASSubObject> $mapper =
      FIASSubObjectMapper.ensureInitialized();
  @override
  $R call(
          {String? name,
          String? typeShort,
          String? type,
          String? contentType}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (typeShort != null) #typeShort: typeShort,
        if (type != null) #type: type,
        if (contentType != null) #contentType: contentType
      }));
  @override
  FIASSubObject $make(CopyWithData data) => FIASSubObject(
      name: data.get(#name, or: $value.name),
      typeShort: data.get(#typeShort, or: $value.typeShort),
      type: data.get(#type, or: $value.type),
      contentType: data.get(#contentType, or: $value.contentType));

  @override
  FIASSubObjectCopyWith<$R2, FIASSubObject, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FIASSubObjectCopyWithImpl($value, $cast, t);
}
