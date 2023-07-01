import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.red,
                ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Заказ #${viewModel.orders[index].orderId.toString()}',
                                      style: const TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      DateFormat.yMd().add_jm().format(viewModel.orders[index].localCreatedDate),
                                      style: TextStyle(color: AppColors.grey, fontSize: 14),
                                    ),
                                  ],
                                ),
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
                                viewModel.orders[index].products.map((e) => '${e.quantity} x ${e.name}\n').join(''),
                                maxLines: 100,
                                overflow: TextOverflow.ellipsis,
                                style: AppTypography.med16Grey,
                              )),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                '${viewModel.orders[index].products.map((e) => double.parse(e.price) * double.parse(e.quantity)).reduce((value, element) => value + element).toStringAsFixed(0)} ₽',
                                style: const TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  'Комментарий:\n${viewModel.orders[index].comment}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
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
                                  'Адрес:\n${viewModel.orders[index].expeditionType == 'delivery' ? viewModel.orders[index].address?.shortAddress : viewModel.orders[index].restaurantAddress}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              Text(
                                viewModel.orders[index].orderStatusName,
                                style: AppTypography.semi16Red,
                              )
                            ],
                          ),
                          Divider(
                            color: AppColors.red,
                          ),
                          Text(
                            'Оплата',
                            style: AppTypography.med18,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      viewModel.orders[index].paymentTypeString,
                                      style: const TextStyle(color: Colors.black),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    viewModel.orders[index].paymentStatus == 'prepaid' ? 'Оплачен' : 'Не оплачен',
                                    style: AppTypography.semi16Red,
                                  ),
                                ],
                              ),
                              if (viewModel.orders[index].needPaid)
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColors.red, foregroundColor: AppColors.white),
                                          onPressed: () => viewModel.onPay(viewModel.orders[index]),
                                          child: const Text('Оплатить')),
                                    ],
                                  ),
                                ),
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
