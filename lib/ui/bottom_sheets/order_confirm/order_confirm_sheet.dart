import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:maestroni/res/theme/app_typography.dart';
import 'package:maestroni/ui/common/ui_helpers.dart';
import 'package:maestroni/ui/widgets/app_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../data/models/address_dto.dart';
import '../../../data/models/rest_address_dto.dart';
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
    return SafeArea(
      child: DraggableScrollableSheet(
        expand: true,
        initialChildSize: 1,
        maxChildSize: 1,
        builder: (c, cc) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 6,
                  width: 60,
                  decoration: BoxDecoration(
                      color: AppColors.darkGrey,
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: cc,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceSmall,
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
                          'Куда?',
                          style: AppTypography.semi18,
                        ),
                        verticalSpaceSmall,
                        if (viewModel.addresses.isEmpty)
                          const Text('Адреса доставки отсутствуют')
                        else
                          SizedBox(
                            height: 62,
                            child: Row(
                              children: [
                                const Icon(Icons.location_on_outlined),
                                Expanded(
                                  child: DropdownButton<AddressDTO>(
                                    value: viewModel.selectedAddress,
                                    borderRadius: BorderRadius.circular(16),
                                    itemHeight: 56,
                                    isExpanded: true,
                                    items: viewModel.addresses
                                        .map((e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e.fullAddress,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColors.black,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (v) =>
                                        viewModel.selectAddress(v!),
                                    selectedItemBuilder:
                                        (BuildContext context) {
                                      return viewModel.addresses.map((v) {
                                        return Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          alignment: Alignment.centerLeft,
                                          constraints: const BoxConstraints(
                                              minWidth: 100),
                                          child: Text(
                                            v.fullAddress,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        );
                                      }).toList();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Center(
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              surfaceTintColor: AppColors.red,
                              shadowColor: AppColors.red,
                              foregroundColor: AppColors.red,
                            ),
                            onPressed: () => viewModel.addAddress(),
                            icon: Icon(Icons.add, color: AppColors.red),
                            label: Text(
                              'Добавить новый адрес',
                              style: AppTypography.med16
                                  .copyWith(color: AppColors.red),
                            ),
                          ),
                        ),
                      ] else ...[
                        Text(
                          'Откуда?',
                          style: AppTypography.semi18,
                        ),
                        verticalSpaceSmall,
                        SizedBox(
                          height: 62,
                          child: Row(
                            children: [
                              const Icon(Icons.restaurant_outlined),
                              Expanded(
                                child: DropdownButton<RestAddressDTO>(
                                  value: viewModel.selectedRestoran,
                                  borderRadius: BorderRadius.circular(16),
                                  itemHeight: 56,
                                  isExpanded: true,
                                  items: viewModel.restorants
                                      .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              e.actualAddress,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (v) => viewModel.selectRest(v!),
                                  selectedItemBuilder: (BuildContext context) {
                                    return viewModel.restorants.map((v) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        alignment: Alignment.centerLeft,
                                        constraints:
                                            const BoxConstraints(minWidth: 100),
                                        child: Text(
                                          v.actualAddress,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      );
                                    }).toList();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      verticalSpaceMedium,
                      Text(
                        'Когда?',
                        style: AppTypography.semi18,
                      ),
                      verticalSpaceSmall,
                      SizedBox(
                        width: double.infinity,
                        child: CupertinoSlidingSegmentedControl(
                          children: const {
                            true: Text('Как можно раньше'),
                            false: Text('Ко времени')
                          },
                          groupValue: viewModel.soonest,
                          onValueChanged: viewModel.setSoonest,
                        ),
                      ),
                      if (!viewModel.soonest) ...[
                        verticalSpaceSmall,
                        Center(
                          child: TextButton(
                            onPressed: () => viewModel.setDateTime(),
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.red,
                            ),
                            child: Text(
                              DateFormat.yMd()
                                  .add_jm()
                                  .format(viewModel.expectedAt),
                              style: const TextStyle(fontSize: 22),
                            ),
                          ),
                        ),
                      ] else ...[
                        verticalSpaceSmall,
                        const SizedBox(
                          height: 48,
                          child: Center(
                            child: Text(
                              '~ 60 минут',
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ),
                      ],
                      verticalSpaceSmall,
                      Text(
                        'Cпособ оплаты',
                        style: AppTypography.semi18,
                      ),
                      SizedBox(
                        height: 62,
                        child: Row(
                          children: [
                            const Icon(Icons.payments_outlined),
                            Expanded(
                              child: DropdownButton<PayType>(
                                value: viewModel.selectedPayType,
                                borderRadius: BorderRadius.circular(16),
                                itemHeight: 56,
                                isExpanded: true,
                                items: PayType.values
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e.getString(),
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (v) {
                                  viewModel
                                    ..selectedPayType = v!
                                    ..notifyListeners();
                                },
                                selectedItemBuilder: (BuildContext context) {
                                  return PayType.values.map((v) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      alignment: Alignment.centerLeft,
                                      constraints:
                                          const BoxConstraints(minWidth: 100),
                                      child: Text(
                                        v.getString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    );
                                  }).toList();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.comment_outlined),
                          Expanded(
                            child: TextField(
                              controller: viewModel.commentController,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600),
                              cursorColor: AppColors.red,
                              onTapOutside: (_) => FocusScope.of(
                                context,
                              ).unfocus(),
                              decoration: InputDecoration(
                                  hintText: 'Комментарий к заказу',
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.lightGrey)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.lightGrey)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColors.red)),
                                  contentPadding:
                                      const EdgeInsets.only(left: 16),
                                  fillColor: AppColors.red,
                                  focusColor: AppColors.red,
                                  hoverColor: AppColors.red,
                                  iconColor: AppColors.red),
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceMedium,
                      if (viewModel.isDelivery) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Стоимость заказа:',
                              style: AppTypography.semi18,
                            ),
                            Text(
                              viewModel.subtotalString,
                              style: AppTypography.semi18,
                            )
                          ],
                        ),
                        verticalSpaceSmall,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Доставка:',
                              style: AppTypography.semi18,
                            ),
                            Text(
                              viewModel.deliveryPriceString,
                              style: AppTypography.semi18,
                            )
                          ],
                        ),
                        verticalSpaceSmall,
                      ],
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Итого:',
                            style: AppTypography.semi18.copyWith(fontSize: 20),
                          ),
                          Text(
                            viewModel.totalString,
                            style: AppTypography.semi18.copyWith(fontSize: 20),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpaceSmall,
              if (viewModel.isDelivery && viewModel.selectedAddress != null ||
                  !viewModel.isDelivery)
                Stack(
                  children: [
                    AButtonFilled(
                      text: 'Оформить заказ',
                      onPressed: () {
                        viewModel.onPay();
                      },
                    ),
                    if (viewModel.isPaymentProcess)
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration:
                              const BoxDecoration(color: Colors.white60),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.red,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  OrderConfirmSheetModel viewModelBuilder(BuildContext context) =>
      OrderConfirmSheetModel();
}
