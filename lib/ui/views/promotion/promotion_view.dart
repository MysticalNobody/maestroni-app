import 'package:flutter/material.dart';
import 'package:maestroni/data/models/news_dto.dart';
import 'package:maestroni/res/theme/app_typography.dart';
import 'package:maestroni/ui/views/menu/widgets/promotion_card.dart';
import 'package:maestroni/ui/widgets/app_back_button.dart';
import 'package:stacked/stacked.dart';

import 'promotion_viewmodel.dart';

class PromotionView extends StackedView<PromotionViewModel> {
  const PromotionView({required this.promotion, Key? key}) : super(key: key);
  final NewsDTO promotion;

  @override
  Widget builder(
    BuildContext context,
    PromotionViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: ABackButton(),
            ),
            const SizedBox(height: 12),
            Expanded(
                child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PromotionCard(image: promotion.photoUrl),
                  const SizedBox(height: 12),
                  Text(
                    promotion.description,
                    style: AppTypography.med14,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  @override
  PromotionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PromotionViewModel();
}
