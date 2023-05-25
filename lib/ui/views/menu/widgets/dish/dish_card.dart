import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maestroni/data/models/item_dto.dart';
import 'package:maestroni/res/assets/assets.gen.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:stacked/stacked.dart';

import '../../../../../res/theme/app_typography.dart';
import '../menu_badge.dart';
import 'dish_card_view_model.dart';

class DishCard extends StackedView<DishCardViewModel> {
  const DishCard({
    required this.dishDataModel,
    required this.onTap,
    Key? key,
    this.inCart = false,
  }) : super(key: key);
  final ItemDTO dishDataModel;
  final VoidCallback onTap;
  final bool inCart;

  @override
  Widget builder(BuildContext context, DishCardViewModel viewModel, Widget? child) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(vertical: 12),
      minSize: 0,
      onPressed: onTap,
      child: Row(
        children: [
          if (dishDataModel.imageUrls.isEmpty)
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              child: Container(
                height: 120,
                width: 120,
                alignment: Alignment.center,
                child: Assets.images.noImage.image(
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            )
          else
            ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                child: FastCachedImage(
                  url: dishDataModel.imageUrls.elementAtOrNull(0) ?? '',
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, exception, stacktrace) {
                    return Text(stacktrace.toString());
                  },
                  loadingBuilder: (context, progress) {
                    return Container(
                      color: Colors.yellow,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          if (progress.isDownloading && progress.totalBytes != null)
                            Text('${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                                style: const TextStyle(color: Colors.red)),
                          SizedBox(
                              width: 120,
                              height: 120,
                              child: CircularProgressIndicator(
                                  color: Colors.red, value: progress.progressPercentage.value)),
                        ],
                      ),
                    );
                  },
                  fadeInDuration: const Duration(milliseconds: 300),
                )),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dishDataModel.name,
                  style: AppTypography.med16.copyWith(color: AppColors.black),
                ),
                const SizedBox(height: 7),
                AutoSizeText(
                  dishDataModel.description,
                  style: AppTypography.med10Grey,
                  maxLines: inCart ? 3 : 4,
                  minFontSize: 10,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 7),
                if (viewModel.currentItemCount == 0 || !inCart)
                  MenuBadge(
                    text: '${(dishDataModel.price).toStringAsFixed(0)} Р',
                    style: AppTypography.med14.copyWith(color: AppColors.black),
                    isActive: true,
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
                    margin: EdgeInsets.zero,
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CupertinoButton(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.red,
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
                            onPressed: () {
                              viewModel.removeFromCart();
                            },
                          ),
                          SizedBox(
                            width: 20,
                            child: Center(
                              child: Text(
                                viewModel.currentItemCount.toString(),
                                style: AppTypography.med16.copyWith(color: AppColors.black),
                              ),
                            ),
                          ),
                          CupertinoButton(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            minSize: 0,
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.red,
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
                            onPressed: () {
                              viewModel.addToCart();
                            },
                          ),
                        ],
                      ),
                      Text(
                        '${(dishDataModel.price).toStringAsFixed(0)} Р',
                        style: AppTypography.med16.copyWith(color: AppColors.black),
                      ),
                    ],
                  )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  DishCardViewModel viewModelBuilder(BuildContext context) => DishCardViewModel(dishDataModel);
}
