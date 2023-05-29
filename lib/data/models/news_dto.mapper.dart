// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'news_dto.dart';

class NewsDTOMapper extends ClassMapperBase<NewsDTO> {
  NewsDTOMapper._();

  static NewsDTOMapper? _instance;
  static NewsDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NewsDTOMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'NewsDTO';

  static String _$photoUrl(NewsDTO v) => v.photoUrl;
  static const Field<NewsDTO, String> _f$photoUrl =
      Field('photoUrl', _$photoUrl, key: 'photo_url');
  static String _$discription(NewsDTO v) => v.discription;
  static const Field<NewsDTO, String> _f$discription = Field(
      'discription', _$discription,
      opt: true, def: 'Описание отсутствует');

  @override
  final Map<Symbol, Field<NewsDTO, dynamic>> fields = const {
    #photoUrl: _f$photoUrl,
    #discription: _f$discription,
  };
  @override
  final bool ignoreNull = true;

  static NewsDTO _instantiate(DecodingData data) {
    return NewsDTO(
        photoUrl: data.dec(_f$photoUrl), discription: data.dec(_f$discription));
  }

  @override
  final Function instantiate = _instantiate;

  static NewsDTO fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<NewsDTO>(map));
  }

  static NewsDTO fromJson(String json) {
    return _guard((c) => c.fromJson<NewsDTO>(json));
  }
}

mixin NewsDTOMappable {
  String toJson() {
    return NewsDTOMapper._guard((c) => c.toJson(this as NewsDTO));
  }

  Map<String, dynamic> toMap() {
    return NewsDTOMapper._guard((c) => c.toMap(this as NewsDTO));
  }

  NewsDTOCopyWith<NewsDTO, NewsDTO, NewsDTO> get copyWith =>
      _NewsDTOCopyWithImpl(this as NewsDTO, $identity, $identity);
  @override
  String toString() {
    return NewsDTOMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            NewsDTOMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return NewsDTOMapper._guard((c) => c.hash(this));
  }
}

extension NewsDTOValueCopy<$R, $Out> on ObjectCopyWith<$R, NewsDTO, $Out> {
  NewsDTOCopyWith<$R, NewsDTO, $Out> get $asNewsDTO =>
      $base.as((v, t, t2) => _NewsDTOCopyWithImpl(v, t, t2));
}

abstract class NewsDTOCopyWith<$R, $In extends NewsDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? photoUrl, String? discription});
  NewsDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NewsDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NewsDTO, $Out>
    implements NewsDTOCopyWith<$R, NewsDTO, $Out> {
  _NewsDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NewsDTO> $mapper =
      NewsDTOMapper.ensureInitialized();
  @override
  $R call({String? photoUrl, String? discription}) => $apply(FieldCopyWithData({
        if (photoUrl != null) #photoUrl: photoUrl,
        if (discription != null) #discription: discription
      }));
  @override
  NewsDTO $make(CopyWithData data) => NewsDTO(
      photoUrl: data.get(#photoUrl, or: $value.photoUrl),
      discription: data.get(#discription, or: $value.discription));

  @override
  NewsDTOCopyWith<$R2, NewsDTO, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _NewsDTOCopyWithImpl($value, $cast, t);
}
