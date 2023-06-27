import 'dart:developer';

import 'package:chopper/chopper.dart';
import 'package:dart_mappable/dart_mappable.dart';

class JsonMappableConverter extends JsonConverter {
  const JsonMappableConverter(this.container);
  final MapperContainer container;

  @override
  Request convertRequest(Request request) {
    if (request.body is String || request.body is Map) {
      return super.convertRequest(request);
    }

    if (request.body is List) {
      return super.convertRequest(request.copyWith(
          body:
              (request.body as List).map((e) => container.toMap(e)).toList()));
    }
    return super.convertRequest(
      request.copyWith(
        body: container.toMap(request.body),
      ),
    );
  }

  @override
  Future<Response<ResultType>> convertResponse<ResultType, Item>(
      Response response) async {
    // log(response.body.toString());
    // log(response.statusCode.toString());
    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: container.fromValue(jsonRes.body));
  }
}
