import 'package:chopper/chopper.dart';
import 'package:dart_mappable/dart_mappable.dart';

class JsonMappableConverter extends JsonConverter {
  const JsonMappableConverter(this.container);
  final MapperContainer container;

  @override
  Future<Response<ResultType>> convertResponse<ResultType, Item>(
      Response response) async {
    final jsonRes = await super.convertResponse(response);
    if (jsonRes.body is Iterable) {
      return jsonRes.copyWith<ResultType>(
          body: container.fromIterable<ResultType>(jsonRes.body));
    } else {
      return jsonRes.copyWith<ResultType>(
          body: container.fromMap<ResultType>(jsonRes.body));
    }
  }
}

class CommonJsonDecoder {
  CommonJsonDecoder(this.factories);

  Map<Type, JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      return throw Exception(
        "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?",
      );
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);
