import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maestroni/res/assets/assets.gen.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:maestroni/res/theme/app_typography.dart';
import 'package:maestroni/ui/widgets/app_bar.dart';
import 'package:maestroni/ui/widgets/app_button.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.isLoggedIn) {
      return Scaffold(
        appBar: const AAppBar(
          title: 'Профиль',
          withPop: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                '+79995148885',
                style: AppTypography.med22,
              ),
              const SizedBox(height: 12),
              Divider(
                color: AppColors.darkGrey,
              ),
              const SizedBox(height: 24),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  viewModel.onOrdersTap();
                },
                child: Row(
                  children: [
                    Assets.icons.menu.svg(
                      height: 24,
                      color: const Color(0xff737373),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Ваши заказы',
                      style: AppTypography.med18,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  viewModel.onAddressesTap();
                },
                child: Row(
                  children: [
                    Assets.icons.addresses.svg(height: 24),
                    const SizedBox(width: 12),
                    Text(
                      'Адреса доставки',
                      style: AppTypography.med18,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              AButtonFilled(
                text: 'Выход',
                onPressed: () {
                  viewModel.onTapLogout();
                },
              )
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: const AAppBar(
        title: 'Профиль',
        withPop: false,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 45),
          child: Column(
            children: [
              Assets.images.logoWithTextBlack.image(width: 170),
              const SizedBox(height: 35),
              AutoSizeText(
                'Давайте знакомиться!',
                style: AppTypography.med22,
                maxLines: 1,
              ),
              const SizedBox(height: 20),
              AutoSizeText(
                'Повседневная практика показывает, что реализация намеченных плановых заданий влечет за собой процесс внедрения',
                style: AppTypography.med10Grey,
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              AButtonFilled(
                text: 'Указать телефон',
                onPressed: () {
                  viewModel.onTapLogin();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
