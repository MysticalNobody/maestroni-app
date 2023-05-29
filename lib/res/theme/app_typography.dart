import 'package:flutter/material.dart';
import 'package:maestroni/res/assets/fonts.gen.dart';

import 'app_colors.dart';

class AppTypography {
  static TextStyle mainStyle = const TextStyle(fontFamily: FontFamily.montserrat);

  static TextStyle med32 = mainStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 32);

  static TextStyle med32Grey = mainStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 32, color: AppColors.grey);

  static TextStyle semi32White = mainStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 32, color: AppColors.white);

  static TextStyle med28 = mainStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 28);

  static TextStyle med28White = mainStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 28, color: AppColors.white);

  static TextStyle med28Grey = mainStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 28, color: AppColors.grey);

  static TextStyle med28DarkGrey = mainStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 28, color: AppColors.grey);

  static TextStyle semi26 = mainStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 26);

  static TextStyle med22 = mainStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 22);

  static TextStyle med22Grey = mainStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 22, color: AppColors.grey);

  static TextStyle med18 = mainStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.black);

  static TextStyle med18Grey = mainStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.grey);

  static TextStyle semi18 = mainStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.black);

  static TextStyle semi18White = mainStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.white);

  static TextStyle semi16Red = mainStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.red);

  static TextStyle med16 = mainStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 16);

  static TextStyle med16Grey = mainStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.grey);

  static TextStyle med14 = mainStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 14);

  static TextStyle med14White = mainStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.white);

  static TextStyle med12 = mainStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 12);

  static TextStyle semi10 = mainStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 10);

  static TextStyle semi10White = mainStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 10, color: AppColors.white);

  static TextStyle med10Grey = mainStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 10, color: AppColors.grey);

  static TextStyle semi10Red = mainStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 10, color: AppColors.red);
}
