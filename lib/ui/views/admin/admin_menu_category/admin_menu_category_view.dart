import 'package:flutter/material.dart';
import 'package:maestroni/data/models/category_dto.dart';
import 'package:maestroni/res/theme/app_typography.dart';
import 'package:reorderables/reorderables.dart';
import 'package:stacked/stacked.dart';

import '../../../../res/theme/app_colors.dart';
import 'admin_menu_category_viewmodel.dart';

class AdminMenuCategoryView extends StackedView<AdminMenuCategoryViewModel> {
  const AdminMenuCategoryView({required this.initCategory, required this.catIndex, Key? key}) : super(key: key);

  final CategoryDTO initCategory;
  final int catIndex;

  @override
  Widget builder(
    BuildContext context,
    AdminMenuCategoryViewModel viewModel,
    Widget? child,
  ) {
    final Color oddItemColor = AppColors.red.withOpacity(0.05);
    final Color evenItemColor = AppColors.red.withOpacity(0.15);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Редактирование категории'),
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
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Text(
                                    'Название в r_keeper',
                                    style: AppTypography.med14,
                                  ),
                                  Text(
                                    viewModel.category.name,
                                    style: AppTypography.semi18,
                                  ),
                                ]),
                              ),
                              IconButton(
                                  onPressed: () =>
                                      viewModel.updateActive(!(viewModel.category.displayData?.isActive ?? true)),
                                  icon: Icon(viewModel.category.displayData?.isActive ?? true
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Text(
                                    'Название в приложении',
                                    style: AppTypography.med14,
                                  ),
                                  Text(
                                    viewModel.category.displayName,
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
                                  controller: viewModel.categoryNameController,
                                  style: TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600),
                                  cursorColor: AppColors.red,
                                  onTapOutside: (_) => FocusScope.of(
                                    context,
                                  ).unfocus(),
                                  decoration: InputDecoration(
                                      hintText: 'Изменить название в приложении',
                                      border: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.lightGrey)),
                                      enabledBorder:
                                          UnderlineInputBorder(borderSide: BorderSide(color: AppColors.lightGrey)),
                                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.red)),
                                      fillColor: AppColors.red,
                                      focusColor: AppColors.red,
                                      hoverColor: AppColors.red,
                                      iconColor: AppColors.red),
                                ),
                              ),
                              IconButton(onPressed: () => viewModel.updateName(), icon: const Icon(Icons.save))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: !viewModel.isBusy
                        ? ReorderableColumn(
                            children: List.generate(
                              viewModel.items.length,
                              (index) => ListTile(
                                key: ValueKey(viewModel.items[index].id),
                                leading: Icon(viewModel.items[index].displayData?.isActive ?? true
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                tileColor: index.isOdd ? oddItemColor : evenItemColor,
                                onTap: () => viewModel.onItemTap(viewModel.items[index]),
                                title: Text(viewModel.items[index].displayName),
                                trailing: Icon(
                                  Icons.reorder_rounded,
                                  color: AppColors.red,
                                ),
                              ),
                            ),
                            onReorder: (i1, i2) => viewModel.onReorder(i1, i2),
                          )
                        : Center(
                            child: CircularProgressIndicator(
                              color: AppColors.red,
                            ),
                          ),
                  ),
                ],
              ));
  }

  @override
  AdminMenuCategoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AdminMenuCategoryViewModel(initCategory: initCategory, catIndex: catIndex);
}
