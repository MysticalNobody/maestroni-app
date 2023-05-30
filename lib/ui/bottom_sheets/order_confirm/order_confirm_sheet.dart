import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        expand: false,
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
          child: Stack(
            children: [
              ListView(
                shrinkWrap: true,
                controller: cc,
                primary: false,
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.only(bottom: 80),
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoSlidingSegmentedControl(
                      children: const {true: Text('Доставка'), false: Text('Самовывоз')},
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
                                                fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (v) => viewModel.selectAddress(v!),
                                selectedItemBuilder: (BuildContext context) {
                                  return viewModel.addresses.map((v) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      alignment: Alignment.centerLeft,
                                      constraints: const BoxConstraints(minWidth: 100),
                                      child: Text(
                                        v.fullAddress,
                                        style: TextStyle(
                                            fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600),
                                      ),
                                    );
                                  }).toList();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        surfaceTintColor: AppColors.red,
                        shadowColor: AppColors.red,
                        foregroundColor: AppColors.red,
                      ),
                      onPressed: () => viewModel.addAddress(),
                      icon: Icon(Icons.add, color: AppColors.red),
                      label: Text(
                        'Добавить адрес',
                        style: AppTypography.med16.copyWith(color: AppColors.red),
                      ),
                    ),
                  ] else ...[
                    Text(
                      'Выберите адрес для самовывоза',
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
                                              fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (v) => viewModel.selectRest(v!),
                              selectedItemBuilder: (BuildContext context) {
                                return viewModel.restorants.map((v) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    alignment: Alignment.centerLeft,
                                    constraints: const BoxConstraints(minWidth: 100),
                                    child: Text(
                                      v.actualAddress,
                                      style:
                                          TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600),
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
                    'Выберите способ оплаты',
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
                                            fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600),
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
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  alignment: Alignment.centerLeft,
                                  constraints: const BoxConstraints(minWidth: 100),
                                  child: Text(
                                    v.getString(),
                                    style: TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600),
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
                          style: TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600),
                          cursorColor: AppColors.red,
                          decoration: InputDecoration(
                              hintText: 'Комментарий к заказу',
                              border: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.lightGrey)),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.lightGrey)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.red)),
                              contentPadding: const EdgeInsets.only(left: 16),
                              fillColor: AppColors.red,
                              focusColor: AppColors.red,
                              hoverColor: AppColors.red,
                              iconColor: AppColors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    height: 6,
                    width: 60,
                    decoration: BoxDecoration(color: AppColors.darkGrey, borderRadius: BorderRadius.circular(6)),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Stack(
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
                          decoration: const BoxDecoration(color: Colors.white60),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.red,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  OrderConfirmSheetModel viewModelBuilder(BuildContext context) => OrderConfirmSheetModel();
}
