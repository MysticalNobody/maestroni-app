import 'package:flutter/cupertino.dart';
import 'package:maestroni/res/assets/assets.gen.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:maestroni/res/theme/app_typography.dart';

class AAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AAppBar({
    required this.title,
    this.action,
    this.withPop = true,
    Key? key,
  }) : super(key: key);
  final String title;
  final Widget? action;
  final bool withPop;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (withPop)
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    minSize: 0,
                    onPressed: Navigator.of(context).pop,
                    child: Assets.icons.arrowBack.svg(height: 24),
                  )
                else
                  const SizedBox(width: 60),
                if (action != null) const SizedBox(width: 40),
                Text(
                  title,
                  style: AppTypography.semi18White,
                ),
                if (action != null)
                  SizedBox(
                    width: 100,
                    child: action,
                  )
                else
                  const SizedBox(width: 60),
              ],
            )),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 70);
}
