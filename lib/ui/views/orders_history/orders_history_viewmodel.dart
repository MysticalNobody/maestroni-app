import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/order_dto.dart';
import 'package:maestroni/services/api_service.dart';
import 'package:stacked/stacked.dart';

class OrdersHistoryViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();

  final List<OrderDTO> orders = [];

  Future<void> init() async {
    setBusy(true);
    final r = await _apiService.remoteDataSource.getOrdersHistory();
    if (r.isSuccessful && r.body != null) {
      orders
        ..clear()
        ..addAll(r.body!.toList());
      rebuildUi();
    }
    setBusy(false);
  }
}
