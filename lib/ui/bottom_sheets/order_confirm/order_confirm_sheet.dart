import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:maestroni/res/theme/app_typography.dart';
import 'package:maestroni/ui/common/app_colors.dart';
import 'package:maestroni/ui/common/ui_helpers.dart';
import 'package:maestroni/ui/widgets/app_button.dart';
import 'package:maestroni/ui/widgets/app_button_outlined.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'order_confirm_sheet_model.dart';

class OrderConfirmSheet extends StackedView<OrderConfirmSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const OrderConfirmSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OrderConfirmSheetModel viewModel,
    Widget? child,
  ) {
    if (viewModel.isBusy) {
      return Center(
        child: Container(
          height: 36,
          width: 36,
          alignment: Alignment.center,
          child: const CupertinoActivityIndicator(),
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: CupertinoSlidingSegmentedControl(
              children: const {
                true: Text('Доставка'),
                false: Text('Самовывоз')
              },
              groupValue: viewModel.isDelivery,
              onValueChanged: viewModel.onDeliveryChange,
            ),
          ),
          verticalSpaceMedium,
          if (viewModel.isDelivery) ...[
            Text(
              'Выберите адрес доставки',
              style: AppTypography.semi18,
            ),
            verticalSpaceSmall,
            if (viewModel.addresses.isEmpty)
              const Text('Адреса доставки отсутсвуют')
            else
              ...List.generate(
                viewModel.addresses.length,
                (index) => ListTile(
                  title: Text(viewModel.addresses[index].address),
                ),
              ),
            TextButton.icon(
              style: TextButton.styleFrom(
                surfaceTintColor: AppColors.red,
                shadowColor: AppColors.red,
                foregroundColor: AppColors.red,
              ),
              onPressed: () {
                locator<DialogService>().showDialog(
                    title: 'В разработке',
                    description: 'Функционал заказов пока в разработке');
              },
              icon: Icon(Icons.add, color: AppColors.red),
              label: Text(
                'Добавить',
                style: AppTypography.med16.copyWith(color: AppColors.red),
              ),
            ),
          ] else ...[
            Text(
              'Выберите адрес для самовывоза',
              style: AppTypography.semi18,
            ),
            verticalSpaceSmall,
          ],
          verticalSpaceMedium,
          Text(
            'Оплата: наличными курьеру',
            style: AppTypography.med16,
          ),
          verticalSpaceSmall,
          AButtonFilled(
            text: 'Оформить заказ',
            onPressed: () {
              locator<DialogService>().showDialog(
                  title: 'В разработке',
                  description: 'Функционал заказов пока в разработке');
            },
          )
        ],
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }

  @override
  OrderConfirmSheetModel viewModelBuilder(BuildContext context) =>
      OrderConfirmSheetModel();

  @override
  void onViewModelReady(OrderConfirmSheetModel viewModel) =>
      SchedulerBinding.instance
          .addPostFrameCallback((timeStamp) => viewModel.onReady());
}
