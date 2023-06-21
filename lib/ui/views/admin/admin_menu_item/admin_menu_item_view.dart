import 'package:flutter/material.dart';
import 'package:maestroni/data/models/item_dto.dart';
import 'package:stacked/stacked.dart';

import '../../../../res/theme/app_colors.dart';
import '../../../../res/theme/app_typography.dart';
import 'admin_menu_item_viewmodel.dart';

class AdminMenuItemView extends StackedView<AdminMenuItemViewModel> {
  const AdminMenuItemView({required this.initItem, Key? key}) : super(key: key);

  final ItemDTO initItem;

  @override
  Widget builder(
    BuildContext context,
    AdminMenuItemViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Редактирование позиции'),
        ),
        body: viewModel.isBusy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Название в r_keeper',
                                        style: AppTypography.med14,
                                      ),
                                      Text(
                                        viewModel.item.name,
                                        style: AppTypography.semi18,
                                      ),
                                    ]),
                              ),
                              IconButton(
                                  onPressed: () => viewModel.updateActive(
                                      !(viewModel.item.displayData?.isActive ??
                                          true)),
                                  icon: Icon(
                                      viewModel.item.displayData?.isActive ??
                                              true
                                          ? Icons.visibility
                                          : Icons.visibility_off)),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Название в приложении',
                                        style: AppTypography.med14,
                                      ),
                                      Text(
                                        viewModel.item.displayName,
                                        style: AppTypography.semi18,
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: viewModel.itemNameController,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600),
                                  cursorColor: AppColors.red,
                                  onTapOutside: (_) => FocusScope.of(
                                    context,
                                  ).unfocus(),
                                  decoration: InputDecoration(
                                      hintText:
                                          'Изменить название в приложении',
                                      border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.lightGrey)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.lightGrey)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: AppColors.red)),
                                      fillColor: AppColors.red,
                                      focusColor: AppColors.red,
                                      hoverColor: AppColors.red,
                                      iconColor: AppColors.red),
                                ),
                              ),
                              IconButton(
                                  onPressed: () => viewModel.updateName(),
                                  icon: const Icon(Icons.save))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
  }

  @override
  AdminMenuItemViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AdminMenuItemViewModel(initItem: initItem);
}
