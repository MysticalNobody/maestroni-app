// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'fias_search_result.dart';

class FIASSearchResultMapper extends MapperBase<FIASSearchResult> {
  static MapperContainer container = MapperContainer(
    mappers: {FIASSearchResultMapper()},
  )..linkAll({FIASObjectMapper.container});

  @override
  FIASSearchResultMapperElement createElement(MapperContainer container) {
    return FIASSearchResultMapperElement._(this, container);
  }

  @override
  String get id => 'FIASSearchResult';

  static final fromMap = container.fromMap<FIASSearchResult>;
  static final fromJson = container.fromJson<FIASSearchResult>;
}

class FIASSearchResultMapperElement
    extends MapperElementBase<FIASSearchResult> {
  FIASSearchResultMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  FIASSearchResult decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  FIASSearchResult fromMap(Map<String, dynamic> map) =>
      FIASSearchResult(result: container.$get(map, 'result'));

  @override
  Function get encoder => encode;
  dynamic encode(FIASSearchResult v) => toMap(v);
  Map<String, dynamic> toMap(FIASSearchResult f) =>
      {'result': container.$enc(f.result, 'result')};

  @override
  String stringify(FIASSearchResult self) =>
      'FIASSearchResult(result: ${container.asString(self.result)})';
  @override
  int hash(FIASSearchResult self) => container.hash(self.result);
  @override
  bool equals(FIASSearchResult self, FIASSearchResult other) =>
      container.isEqual(self.result, other.result);
}

mixin FIASSearchResultMappable {
  String toJson() =>
      FIASSearchResultMapper.container.toJson(this as FIASSearchResult);
  Map<String, dynamic> toMap() =>
      FIASSearchResultMapper.container.toMap(this as FIASSearchResult);
  FIASSearchResultCopyWith<FIASSearchResult, FIASSearchResult, FIASSearchResult>
      get copyWith => _FIASSearchResultCopyWithImpl(
          this as FIASSearchResult, $identity, $identity);
  @override
  String toString() => FIASSearchResultMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          FIASSearchResultMapper.container.isEqual(this, other));
  @override
  int get hashCode => FIASSearchResultMapper.container.hash(this);
}

extension FIASSearchResultValueCopy<$R, $Out extends FIASSearchResult>
    on ObjectCopyWith<$R, FIASSearchResult, $Out> {
  FIASSearchResultCopyWith<$R, FIASSearchResult, $Out> get asFIASSearchResult =>
      base.as((v, t, t2) => _FIASSearchResultCopyWithImpl(v, t, t2));
}

typedef FIASSearchResultCopyWithBound = FIASSearchResult;

abstract class FIASSearchResultCopyWith<$R, $In extends FIASSearchResult,
    $Out extends FIASSearchResult> implements ObjectCopyWith<$R, $In, $Out> {
  FIASSearchResultCopyWith<$R2, $In, $Out2>
      chain<$R2, $Out2 extends FIASSearchResult>(
          Then<FIASSearchResult, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, FIASObject, FIASObjectCopyWith<$R, FIASObject, FIASObject>>
      get result;
  $R call({List<FIASObject>? result});
}

class _FIASSearchResultCopyWithImpl<$R, $Out extends FIASSearchResult>
    extends CopyWithBase<$R, FIASSearchResult, $Out>
    implements FIASSearchResultCopyWith<$R, FIASSearchResult, $Out> {
  _FIASSearchResultCopyWithImpl(super.value, super.then, super.then2);
  @override
  FIASSearchResultCopyWith<$R2, FIASSearchResult, $Out2>
      chain<$R2, $Out2 extends FIASSearchResult>(
              Then<FIASSearchResult, $Out2> t, Then<$Out2, $R2> t2) =>
          _FIASSearchResultCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, FIASObject, FIASObjectCopyWith<$R, FIASObject, FIASObject>>
      get result => ListCopyWith(
          $value.result,
          (v, t) => v.copyWith.chain<$R, FIASObject>($identity, t),
          (v) => call(result: v));
  @override
  $R call({List<FIASObject>? result}) =>
      $then(FIASSearchResult(result: result ?? $value.result));
}

class FIASObjectMapper extends MapperBase<FIASObject> {
  static MapperContainer container = MapperContainer(
    mappers: {FIASObjectMapper()},
  )..linkAll({FIASSubObjectMapper.container});

  @override
  FIASObjectMapperElement createElement(MapperContainer container) {
    return FIASObjectMapperElement._(this, container);
  }

  @override
  String get id => 'FIASObject';

  static final fromMap = container.fromMap<FIASObject>;
  static final fromJson = container.fromJson<FIASObject>;
}

class FIASObjectMapperElement extends MapperElementBase<FIASObject> {
  FIASObjectMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  FIASObject decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  FIASObject fromMap(Map<String, dynamic> map) => FIASObject(
      name: container.$get(map, 'name'),
      typeShort: container.$get(map, 'typeShort'),
      type: container.$get(map, 'type'),
      parents: container.$get(map, 'parents'),
      contentType: container.$getOpt(map, 'contentType'));

  @override
  Function get encoder => encode;
  dynamic encode(FIASObject v) => toMap(v);
  Map<String, dynamic> toMap(FIASObject f) => {
        'name': container.$enc(f.name, 'name'),
        'typeShort': container.$enc(f.typeShort, 'typeShort'),
        'type': container.$enc(f.type, 'type'),
        'parents': container.$enc(f.parents, 'parents'),
        if (container.$enc(f.contentType, 'contentType') != null)
          'contentType': container.$enc(f.contentType, 'contentType')
      };

  @override
  String stringify(FIASObject self) =>
      'FIASObject(name: ${container.asString(self.name)}, typeShort: ${container.asString(self.typeShort)}, type: ${container.asString(self.type)}, parents: ${container.asString(self.parents)}, contentType: ${container.asString(self.contentType)})';
  @override
  int hash(FIASObject self) =>
      container.hash(self.name) ^
      container.hash(self.typeShort) ^
      container.hash(self.type) ^
      container.hash(self.parents) ^
      container.hash(self.contentType);
  @override
  bool equals(FIASObject self, FIASObject other) =>
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.typeShort, other.typeShort) &&
      container.isEqual(self.type, other.type) &&
      container.isEqual(self.parents, other.parents) &&
      container.isEqual(self.contentType, other.contentType);
}

