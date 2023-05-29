import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../res/theme/app_colors.dart';

class ABackButton extends StatelessWidget {
  const ABackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      onPressed: locator<NavigationService>().back,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 8),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.red,
        ),
        child: Icon(
          Icons.arrow_back_ios,
          color: AppColors.white,
          size: 24,
        ),
      ),
    );
  }
}
