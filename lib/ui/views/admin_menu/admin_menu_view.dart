import 'package:flutter/material.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'admin_menu_viewmodel.dart';

class AdminMenuView extends StackedView<AdminMenuViewModel> {
  const AdminMenuView({Key? key}) : super(key: key);

  _onItemReorder(int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    // setState(() {
    //   var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
    //   _contents[newListIndex].children.insert(newItemIndex, movedItem);
    // });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    // setState(() {
    //   var movedList = _contents.removeAt(oldListIndex);
    //   _contents.insert(newListIndex, movedList);
    // });
  }
  @override
  Widget builder(
    BuildContext context,
    AdminMenuViewModel viewModel,
    Widget? child,
  ) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
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
                  title: Text(viewModel.categories[index].name),
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
