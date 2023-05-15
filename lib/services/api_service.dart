import 'package:chopper/chopper.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:maestroni/data/data_sources/api/auth_intercaptor.dart';
import 'package:maestroni/data/data_sources/api/converter.dart';
import 'package:maestroni/data/data_sources/remote_data_source.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/data/models/categories_active.dart';
import 'package:maestroni/data/models/categories_response.dart';
import 'package:maestroni/data/models/category_dto.dart';
import 'package:maestroni/data/models/item_dto.dart';
import 'package:maestroni/data/models/login_request.dart';
import 'package:maestroni/data/models/login_response.dart';
import 'package:maestroni/data/models/news_dto.dart';
import 'package:maestroni/data/models/sms_request.dart';

import '../data/models/fias_search_result.dart';

class ApiService {
  MapperContainer container = MapperContainer(
    mappers: {
      CategoryDTOMapper(),
      ItemDTOMapper(),
      NewsDTOMapper(),
      SMSRequestMapper(),
      LoginRequestMapper(),
      LoginResponseMapper(),
      AddressDTOMapper(),
      CategoriesResponseMapper(),
      CategoriesActiveMapper(),
      FIASSearchResultMapper(),
      FIASObjectMapper(),
      FIASSubObjectMapper(),
    },
  );

  late final ChopperClient chopper = ChopperClient(
    errorConverter: JsonMappableConverter(container),
    converter: JsonMappableConverter(container),
    interceptors: [
      AuthInterceptor(),
    ],
  );

  late final RemoteDataSource remoteDataSource = RemoteDataSource.create(chopper);
}
