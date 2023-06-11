import 'package:chopper/chopper.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:maestroni/data/data_sources/api/auth_intercaptor.dart';
import 'package:maestroni/data/data_sources/api/converter.dart';
import 'package:maestroni/data/data_sources/remote_data_source.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/data/models/categories_active.dart';
import 'package:maestroni/data/models/categories_response.dart';
import 'package:maestroni/data/models/category_dto.dart';
import 'package:maestroni/data/models/create_order_dto.dart';
import 'package:maestroni/data/models/dish_dto.dart';
import 'package:maestroni/data/models/item_dto.dart';
import 'package:maestroni/data/models/login_request.dart';
import 'package:maestroni/data/models/login_response.dart';
import 'package:maestroni/data/models/news_dto.dart';
import 'package:maestroni/data/models/order_dto.dart';
import 'package:maestroni/data/models/r_order_resp.dart';
import 'package:maestroni/data/models/r_restaurant.dart';
import 'package:maestroni/data/models/resp_order_data.dart';
import 'package:maestroni/data/models/response_create_order.dart';
import 'package:maestroni/data/models/search_address_dto.dart';
import 'package:maestroni/data/models/search_address_resp.dart';
import 'package:maestroni/data/models/short_address.dart';
import 'package:maestroni/data/models/sms_request.dart';
import 'package:maestroni/data/models/sort_category_dto.dart';
import 'package:maestroni/data/models/sort_item_dto.dart';
import 'package:maestroni/data/models/user_dto.dart';

import '../data/models/rest_address_dto.dart';

class ApiService {
  MapperContainer container = MapperContainer(
    mappers: {
      CategoryDTOMapper.ensureInitialized(),
      ItemDTOMapper.ensureInitialized(),
      NewsDTOMapper.ensureInitialized(),
      SMSRequestMapper.ensureInitialized(),
      LoginRequestMapper.ensureInitialized(),
      LoginResponseMapper.ensureInitialized(),
      AddressDTOMapper.ensureInitialized(),
      CategoriesResponseMapper.ensureInitialized(),
      CategoriesActiveMapper.ensureInitialized(),
      SearchAddressDTOMapper.ensureInitialized(),
      SearchAddressRespMapper.ensureInitialized(),
      UserDTOMapper.ensureInitialized(),
      RestAddressDTOMapper.ensureInitialized(),
      DishDTOMapper.ensureInitialized(),
      CreateOrderDTOMapper.ensureInitialized(),
      ResponseCreateOrderMapper.ensureInitialized(),
      RespOrderDataMapper.ensureInitialized(),
      OrderDTOMapper.ensureInitialized(),
      ROrderRespMapper.ensureInitialized(),
      ShortAddressMapper.ensureInitialized(),
      RRestaurantMapper.ensureInitialized(),
      SortCategoryDTOMapper.ensureInitialized(),
      SortItemDTOMapper.ensureInitialized(),
    },
  );

  late final ChopperClient chopper = ChopperClient(
    errorConverter: JsonMappableConverter(container),
    converter: JsonMappableConverter(container),
    interceptors: [
      AuthInterceptor(),
    ],
  );

  late final RemoteDataSource remoteDataSource =
      RemoteDataSource.create(chopper);
}
