import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:stacked/stacked.dart';

import 'menu_viewmodel.dart';
import 'widgets/dish/dish_card.dart';
import 'widgets/menu_badge.dart';
import 'widgets/promotion_card.dart';

class MenuView extends StackedView<MenuViewModel> {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MenuViewModel viewModel,
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
      child: CustomScrollView(
        controller: viewModel.scrollController,
        slivers: [
          SliverToBoxAdapter(child: TextButton(onPressed: viewModel.onPay, child: Text('test payment'))),
          // SliverAppBar(
          //   backgroundColor: AppColors.white,
          //   title: CupertinoButton(
          //     onPressed: () {},
          //     child: const Text(''),
          //   ),
          //   centerTitle: true,
          //   expandedHeight: 70,
          //   toolbarHeight: 70,
          // ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            sliver: SliverAppBar(
              backgroundColor: AppColors.white,
              flexibleSpace: PageView(
                controller: viewModel.promotionsControler,
                children: List.generate(
                  viewModel.news.length,
                  (index) => PromotionCard(
                    image: viewModel.news[index].photoUrl,
                    onPressed: () {
                      viewModel.onPromotionTap(viewModel.news[index]);
                    },
                  ),
                ),
              ),
              expandedHeight: 150,
              toolbarHeight: 150,
            ),
          ),
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.white,
            shadowColor: AppColors.white,
            elevation: 0,
            surfaceTintColor: AppColors.white,
            expandedHeight: 54,
            toolbarHeight: 54,
            flexibleSpace: Container(
              margin: const EdgeInsets.symmetric(vertical: 7),
              height: 30,
              child: ScrollablePositionedList.builder(
                itemScrollController: viewModel.menuScrollController,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemCount: viewModel.categories.length,
                itemBuilder: (_, index) => CupertinoButton(
                  padding: EdgeInsets.zero,
                  minSize: 0,
                  onPressed: () => viewModel.onMenuItemTap(index),
                  child: MenuBadge(
                    text: viewModel.categories[index].name,
                    isActive: index == viewModel.currentCategoryIndex,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            sliver: SliverFillRemaining(
              child: ScrollablePositionedList.separated(
                itemScrollController: viewModel.itemScrollController,
                itemPositionsListener: viewModel.itemPositionsListener,
                itemCount: viewModel.categories.length,
                itemBuilder: (_, index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: viewModel.categories[index].products
                      .map((e) => DishCard(
                            dishDataModel: e,
                            onTap: () {
                              viewModel.onDishTap(e);
                            },
                          ))
                      .toList(),
                ),
                separatorBuilder: (_, __) => const SizedBox(
                  height: 10,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  MenuViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MenuViewModel();

  @override
  void onViewModelReady(MenuViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.onReady());
}
