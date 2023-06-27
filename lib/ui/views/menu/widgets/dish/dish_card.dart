import 'package:auto_size_text/auto_size_text.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maestroni/data/models/item_dto.dart';
import 'package:maestroni/res/assets/assets.gen.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:stacked/stacked.dart';

import '../../../../../res/theme/app_typography.dart';
import 'dish_card_view_model.dart';

class DishCard extends StackedView<DishCardViewModel> {
  const DishCard({
    required this.dishDataModel,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final ItemDTO dishDataModel;
  final VoidCallback onTap;

  @override
  Widget builder(
      BuildContext context, DishCardViewModel viewModel, Widget? child) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: onTap,
            child: dishDataModel.imageUrls.isEmpty
                ? ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.3,
                      width: MediaQuery.of(context).size.width * 0.3,
                      alignment: Alignment.center,
                      child: Assets.images.noImage.image(
                        height: MediaQuery.of(context).size.width * 0.3,
                        width: MediaQuery.of(context).size.width * 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    child: FastCachedImage(
                      url: dishDataModel.imageUrls.elementAtOrNull(0) ?? '',
                      height: MediaQuery.of(context).size.width * 0.3,
                      width: MediaQuery.of(context).size.width * 0.3,
                      fit: BoxFit.cover,
                      errorBuilder: (context, exception, stacktrace) {
                        return Text(stacktrace.toString());
                      },
                      loadingBuilder: (context, progress) {
                        return Container(
                          color: Colors.white,
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.width * 0.3,
                              child: Center(
                                  child: CircularProgressIndicator(
                                      color: AppColors.red,
                                      value: progress
                                          .progressPercentage.value))),
                        );
                      },
                      fadeInDuration: const Duration(milliseconds: 300),
                    )),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.width*0.3, maxHeight: MediaQuery.of(context).size.width),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dishDataModel.displayName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        AppTypography.semi18.copyWith(color: AppColors.black),
                  ),
                  AutoSizeText(
                    dishDataModel.description,
                    style: AppTypography.med10Grey,
                    maxLines: 3,
                    minFontSize: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 7),
                  // if (viewModel.currentItemCount == 0 || !inCart)
                  //   MenuBadge(
                  //     text: '${(dishDataModel.price).toStringAsFixed(0)} ₽',
                  //     style: AppTypography.med14.copyWith(color: AppColors.black),
                  //     isActive: true,
                  //     padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
                  //     margin: EdgeInsets.zero,
                  //   )
            
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  if (viewModel.currentItemCount != 0)
                    Container(
                      height: 36,
                      width: 120,
                      decoration: BoxDecoration(
                          color: AppColors.red,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () => viewModel.removeFromCart(),
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              )),
                          Text(
                            viewModel.currentItemCount.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () => viewModel.addToCart(),
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    )
                  else
                    GestureDetector(
                      onTap: () => viewModel.addToCart(),
                      child: Container(
                        height: 36,
                        width: 120,
                        decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  Text(
                    '${dishDataModel.price.toStringAsFixed(0)} ₽',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  DishCardViewModel viewModelBuilder(BuildContext context) =>
      DishCardViewModel(dishDataModel);
}
