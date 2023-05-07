import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maestroni/res/assets/assets.gen.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:maestroni/ui/views/contacts/contacts_view.dart';
import 'package:maestroni/ui/views/menu/menu_view.dart';
import 'package:maestroni/ui/views/profile/profile_view.dart';
import 'package:maestroni/ui/views/shopping_cart/shopping_cart_view.dart';
import 'package:stacked/stacked.dart';

enum HomePage { menu, profile, contacts, shoppingCart }

/// Экстеншны для перечисления [HomePage]
extension HomePageName on HomePage {
  /// Экстеншн для получения имени по элементу перечисления [HomePage]
  String name() {
    switch (this) {
      case HomePage.menu:
        return 'Меню';
      case HomePage.profile:
        return 'Профиль';
      case HomePage.contacts:
        return 'Контакты';
      case HomePage.shoppingCart:
        return 'Корзина';
    }
  }

  /// Экстеншн для получения экранта по элементу перечисления [HomePage]
  Widget screen() {
    switch (this) {
      case HomePage.menu:
        return const MenuView();
      case HomePage.profile:
        return const ProfileView();
      case HomePage.contacts:
        return const ContactsView();
      case HomePage.shoppingCart:
        return const ShoppingCartView();
    }
  }

  /// Экстеншн для получения иконки по элементу перечисления [HomePage]
  SvgPicture icon({bool isSelected = true}) {
    double kIconHeight = 20;
    Color kIconColor = isSelected ? AppColors.red : AppColors.black;
    switch (this) {
      case HomePage.menu:
        return Assets.icons.menu.svg(height: kIconHeight, color: kIconColor);
      case HomePage.profile:
        return Assets.icons.profile.svg(height: kIconHeight, color: kIconColor);
      case HomePage.contacts:
        return Assets.icons.contacts
            .svg(height: kIconHeight, color: kIconColor);
      case HomePage.shoppingCart:
        return Assets.icons.shoppingCart
            .svg(height: kIconHeight, color: kIconColor);
    }
  }
}

class HomeMenuService with ListenableServiceMixin {
  HomeMenuService() {
    listenToReactiveValues([page]);
  }
  ReactiveValue<HomePage> page = ReactiveValue(HomePage.menu);

  void changePage(int index) {
    page.value = HomePage.values[index];
  }
}
