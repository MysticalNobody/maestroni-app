import 'package:maestroni/data/models/order_dto.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import 'api_service.dart';

class OrdersHistoryService with ListenableServiceMixin {
  OrdersHistoryService() {
    listenToReactiveValues([orders]);
  }
  final _apiService = locator<ApiService>();

  ReactiveList<OrderDTO> orders = ReactiveList<OrderDTO>();

  Future<void> fetch() async {
    final r = await _apiService.remoteDataSource.getOrdersHistory();
    if (r.isSuccessful && r.body != null) {
      orders
        ..clear()
        ..addAll(r.body!.toList());
    }
  }
}
