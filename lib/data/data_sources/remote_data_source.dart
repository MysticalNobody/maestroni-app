import 'package:chopper/chopper.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/data/models/categories_response.dart';
import 'package:maestroni/data/models/create_order_dto.dart';
import 'package:maestroni/data/models/fias_search_result.dart';
import 'package:maestroni/data/models/login_response.dart';
import 'package:maestroni/data/models/news_dto.dart';
import 'package:maestroni/data/models/order_dto.dart';
import 'package:maestroni/data/models/resp_order_data.dart';
import 'package:maestroni/data/models/search_address_resp.dart';
import 'package:maestroni/data/models/user_dto.dart';

import '../models/rest_address_dto.dart';

part 'remote_data_source.chopper.dart';

@ChopperApi(baseUrl: '/')
abstract class RemoteDataSource extends ChopperService {
  static RemoteDataSource create([ChopperClient? client]) => _$RemoteDataSource(client);

  @Get(path: 'https://api.maestroni.ru/categories/getAll')
  Future<Response<CategoriesResponse>> getCategories();

  @Post(path: 'https://api.maestroni.ru/authentication/login')
  Future<Response<LoginResponse>> login({
    @Field() required String phoneNumber,
    @Field() required int smsCode,
  });

  @Post(path: 'https://api.maestroni.ru/authentication/send-sms')
  Future<Response<dynamic>> sendSms({@Field() required String phoneNumber});

  @Get(path: 'https://api.maestroni.ru/news/read')
  Future<Response<List<NewsDTO>>> getNews();

  @Get(path: 'https://api.maestroni.ru/address/getMyAddresses')
  Future<Response<List<AddressDTO>>> getMyAddresses();

  @Get(path: 'https://api.maestroni.ru/address/getRestaurants')
  Future<Response<List<RestAddressDTO>>> getRestaurants();

  @Get(path: 'https://api.maestroni.ru/user/me')
  Future<Response<UserDTO>> getMe();

  // @Get(path: 'https://kladr-api.ru/api.php')
  // Future<Response<FIASSearchResult>> searchAddress({
  //   @Query('query') required String q,
  //   @Query('contentType') String format = 'street',
  //   @Query('withParent') String language = '1',
  //   @Query('cityId') String cityID = '0500000100000',
  //   @Query('oneString') String countrycodes = '1',
  // });

  @Post(path: 'https://api.maestroni.ru/address/create')
  Future<Response<dynamic>> addAddress({@Body() required AddressDTO addressDTO});

  @Get(path: 'https://api.maestroni.ru/address/search')
  Future<Response<SearchAddressResp>> searchAddress({@Query() required String address});

  @Delete(path: 'https://api.maestroni.ru/address/{id}/delete')
  Future<Response<dynamic>> removeAddress({@Path() required String id});

  @Post(path: 'https://api.maestroni.ru/delivery/sendOrCreateOrder')
  Future<Response<RespOrderData>> createOrder({@Body() required CreateOrderDTO orderDTO});

  @Get(path: 'https://api.maestroni.ru/delivery/history')
  Future<Response<List<OrderDTO>>> getOrdersHistory();
}
