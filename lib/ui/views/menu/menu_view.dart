import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:scrollview_observer/scrollview_observer.dart';
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
      child: SliverViewObserver(
        sliverContexts: () {
          return [
            if (viewModel.listCtx != null) viewModel.listCtx!,
          ];
        },
        autoTriggerObserveTypes: const [
          ObserverAutoTriggerObserveType.scrollUpdate,
        ],
        triggerOnObserveType:
            ObserverTriggerOnObserveType.displayingItemsChange,
        controller: viewModel.observerController,
        onObserveAll: (resultMap) {
          final model1 = resultMap[viewModel.listCtx];
          if (model1 != null &&
              model1.visible &&
              model1 is ListViewObserveModel) {
            viewModel.onObserve(model1);
          }
        },
        child: CustomScrollView(
          controller: viewModel.listScrollController,
          slivers: [
            SliverToBoxAdapter(
                child: viewModel.isAuth
                    ? viewModel.addresses.isNotEmpty
                        ? SizedBox(
                            height: 62,
                            child: DropdownButton<AddressDTO>(
                              value: viewModel.selectedAddress,
                              borderRadius: BorderRadius.circular(16),
                              itemHeight: 56,
                              isExpanded: true,
                              items: viewModel.addresses
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          e.shortAddress,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (v) => viewModel.selectAddress(v!),
                              selectedItemBuilder: (BuildContext context) {
                                return viewModel.addresses.map((v) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    alignment: Alignment.centerLeft,
                                    constraints:
                                        const BoxConstraints(minWidth: 100),
                                    child: Text(
                                      v.shortAddress,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                          )
                        : TextButton(
                            onPressed: () => viewModel.onAddAddressTap(),
                            child: const Text('Добавить адрес'))
                    : TextButton(
                        onPressed: () => viewModel.onRegTap(),
                        child: const Text('Авторизация'))),
            if (viewModel.news.isNotEmpty == true)
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                sliver: SliverAppBar(
                  backgroundColor: AppColors.white,
                  flexibleSpace: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    scrollDirection: Axis.horizontal,
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
              key: viewModel.appBarKey,
              pinned: true,
              automaticallyImplyLeading: false,
              expandedHeight: 54,
              toolbarHeight: 54,
              surfaceTintColor: Colors.white,
              shadowColor: Colors.white,
              flexibleSpace: ListViewObserver(
                controller: viewModel.tabsObserverController,
                child: ListView.builder(
                  controller: viewModel.tabsScrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: viewModel.categories.length,
                  itemBuilder: (ctx, index) {
                    return CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      onPressed: () => viewModel.onMenuItemTap(
                          index,
                          MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height - 150),
                      child: SizedBox(
                        height: 36,
                        child: MenuBadge(
                          text: viewModel.categories[index].displayName,
                          isActive: index == viewModel.currentCategoryIndex,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList.separated(
                // controller: viewModel.listScrollController,
                itemCount: viewModel.categories.length,
                itemBuilder: (ctx, index) {
                  viewModel.listCtx = ctx;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: viewModel.categories[index].products
                        .map((e) => DishCard(
                              dishDataModel: e,
                              onTap: () {
                                viewModel.onDishTap(e);
                              },
                            ))
                        .toList(),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(
                  height: 10,
                ),
              ),
            )
          ],
        ),
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
