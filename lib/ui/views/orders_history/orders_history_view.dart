import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maestroni/res/theme/app_typography.dart';
import 'package:stacked/stacked.dart';

import '../../../res/theme/app_colors.dart';
import '../../widgets/app_bar.dart';
import 'orders_history_viewmodel.dart';

class OrdersHistoryView extends StackedView<OrdersHistoryViewModel> {
  const OrdersHistoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OrdersHistoryViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AAppBar(
          title: 'История заказов',
          withPop: true,
          action: CupertinoButton(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                alignment: Alignment.center,
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.red,
                ),
                child: Icon(
                  Icons.update,
                  color: AppColors.white,
                  size: 32,
                ),
              ),
              onPressed: () {
                viewModel.init();
              }),
        ),
        body: viewModel.isBusy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                itemCount: viewModel.orders.length,
                itemBuilder: (c, index) => CupertinoButton(
                  color: Colors.transparent,
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: double.maxFinite,
                    decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(16)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Заказ #${viewModel.orders[index].orderResponse.orderId.toString()}',
                                style: const TextStyle(color: Colors.black),
                              ),
                              Text(
                                viewModel.orders[index].expeditionType == 'delivery' ? 'Доставка' : 'Самовывоз',
                                style: const TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                viewModel.orders[index].dishList.map((e) => '${e.quantity} x ${e.name}\n').join(''),
                                overflow: TextOverflow.ellipsis,
                                style: AppTypography.med16Grey,
                              )),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                '${viewModel.orders[index].dishList.map((e) => double.parse(e.price) * double.parse(e.quantity)).reduce((value, element) => value + element).toStringAsFixed(0)} ₽',
                                style: const TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  'Адрес:\n${viewModel.orders[index].expeditionType == 'delivery' ? viewModel.orders[index].address?.fullAddress ?? 0 : viewModel.orders[index].orderResponse.restaurant?.address}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                width: 64,
                              ),
                              Text(
                                viewModel.orders[index].orderStatusName,
                                style: AppTypography.semi16Red,
                              )
                            ],
                          )
                        ]),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
              ));
  }

  @override
  OrdersHistoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrdersHistoryViewModel();

  @override
  void onViewModelReady(OrdersHistoryViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
