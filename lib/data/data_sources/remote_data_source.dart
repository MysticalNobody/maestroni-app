import 'package:chopper/chopper.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/data/models/categories_response.dart';
import 'package:maestroni/data/models/category_dto.dart';
import 'package:maestroni/data/models/fias_search_result.dart';
import 'package:maestroni/data/models/login_response.dart';
import 'package:maestroni/data/models/news_dto.dart';
import 'package:maestroni/data/models/rest_address_dto.dart';
import 'package:maestroni/data/models/rest_address_response.dart';
import 'package:maestroni/data/models/user_dto.dart';

part 'remote_data_source.chopper.dart';

@ChopperApi(baseUrl: '/')
abstract class RemoteDataSource extends ChopperService {
  static RemoteDataSource create([ChopperClient? client]) => _$RemoteDataSource(client);

  @Get(path: 'https://api.maestroni.ru/categories/getAll')
  Future<Response<CategoriesResponse>> getCategories();

  @Get(path: 'https://api.maestroni.ru/products/new')
  Future<Response<List<CategoryDTO>>> getProducts();

  @Post(path: 'https://api.maestroni.ru/authentication/login')
  Future<Response<LoginResponse>> login(
    @Field() String phoneNumber,
    @Field() int smsCode,
  );

  @Post(path: 'https://api.maestroni.ru/authentication/send-sms')
  Future<dynamic> sendSms(@Field() String phoneNumber);

  @Get(path: 'https://api.maestroni.ru/news/read')
  Future<Response<List<NewsDTO>>> getNews();

  @Get(path: 'https://api.maestroni.ru/address/getMyAddresses')
  Future<Response<List<AddressDTO>>> getMyAddresses();

  @Get(path: 'https://api.maestroni.ru/address/getRestaurants')
  Future<Response<RestAddressResponse>> getRestaurants();

  @Get(path: 'https://api.maestroni.ru/user/me')
  Future<Response<UserDTO>> getMe();

  @Get(path: 'https://kladr-api.ru/api.php')
  Future<Response<FIASSearchResult>> searchAddress({
    @Query('query') required String q,
    @Query('contentType') String format = 'street',
    @Query('withParent') String language = '1',
    @Query('cityId') String cityID = '0500000100000',
    @Query('oneString') String countrycodes = '1',
  });

  @Post(path: 'https://api.maestroni.ru/address/create')
  Future<Response<dynamic>> addAddress({
    @Field('address') required String address,
    @Field('apartmentNumber') required String apartmentNumber,
    @Field('country') required String country,
    @Field('region') required String region,
    @Field('city') required String city,
    @Field('street') required String street,
    @Field('floor') required String floor,
    @Field('comment') required String comment,
    @Field('house') required String house,
    @Field('building') required String building,
    @Field('lat') required String lat,
    @Field('lon') required String lon,
  });
}
