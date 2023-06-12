import 'package:flutter/material.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'admin_menu_viewmodel.dart';

class AdminMenuView extends StackedView<AdminMenuViewModel> {
  const AdminMenuView({Key? key}) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    AdminMenuViewModel viewModel,
    Widget? child,
  ) {
    final Color oddItemColor = AppColors.red.withOpacity(0.05);
    final Color evenItemColor = AppColors.red.withOpacity(0.15);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Редактирование меню'),
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () => viewModel.addNews(),
        //   icon: const Icon(Icons.add),
        //   backgroundColor: AppColors.red,
        //   label: const Text('Добавить'),
        // ),
        body: !viewModel.isBusy
            ? ReorderableListView.builder(
                itemCount: viewModel.categories.length,
                itemBuilder: (context, index) => ListTile(
                  key: Key('${viewModel.categories[index].id}'),
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  onTap: () => viewModel.onCategoryTap(
                      viewModel.categories[index], index),
                  title: Text('$index.${viewModel.categories[index].name}'),
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
              ));
  }

  @override
  AdminMenuViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AdminMenuViewModel();
}