mixin FIASObjectMappable {
  String toJson() => FIASObjectMapper.container.toJson(this as FIASObject);
  Map<String, dynamic> toMap() =>
      FIASObjectMapper.container.toMap(this as FIASObject);
  FIASObjectCopyWith<FIASObject, FIASObject, FIASObject> get copyWith =>
      _FIASObjectCopyWithImpl(this as FIASObject, $identity, $identity);
  @override
  String toString() => FIASObjectMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          FIASObjectMapper.container.isEqual(this, other));
  @override
  int get hashCode => FIASObjectMapper.container.hash(this);
}

extension FIASObjectValueCopy<$R, $Out extends FIASObject>
    on ObjectCopyWith<$R, FIASObject, $Out> {
  FIASObjectCopyWith<$R, FIASObject, $Out> get asFIASObject =>
      base.as((v, t, t2) => _FIASObjectCopyWithImpl(v, t, t2));
}

typedef FIASObjectCopyWithBound = FIASObject;

abstract class FIASObjectCopyWith<$R, $In extends FIASObject,
    $Out extends FIASObject> implements ObjectCopyWith<$R, $In, $Out> {
  FIASObjectCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends FIASObject>(
      Then<FIASObject, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, FIASSubObject,
      FIASSubObjectCopyWith<$R, FIASSubObject, FIASSubObject>> get parents;
  $R call(
      {String? name,
      String? typeShort,
      String? type,
      List<FIASSubObject>? parents,
      String? contentType});
}

class _FIASObjectCopyWithImpl<$R, $Out extends FIASObject>
    extends CopyWithBase<$R, FIASObject, $Out>
    implements FIASObjectCopyWith<$R, FIASObject, $Out> {
  _FIASObjectCopyWithImpl(super.value, super.then, super.then2);
  @override
  FIASObjectCopyWith<$R2, FIASObject, $Out2>
      chain<$R2, $Out2 extends FIASObject>(
              Then<FIASObject, $Out2> t, Then<$Out2, $R2> t2) =>
          _FIASObjectCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, FIASSubObject,
          FIASSubObjectCopyWith<$R, FIASSubObject, FIASSubObject>>
      get parents => ListCopyWith(
          $value.parents,
          (v, t) => v.copyWith.chain<$R, FIASSubObject>($identity, t),
          (v) => call(parents: v));
  @override
  $R call(
          {String? name,
          String? typeShort,
          String? type,
          List<FIASSubObject>? parents,
          Object? contentType = $none}) =>
      $then(FIASObject(
          name: name ?? $value.name,
          typeShort: typeShort ?? $value.typeShort,
          type: type ?? $value.type,
          parents: parents ?? $value.parents,
          contentType: or(contentType, $value.contentType)));
}

class FIASSubObjectMapper extends MapperBase<FIASSubObject> {
  static MapperContainer container = MapperContainer(
    mappers: {FIASSubObjectMapper()},
  );

  @override
  FIASSubObjectMapperElement createElement(MapperContainer container) {
    return FIASSubObjectMapperElement._(this, container);
  }

  @override
  String get id => 'FIASSubObject';

  static final fromMap = container.fromMap<FIASSubObject>;
  static final fromJson = container.fromJson<FIASSubObject>;
}

class FIASSubObjectMapperElement extends MapperElementBase<FIASSubObject> {
  FIASSubObjectMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  FIASSubObject decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  FIASSubObject fromMap(Map<String, dynamic> map) => FIASSubObject(
      name: container.$get(map, 'name'),
      typeShort: container.$get(map, 'typeShort'),
      type: container.$get(map, 'type'),
      contentType: container.$get(map, 'contentType'));

  @override
  Function get encoder => encode;
  dynamic encode(FIASSubObject v) => toMap(v);
  Map<String, dynamic> toMap(FIASSubObject f) => {
        'name': container.$enc(f.name, 'name'),
        'typeShort': container.$enc(f.typeShort, 'typeShort'),
        'type': container.$enc(f.type, 'type'),
        'contentType': container.$enc(f.contentType, 'contentType')
      };

  @override
  String stringify(FIASSubObject self) =>
      'FIASSubObject(name: ${container.asString(self.name)}, typeShort: ${container.asString(self.typeShort)}, type: ${container.asString(self.type)}, contentType: ${container.asString(self.contentType)})';
  @override
  int hash(FIASSubObject self) =>
      container.hash(self.name) ^
      container.hash(self.typeShort) ^
      container.hash(self.type) ^
      container.hash(self.contentType);
  @override
  bool equals(FIASSubObject self, FIASSubObject other) =>
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.typeShort, other.typeShort) &&
      container.isEqual(self.type, other.type) &&
      container.isEqual(self.contentType, other.contentType);
}

