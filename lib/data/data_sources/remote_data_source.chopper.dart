// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_data_source.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RemoteDataSource extends RemoteDataSource {
  _$RemoteDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RemoteDataSource;

  @override
  Future<Response<CategoriesResponse>> getCategories() {
    final Uri $url = Uri.parse('https://api.maestroni.ru/categories/getAll');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CategoriesResponse, CategoriesResponse>($request);
  }

  @override
  Future<Response<List<CategoryDTO>>> getProducts() {
    final Uri $url = Uri.parse('https://api.maestroni.ru/products/new');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<CategoryDTO>, CategoryDTO>($request);
  }

  @override
  Future<Response<LoginResponse>> login(
    String phoneNumber,
    int smsCode,
  ) {
    final Uri $url = Uri.parse('https://api.maestroni.ru/authentication/login');
    final $body = <String, dynamic>{
      'phoneNumber': phoneNumber,
      'smsCode': smsCode,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<LoginResponse, LoginResponse>($request);
  }

  @override
  Future<dynamic> sendSms(String phoneNumber) {
    final Uri $url =
        Uri.parse('https://api.maestroni.ru/authentication/send-sms');
    final $body = <String, dynamic>{'phoneNumber': phoneNumber};
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send($request);
  }

  @override
  Future<Response<List<NewsDTO>>> getNews() {
    final Uri $url = Uri.parse('https://api.maestroni.ru/news/read');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<NewsDTO>, NewsDTO>($request);
  }

  @override
  Future<Response<List<AddressDTO>>> getAddresses() {
    final Uri $url = Uri.parse('https://api.maestroni.ru/address');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<AddressDTO>, AddressDTO>($request);
  }

  @override
  Future<Response<Map<dynamic, dynamic>>> searchAddress({
    required String q,
    String format = 'jsonv2',
  }) {
    final Uri $url = Uri.parse('https://nominatim.openstreetmap.org/search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'q': q,
      'fromat': format,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Map<dynamic, dynamic>, Map<dynamic, dynamic>>($request);
  }

  @override
  Future<Response<dynamic>> addAddress({
    required String address,
    required String apartmentNumber,
    required String country,
    required String region,
    required String city,
    required String street,
    required String floor,
    required String comment,
    required String house,
    required String building,
    required String lat,
    required String lon,
  }) {
    final Uri $url = Uri.parse('https://api.maestroni.ru/address');
    final $body = <String, dynamic>{
      'address': address,
      'apartmentNumber': apartmentNumber,
      'country': country,
      'region': region,
      'city': city,
      'street': street,
      'floor': floor,
      'comment': comment,
      'house': house,
      'building': building,
      'lat': lat,
      'lon': lon,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
