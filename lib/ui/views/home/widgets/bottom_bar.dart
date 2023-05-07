import 'package:flutter/material.dart';
import 'package:maestroni/services/home_menu_service.dart';

import '../../../../res/theme/app_colors.dart';
import '../../../../res/theme/app_typography.dart';

typedef BottomMenuCallback = Function(int page);

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({
    required this.onTap,
    required this.index,
    this.cartCount = 1,
    Key? key,
  }) : super(key: key);
  final BottomMenuCallback onTap;
  final int index;
  final int cartCount;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: onTap,
      selectedLabelStyle: AppTypography.semi10Red,
      unselectedLabelStyle: AppTypography.semi10,
      unselectedItemColor: AppColors.black,
      backgroundColor: AppColors.lightGrey,
      selectedItemColor: AppColors.red,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      items: HomePage.values
          .map(
            (e) => BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 6, top: 5),
                      child: e.icon(isSelected: HomePage.values[index] == e),
                    ),
                  ),
                  if (cartCount > 0 && e == HomePage.shoppingCart)
                    Positioned(
                      top: -2,
                      right: 20,
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: AppColors.red, shape: BoxShape.circle),
                        child: Text(
                          cartCount.toString(),
                          style: AppTypography.semi10White
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                ],
              ),
              label: e.name(),
            ),
          )
          .toList(),
    );
  }
}
