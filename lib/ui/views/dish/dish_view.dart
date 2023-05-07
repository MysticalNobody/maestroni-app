import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maestroni/data/models/item_dto.dart';
import 'package:maestroni/res/assets/assets.gen.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:maestroni/res/theme/app_typography.dart';
import 'package:maestroni/ui/widgets/app_back_button.dart';
import 'package:maestroni/ui/widgets/app_button.dart';
import 'package:stacked/stacked.dart';

import 'dish_viewmodel.dart';

class DishView extends StackedView<DishViewModel> {
  const DishView({required this.dishDataModel, Key? key}) : super(key: key);
  final ItemDTO dishDataModel;

  @override
  Widget builder(
    BuildContext context,
    DishViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Stack(
                  children: [
                    if (dishDataModel.imageUrls.isEmpty)
                      Container(
                        height: 300,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Assets.images.noImage.image(
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      )
                    else
                      Image.network(
                        dishDataModel.imageUrls.elementAtOrNull(0) ?? '',
                        height: 300,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    const Positioned(
                      left: 16,
                      top: 16,
                      child: ABackButton(),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: CupertinoButton(
                          child: Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.red,
                              ),
                              child: Assets.icons.shoppingCart.svg(
                                  color: AppColors.white,
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.contain)),
                          onPressed: () {
                            viewModel.goToCart();
                          }),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dishDataModel.name,
                        style: AppTypography.semi26,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        dishDataModel.description,
                        style: AppTypography.med12,
                      ),
                      const SizedBox(height: 24),
                      if (dishDataModel.proteins > 0 ||
                          dishDataModel.fats > 0 ||
                          dishDataModel.carbohydrates > 0 ||
                          dishDataModel.energyValue > 0)
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 23, vertical: 29),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.black.withOpacity(.7),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: Column(children: [
                            Text('Пищевая ценность на 100г',
                                style: AppTypography.semi18White),
                            if (dishDataModel.energyValue > 0) ...[
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Энерг. ценность',
                                      style: AppTypography.med14White),
                                  Text('${dishDataModel.energyValue} ккал',
                                      style: AppTypography.med14White),
                                ],
                              ),
                            ],
                            if (dishDataModel.proteins > 0) ...[
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Белки',
                                      style: AppTypography.med14White),
                                  Text('${dishDataModel.proteins} г',
                                      style: AppTypography.med14White),
                                ],
                              ),
                            ],
                            const SizedBox(height: 12),
                            if (dishDataModel.fats > 0)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Жиры', style: AppTypography.med14White),
                                  Text('${dishDataModel.fats} г',
                                      style: AppTypography.med14White),
                                ],
                              ),
                            const SizedBox(height: 12),
                            if (dishDataModel.carbohydrates > 0)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Углеводы',
                                      style: AppTypography.med14White),
                                  Text('${dishDataModel.carbohydrates} г',
                                      style: AppTypography.med14White),
                                ],
                              ),
                          ]),
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  if (viewModel.count == 0)
                    AButtonFilled(
                      text:
                          'В корзину за ${(dishDataModel.price).toStringAsFixed(0)} Р',
                      onPressed: () {
                        viewModel.addToCart();
                      },
                    )
                  else
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            minSize: 0,
                            onPressed: viewModel.removeFromCart,
                            child: Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.red,
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.remove,
                                color: AppColors.red,
                              ),
                            ),
                          ),
                          Text(
                            '${((dishDataModel.price) * viewModel.count).toStringAsFixed(0)}Р (${viewModel.count} шт)',
                            style: AppTypography.med18,
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            minSize: 0,
                            onPressed: viewModel.addToCart,
                            child: Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.red,
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.add,
                                color: AppColors.red,
                              ),
                            ),
                          ),
                        ]),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  DishViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DishViewModel(dishDataModel);
}
