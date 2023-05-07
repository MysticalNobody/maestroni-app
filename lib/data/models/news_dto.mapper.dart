// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'news_dto.dart';

class NewsDTOMapper extends MapperBase<NewsDTO> {
  static MapperContainer container = MapperContainer(
    mappers: {NewsDTOMapper()},
  );

  @override
  NewsDTOMapperElement createElement(MapperContainer container) {
    return NewsDTOMapperElement._(this, container);
  }

  @override
  String get id => 'NewsDTO';

  static final fromMap = container.fromMap<NewsDTO>;
  static final fromJson = container.fromJson<NewsDTO>;
}

class NewsDTOMapperElement extends MapperElementBase<NewsDTO> {
  NewsDTOMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  NewsDTO decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  NewsDTO fromMap(Map<String, dynamic> map) => NewsDTO(
      photoUrl: container.$get(map, 'photo_url'),
      description:
          container.$getOpt(map, 'description') ?? 'Описание отсутствует');

  @override
  Function get encoder => encode;
  dynamic encode(NewsDTO v) => toMap(v);
  Map<String, dynamic> toMap(NewsDTO n) => {
        'photo_url': container.$enc(n.photoUrl, 'photoUrl'),
        'description': container.$enc(n.description, 'description')
      };

  @override
  String stringify(NewsDTO self) =>
      'NewsDTO(photoUrl: ${container.asString(self.photoUrl)}, description: ${container.asString(self.description)})';
  @override
  int hash(NewsDTO self) =>
      container.hash(self.photoUrl) ^ container.hash(self.description);
  @override
  bool equals(NewsDTO self, NewsDTO other) =>
      container.isEqual(self.photoUrl, other.photoUrl) &&
      container.isEqual(self.description, other.description);
}

mixin NewsDTOMappable {
  String toJson() => NewsDTOMapper.container.toJson(this as NewsDTO);
  Map<String, dynamic> toMap() =>
      NewsDTOMapper.container.toMap(this as NewsDTO);
  NewsDTOCopyWith<NewsDTO, NewsDTO, NewsDTO> get copyWith =>
      _NewsDTOCopyWithImpl(this as NewsDTO, $identity, $identity);
  @override
  String toString() => NewsDTOMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          NewsDTOMapper.container.isEqual(this, other));
  @override
  int get hashCode => NewsDTOMapper.container.hash(this);
}

extension NewsDTOValueCopy<$R, $Out extends NewsDTO>
    on ObjectCopyWith<$R, NewsDTO, $Out> {
  NewsDTOCopyWith<$R, NewsDTO, $Out> get asNewsDTO =>
      base.as((v, t, t2) => _NewsDTOCopyWithImpl(v, t, t2));
}

typedef NewsDTOCopyWithBound = NewsDTO;

abstract class NewsDTOCopyWith<$R, $In extends NewsDTO, $Out extends NewsDTO>
    implements ObjectCopyWith<$R, $In, $Out> {
  NewsDTOCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends NewsDTO>(
      Then<NewsDTO, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? photoUrl, String? description});
}

class _NewsDTOCopyWithImpl<$R, $Out extends NewsDTO>
    extends CopyWithBase<$R, NewsDTO, $Out>
    implements NewsDTOCopyWith<$R, NewsDTO, $Out> {
  _NewsDTOCopyWithImpl(super.value, super.then, super.then2);
  @override
  NewsDTOCopyWith<$R2, NewsDTO, $Out2> chain<$R2, $Out2 extends NewsDTO>(
          Then<NewsDTO, $Out2> t, Then<$Out2, $R2> t2) =>
      _NewsDTOCopyWithImpl($value, t, t2);

  @override
  $R call({String? photoUrl, String? description}) => $then(NewsDTO(
      photoUrl: photoUrl ?? $value.photoUrl,
      description: description ?? $value.description));
}
