/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/add.svg
  SvgGenImage get add => const SvgGenImage('assets/icons/add.svg');

  /// File path: assets/icons/addresses.svg
  SvgGenImage get addresses => const SvgGenImage('assets/icons/addresses.svg');

  /// File path: assets/icons/arrow_back.svg
  SvgGenImage get arrowBack => const SvgGenImage('assets/icons/arrow_back.svg');

  /// File path: assets/icons/close.svg
  SvgGenImage get close => const SvgGenImage('assets/icons/close.svg');

  /// File path: assets/icons/contacts.svg
  SvgGenImage get contacts => const SvgGenImage('assets/icons/contacts.svg');

  /// File path: assets/icons/edit.svg
  SvgGenImage get edit => const SvgGenImage('assets/icons/edit.svg');

  /// File path: assets/icons/info.svg
  SvgGenImage get info => const SvgGenImage('assets/icons/info.svg');

  /// File path: assets/icons/inst.svg
  SvgGenImage get inst => const SvgGenImage('assets/icons/inst.svg');

  /// File path: assets/icons/mail.svg
  SvgGenImage get mail => const SvgGenImage('assets/icons/mail.svg');

  /// File path: assets/icons/menu.svg
  SvgGenImage get menu => const SvgGenImage('assets/icons/menu.svg');

  /// File path: assets/icons/new_stick.svg
  SvgGenImage get newStick => const SvgGenImage('assets/icons/new_stick.svg');

  /// File path: assets/icons/no_photo.svg
  SvgGenImage get noPhoto => const SvgGenImage('assets/icons/no_photo.svg');

  /// File path: assets/icons/placeholder.svg
  SvgGenImage get placeholder =>
      const SvgGenImage('assets/icons/placeholder.svg');

  /// File path: assets/icons/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/icons/profile.svg');

  /// File path: assets/icons/promotions.svg
  SvgGenImage get promotions =>
      const SvgGenImage('assets/icons/promotions.svg');

  /// File path: assets/icons/refresh.svg
  SvgGenImage get refresh => const SvgGenImage('assets/icons/refresh.svg');

  /// File path: assets/icons/sale_stick.svg
  SvgGenImage get saleStick => const SvgGenImage('assets/icons/sale_stick.svg');

  /// File path: assets/icons/settings.svg
  SvgGenImage get settings => const SvgGenImage('assets/icons/settings.svg');

  /// File path: assets/icons/shopping_cart.svg
  SvgGenImage get shoppingCart =>
      const SvgGenImage('assets/icons/shopping_cart.svg');

  /// File path: assets/icons/status.svg
  SvgGenImage get status => const SvgGenImage('assets/icons/status.svg');

  /// File path: assets/icons/tel.svg
  SvgGenImage get tel => const SvgGenImage('assets/icons/tel.svg');

  /// File path: assets/icons/vector.svg
  SvgGenImage get vector => const SvgGenImage('assets/icons/vector.svg');

  /// File path: assets/icons/vk.svg
  SvgGenImage get vk => const SvgGenImage('assets/icons/vk.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        add,
        addresses,
        arrowBack,
        close,
        contacts,
        edit,
        info,
        inst,
        mail,
        menu,
        newStick,
        noPhoto,
        placeholder,
        profile,
        promotions,
        refresh,
        saleStick,
        settings,
        shoppingCart,
        status,
        tel,
        vector,
        vk
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/contacts.jpeg
  AssetGenImage get contacts =>
      const AssetGenImage('assets/images/contacts.jpeg');

  /// File path: assets/images/empty_cart.png
  AssetGenImage get emptyCart =>
      const AssetGenImage('assets/images/empty_cart.png');

  /// File path: assets/images/logo_with_text.png
  AssetGenImage get logoWithText =>
      const AssetGenImage('assets/images/logo_with_text.png');

  /// File path: assets/images/logo_with_text_black.png
  AssetGenImage get logoWithTextBlack =>
      const AssetGenImage('assets/images/logo_with_text_black.png');

  /// File path: assets/images/no_image.png
  AssetGenImage get noImage =>
      const AssetGenImage('assets/images/no_image.png');

  /// File path: assets/images/placeholer_promotions.png
  AssetGenImage get placeholerPromotions =>
      const AssetGenImage('assets/images/placeholer_promotions.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        contacts,
        emptyCart,
        logoWithText,
        logoWithTextBlack,
        noImage,
        placeholerPromotions
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
