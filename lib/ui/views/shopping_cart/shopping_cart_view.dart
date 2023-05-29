import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:maestroni/res/assets/assets.gen.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:maestroni/res/theme/app_typography.dart';
import 'package:maestroni/ui/views/menu/widgets/dish/dish_card.dart';
import 'package:maestroni/ui/widgets/app_bar.dart';
import 'package:maestroni/ui/widgets/app_button.dart';
import 'package:stacked/stacked.dart';

import 'shopping_cart_viewmodel.dart';

class ShoppingCartView extends StackedView<ShoppingCartViewModel> {
  const ShoppingCartView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ShoppingCartViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AAppBar(
        title: 'Корзина',
        withPop: false,
      ),
      body: viewModel.isEmpty
          ? Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 19),
                  child: Assets.images.emptyCart.image(fit: BoxFit.contain),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Column(
                    children: [
                      AutoSizeText(
                        'Упс, пусто!',
                        style: AppTypography.med22,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 20),
                      AutoSizeText(
                        'Вы еще не добавили ни одного товара в корзину',
                        style: AppTypography.med10Grey,
                        maxLines: 4,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      AButtonFilled(
                        text: 'Перейти в меню',
                        onPressed: () {
                          viewModel.goToMenu();
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            )
          : Stack(
              children: [
                ListView.separated(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 100),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) => DishCard(
                    dishDataModel: viewModel.cart.keys.elementAt(index),
                    onTap: () {
                      viewModel.onDishTap(
                        viewModel.cart.keys.elementAt(index),
                      );
                    },
                  ),
                  itemCount: viewModel.cart.keys.length,
                ),
                Positioned(
                  bottom: 12,
                  left: 12,
                  right: 12,
                  child: AButtonFilled(
                    text:
                        'Оформить заказ на ${(viewModel.total).toStringAsFixed(0)} ₽',
                    onPressed: () {
                      viewModel.onOrderConfirm(context);
                    },
                  ),
                )
              ],
            ),
    );
  }

  @override
  ShoppingCartViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ShoppingCartViewModel();
}
