import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maestroni/res/assets/assets.gen.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:maestroni/res/theme/app_typography.dart';
import 'package:maestroni/ui/widgets/app_button.dart';
import 'package:stacked/stacked.dart';

import 'contacts_viewmodel.dart';

class ContactsView extends StackedView<ContactsViewModel> {
  const ContactsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ContactsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(height: 260, child: Assets.images.map.svg(fit: BoxFit.contain)),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: AButtonFilled(
                      text: 'Наши точки на карте',
                      onPressed: () => viewModel.toMap(),
                    ),
                  ))),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          CupertinoButton(
            onPressed: () => viewModel.toCall1(),
            padding: const EdgeInsets.only(left: 16, right: 32),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    Icons.local_phone_rounded,
                    color: AppColors.red,
                    size: 48,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '68-08-48',
                      style: AppTypography.semi18,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Режим работы с 10:00 до 22:00',
                      style: AppTypography.med14.copyWith(color: AppColors.grey),
                    )
                  ],
                ))
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          CupertinoButton(
            onPressed: () => viewModel.toCall2(),
            padding: const EdgeInsets.only(left: 16, right: 32),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    Icons.phone_iphone,
                    color: AppColors.red,
                    size: 48,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '8 (928) 558-05-58',
                      style: AppTypography.semi18,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Нажмите, чтобы позвонить',
                      style: AppTypography.med14.copyWith(color: AppColors.grey),
                    )
                  ],
                ))
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          // CupertinoButton(
          //   onPressed: () => viewModel.toMail(),
          //   padding: const EdgeInsets.only(left: 16, right: 32),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 8),
          //         child: Icon(
          //           Icons.mail_outline,
          //           color: AppColors.red,
          //           size: 48,
          //         ),
          //       ),
          //       const SizedBox(
          //         width: 8,
          //       ),
          //       Expanded(
          //           child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             'chiki@gmail.com',
          //             style: AppTypography.semi18,
          //           ),
          //           const SizedBox(
          //             height: 8,
          //           ),
          //           Text(
          //             'Повседневная практика показывает, что реализация намеченных плановых ',
          //             style: AppTypography.med14.copyWith(color: AppColors.grey),
          //           )
          //         ],
          //       ))
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'Maestroni\nв соц сетях:',
                    style: AppTypography.semi18,
                  ),
                ),
                // CupertinoButton(
                //     padding: const EdgeInsets.symmetric(horizontal: 16),
                //     onPressed: () => viewModel.toVk(),
                //     child: Assets.images.vk.svg(height: 48, width: 48, fit: BoxFit.contain)),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => viewModel.toInst(),
                    child: Assets.images.insta.svg(height: 48, width: 48, fit: BoxFit.contain))
              ],
            ),
          ),
          Divider(
            color: AppColors.darkGrey,
            endIndent: 32,
            indent: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: TextButton(onPressed: () => viewModel.toPolitics(), child: const Text('Правовые документы')),
          )
        ],
      ),
    );
  }

  @override
  ContactsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ContactsViewModel();
}
