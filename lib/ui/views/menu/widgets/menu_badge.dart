import 'package:flutter/material.dart';

import '../../../../res/theme/app_colors.dart';
import '../../../../res/theme/app_typography.dart';

class MenuBadge extends StatelessWidget {
  const MenuBadge(
      {required this.text,
      this.margin,
      this.padding,
      this.style,
      this.isActive = false,
      Key? key})
      : super(key: key);
  final String text;
  final TextStyle? style;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: margin ?? const EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.center,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              border: Border.all(
                color: isActive ? AppColors.red : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            text,
            style: style ??
                (isActive
                    ? AppTypography.med16.copyWith(color: AppColors.black)
                    : AppTypography.med16Grey.copyWith(color: AppColors.grey)),
          ),
        ),
      ],
    );
  }
}