mixin FIASSubObjectMappable {
  String toJson() =>
      FIASSubObjectMapper.container.toJson(this as FIASSubObject);
  Map<String, dynamic> toMap() =>
      FIASSubObjectMapper.container.toMap(this as FIASSubObject);
  FIASSubObjectCopyWith<FIASSubObject, FIASSubObject, FIASSubObject>
      get copyWith => _FIASSubObjectCopyWithImpl(
          this as FIASSubObject, $identity, $identity);
  @override
  String toString() => FIASSubObjectMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          FIASSubObjectMapper.container.isEqual(this, other));
  @override
  int get hashCode => FIASSubObjectMapper.container.hash(this);
}

extension FIASSubObjectValueCopy<$R, $Out extends FIASSubObject>
    on ObjectCopyWith<$R, FIASSubObject, $Out> {
  FIASSubObjectCopyWith<$R, FIASSubObject, $Out> get asFIASSubObject =>
      base.as((v, t, t2) => _FIASSubObjectCopyWithImpl(v, t, t2));
}

typedef FIASSubObjectCopyWithBound = FIASSubObject;

abstract class FIASSubObjectCopyWith<$R, $In extends FIASSubObject,
    $Out extends FIASSubObject> implements ObjectCopyWith<$R, $In, $Out> {
  FIASSubObjectCopyWith<$R2, $In, $Out2>
      chain<$R2, $Out2 extends FIASSubObject>(
          Then<FIASSubObject, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? name, String? typeShort, String? type, String? contentType});
}

class _FIASSubObjectCopyWithImpl<$R, $Out extends FIASSubObject>
    extends CopyWithBase<$R, FIASSubObject, $Out>
    implements FIASSubObjectCopyWith<$R, FIASSubObject, $Out> {
  _FIASSubObjectCopyWithImpl(super.value, super.then, super.then2);
  @override
  FIASSubObjectCopyWith<$R2, FIASSubObject, $Out2>
      chain<$R2, $Out2 extends FIASSubObject>(
              Then<FIASSubObject, $Out2> t, Then<$Out2, $R2> t2) =>
          _FIASSubObjectCopyWithImpl($value, t, t2);

  @override
  $R call(
          {String? name,
          String? typeShort,
          String? type,
          String? contentType}) =>
      $then(FIASSubObject(
          name: name ?? $value.name,
          typeShort: typeShort ?? $value.typeShort,
          type: type ?? $value.type,
          contentType: contentType ?? $value.contentType));
}
