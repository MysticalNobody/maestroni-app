import 'package:flutter/cupertino.dart';

import '../../res/theme/app_colors.dart';
import '../../res/theme/app_typography.dart';

class AButtonFilled extends StatelessWidget {
  const AButtonFilled({required this.text, this.onPressed, Key? key})
      : super(key: key);
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.red, borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        alignment: Alignment.center,
        child: Text(
          text,
          style: AppTypography.med14White,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
