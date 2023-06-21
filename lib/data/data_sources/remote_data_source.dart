import 'package:chopper/chopper.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/data/models/category_dto.dart';
import 'package:maestroni/data/models/create_order_dto.dart';
import 'package:maestroni/data/models/login_response.dart';
import 'package:maestroni/data/models/news_dto.dart';
import 'package:maestroni/data/models/order_dto.dart';
import 'package:maestroni/data/models/search_address_resp.dart';
import 'package:maestroni/data/models/update_display_data.dart';
import 'package:maestroni/data/models/user_dto.dart';

import '../models/rest_address_dto.dart';
import '../models/sort_category_dto.dart';

part 'remote_data_source.chopper.dart';

@ChopperApi(baseUrl: '/')
abstract class RemoteDataSource extends ChopperService {
  static RemoteDataSource create([ChopperClient? client]) => _$RemoteDataSource(client);

  @Get(path: 'https://api.maestroni.ru/categories/findAll')
  Future<Response<List<CategoryDTO>>> getCategories();

  @Get(path: 'https://api.maestroni.ru/categories/update-rkeeper-menu')
  Future<Response> updateFromKeeper();

  @Post(path: 'https://api.maestroni.ru/authentication/login')
  Future<Response<LoginResponse>> login({
    @Field() required String phoneNumber,
    @Field() required int smsCode,
  });

  @Post(path: 'https://api.maestroni.ru/authentication/send-sms')
  Future<Response<dynamic>> sendSms({@Field() required String phoneNumber});

  @Post(path: 'https://api.maestroni.ru/sort-category/create')
  Future<Response<dynamic>> sorting({@Body() required List<SortCategoryDTO> sort});

  @Post(path: 'https://api.maestroni.ru/display-data/save')
  Future<Response> updateDisplayData({@Body() required UpdateDisplayData displayData});

  // News start

  @Post(path: 'https://api.maestroni.ru/news/create')
  Future<Response<dynamic>> createNews({@Body() required NewsDTO news});

  @Get(path: 'https://api.maestroni.ru/news/read')
  Future<Response<List<NewsDTO>>> getNews();

  @Patch(path: 'https://api.maestroni.ru/news/update/{id}')
  Future<Response<dynamic>> updateNews({@Path() required String id, @Body() required NewsDTO news});

  @Delete(path: 'https://api.maestroni.ru/news/delete/{id}')
  Future<Response<dynamic>> deleteNews({@Path() required String id});

  // News end

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

  @Post(path: 'https://api.maestroni.ru/delivery/sendOrder')
  Future<Response<OrderDTO>> createOrder({@Body() required CreateOrderDTO orderDTO});

  @Get(path: 'https://api.maestroni.ru/order/findAll')
  Future<Response<List<OrderDTO>>> getOrdersHistory();
}
