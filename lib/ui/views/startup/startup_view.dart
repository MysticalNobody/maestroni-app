import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:maestroni/res/assets/assets.gen.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        color: AppColors.red,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.icons.iconPng
                  .image(width: MediaQuery.of(context).size.width / 2)
                  .animate()
                  .moveY(
                    begin: MediaQuery.of(context).size.height,
                    end: 1,
                    curve: Curves.easeInOutCubicEmphasized,
                    duration: const Duration(milliseconds: 1000),
                  )
                  .shimmer(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 3000),
                  )
                  .animate(onPlay: (controller) => controller.repeat())
                  .rotate(duration: const Duration(milliseconds: 3000))
            ],
          ),
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) =>
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
