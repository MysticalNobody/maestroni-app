import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/order_dto.dart';
import 'package:maestroni/services/orders_history_service.dart';
import 'package:maestroni/services/payment_service.dart';
import 'package:stacked/stacked.dart';

class OrdersHistoryViewModel extends ReactiveViewModel {
  final _ordersService = locator<OrdersHistoryService>();
  final _paymentService = locator<PaymentService>();

  List<OrderDTO> get orders => _ordersService.orders;

  Future<void> init() async {
    runBusyFuture(_ordersService.fetch());
  }

  Future<void> onPay(OrderDTO order) async {
    await _ordersService.fetch();
    notifyListeners();
    if (orders.firstWhere((element) => element.orderId == order.orderId).needPaid) {
      _paymentService.payTinkoff(r: order);
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_ordersService];
}
