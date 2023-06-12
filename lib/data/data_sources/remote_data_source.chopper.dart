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
  Future<Response<List<CategoryDTO>>> getCategories() {
    final Uri $url =
        Uri.parse('https://api.maestroni.ru/categories/getSortedProducts');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<CategoryDTO>, CategoryDTO>($request);
  }

  @override
  Future<Response<LoginResponse>> login({
    required String phoneNumber,
    required int smsCode,
  }) {
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
  Future<Response<dynamic>> sendSms({required String phoneNumber}) {
    final Uri $url =
        Uri.parse('https://api.maestroni.ru/authentication/send-sms');
    final $body = <String, dynamic>{'phoneNumber': phoneNumber};
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> sorting({required List<SortCategoryDTO> sort}) {
    final Uri $url = Uri.parse('https://api.maestroni.ru/sort-category/create');
    final $body = sort;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createNews({required NewsDTO news}) {
    final Uri $url = Uri.parse('https://api.maestroni.ru/news/create');
    final $body = news;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
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
  Future<Response<dynamic>> updateNews({
    required String id,
    required NewsDTO news,
  }) {
    final Uri $url = Uri.parse('https://api.maestroni.ru/news/update/${id}');
    final $body = news;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteNews({required String id}) {
    final Uri $url = Uri.parse('https://api.maestroni.ru/news/delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<AddressDTO>>> getMyAddresses() {
    final Uri $url =
        Uri.parse('https://api.maestroni.ru/address/getMyAddresses');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<AddressDTO>, AddressDTO>($request);
  }

  @override
  Future<Response<List<RestAddressDTO>>> getRestaurants() {
    final Uri $url =
        Uri.parse('https://api.maestroni.ru/address/getRestaurants');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<RestAddressDTO>, RestAddressDTO>($request);
  }

  @override
  Future<Response<UserDTO>> getMe() {
    final Uri $url = Uri.parse('https://api.maestroni.ru/user/me');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<UserDTO, UserDTO>($request);
  }

  @override
  Future<Response<dynamic>> addAddress({required AddressDTO addressDTO}) {
    final Uri $url = Uri.parse('https://api.maestroni.ru/address/create');
    final $body = addressDTO;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<SearchAddressResp>> searchAddress({required String address}) {
    final Uri $url = Uri.parse('https://api.maestroni.ru/address/search');
    final Map<String, dynamic> $params = <String, dynamic>{'address': address};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<SearchAddressResp, SearchAddressResp>($request);
  }

  @override
  Future<Response<dynamic>> removeAddress({required String id}) {
    final Uri $url = Uri.parse('https://api.maestroni.ru/address/${id}/delete');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<RespOrderData>> createOrder(
      {required CreateOrderDTO orderDTO}) {
    final Uri $url =
        Uri.parse('https://api.maestroni.ru/delivery/sendOrCreateOrder');
    final $body = orderDTO;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<RespOrderData, RespOrderData>($request);
  }

  @override
  Future<Response<List<OrderDTO>>> getOrdersHistory() {
    final Uri $url = Uri.parse('https://api.maestroni.ru/delivery/history');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<OrderDTO>, OrderDTO>($request);
  }
}
