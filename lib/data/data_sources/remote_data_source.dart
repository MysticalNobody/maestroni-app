import 'package:chopper/chopper.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/data/models/category_dto.dart';
import 'package:maestroni/data/models/login_response.dart';
import 'package:maestroni/data/models/news_dto.dart';

part 'remote_data_source.chopper.dart';

@ChopperApi(baseUrl: '/')
abstract class RemoteDataSource extends ChopperService {
  static RemoteDataSource create([ChopperClient? client]) =>
      _$RemoteDataSource(client);

  @Get(path: 'http://158.160.25.135:3000/categories')
  Future<Response<List<CategoryDTO>>> getCategories();

  @Get(path: 'http://158.160.25.135:3000/products/new')
  Future<Response<List<CategoryDTO>>> getProducts();

  @Post(path: 'http://158.160.25.135:3000/authentication/login')
  Future<Response<LoginResponse>> login(
    @Field() String phoneNumber,
    @Field() int smsCode,
  );

  @Post(path: 'http://158.160.25.135:3000/authentication/send-sms')
  Future<dynamic> sendSms(@Field() String phoneNumber);

  @Get(path: 'http://158.160.25.135:3000/news/read')
  Future<Response<List<NewsDTO>>> getNews();

  @Get(path: 'http://158.160.25.135:3000/address')
  Future<Response<List<AddressDTO>>> getAddresses();

  @Get(path: 'https://nominatim.openstreetmap.org/search')
  Future<Response<Map>> searchAddress(
      {@Query('q') required String q,
      @Query('fromat') String format = 'jsonv2'});

  @Post(path: 'http://158.160.25.135:3000/address')
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
