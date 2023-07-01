/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/addresses.svg
  SvgGenImage get addresses => const SvgGenImage('assets/icons/addresses.svg');

  /// File path: assets/icons/arrow_back.svg
  SvgGenImage get arrowBack => const SvgGenImage('assets/icons/arrow_back.svg');

  /// File path: assets/icons/close.svg
  SvgGenImage get close => const SvgGenImage('assets/icons/close.svg');

  /// File path: assets/icons/contacts.svg
  SvgGenImage get contacts => const SvgGenImage('assets/icons/contacts.svg');

  /// File path: assets/icons/icon.jpg
  AssetGenImage get iconJpg => const AssetGenImage('assets/icons/icon.jpg');

  /// File path: assets/icons/icon.png
  AssetGenImage get iconPng => const AssetGenImage('assets/icons/icon.png');

  /// File path: assets/icons/inst.svg
  SvgGenImage get inst => const SvgGenImage('assets/icons/inst.svg');

  /// File path: assets/icons/menu.svg
  SvgGenImage get menu => const SvgGenImage('assets/icons/menu.svg');

  /// File path: assets/icons/no_photo.svg
  SvgGenImage get noPhoto => const SvgGenImage('assets/icons/no_photo.svg');

  /// File path: assets/icons/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/icons/profile.svg');

  /// File path: assets/icons/shopping_cart.svg
  SvgGenImage get shoppingCart =>
      const SvgGenImage('assets/icons/shopping_cart.svg');

  /// File path: assets/icons/status.svg
  SvgGenImage get status => const SvgGenImage('assets/icons/status.svg');

  /// File path: assets/icons/tel.svg
  SvgGenImage get tel => const SvgGenImage('assets/icons/tel.svg');

  /// File path: assets/icons/vk.svg
  SvgGenImage get vk => const SvgGenImage('assets/icons/vk.svg');

  /// List of all assets
  List<dynamic> get values => [
        addresses,
        arrowBack,
        close,
        contacts,
        iconJpg,
        iconPng,
        inst,
        menu,
        noPhoto,
        profile,
        shoppingCart,
        status,
        tel,
        vk
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/empty_cart.png
  AssetGenImage get emptyCart =>
      const AssetGenImage('assets/images/empty_cart.png');

  /// File path: assets/images/logo_with_text_black.png
  AssetGenImage get logoWithTextBlack =>
      const AssetGenImage('assets/images/logo_with_text_black.png');

  /// File path: assets/images/map.svg
  SvgGenImage get map => const SvgGenImage('assets/images/map.svg');

  /// File path: assets/images/no_image.png
  AssetGenImage get noImage =>
      const AssetGenImage('assets/images/no_image.png');

  /// List of all assets
  List<dynamic> get values => [emptyCart, logoWithTextBlack, map, noImage];
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

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
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
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
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
