import 'package:flutter/material.dart';
import 'package:maestroni/data/models/category_dto.dart';
import 'package:maestroni/res/theme/app_typography.dart';
import 'package:stacked/stacked.dart';

import '../../../res/theme/app_colors.dart';
import 'admin_menu_category_viewmodel.dart';

class AdminMenuCategoryView extends StackedView<AdminMenuCategoryViewModel> {
  const AdminMenuCategoryView({required this.category, required this.catIndex, Key? key}) : super(key: key);

  final CategoryDTO category;
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
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () => viewModel.addNews(),
        //   icon: const Icon(Icons.add),
        //   backgroundColor: AppColors.red,
        //   label: const Text('Добавить'),
        // ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width ,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  category.name,
                  style: AppTypography.semi18,
                ),
              ),
            ),
            Expanded(
              child: !viewModel.isBusy
                  ? ReorderableListView.builder(
                      itemCount: viewModel.items.length,
                      itemBuilder: (context, index) => ListTile(
                        key: Key('${viewModel.items[index].id}'),
                        tileColor: index.isOdd ? oddItemColor : evenItemColor,
                        onTap: () => viewModel.onItemTap(viewModel.items[index]),
                        title: Text('$index.${viewModel.items[index].name}'),
                        trailing: Icon(
                          Icons.reorder_rounded,
                          color: AppColors.red,
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
      AdminMenuCategoryViewModel(category: category, catIndex: catIndex);
}
