import 'package:flutter/material.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:maestroni/services/home_menu_service.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';
import 'widgets/bottom_bar.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: IndexedStack(
        index: viewModel.page.index,
        children: HomePage.values
            .map(
              (e) => e.screen(),
            )
            .toList(),
      ),
      bottomNavigationBar: AppBottomBar(
        index: viewModel.page.index,
        onTap: viewModel.onChangePage,
        cartCount: viewModel.cartCount,
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
