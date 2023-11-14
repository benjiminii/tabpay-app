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

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesHomeGen get home => const $AssetsImagesHomeGen();
  $AssetsImagesIntroductionGen get introduction =>
      const $AssetsImagesIntroductionGen();
  $AssetsImagesLoginGen get login => const $AssetsImagesLoginGen();
  $AssetsImagesNumpadGen get numpad => const $AssetsImagesNumpadGen();
}

class $AssetsImagesHomeGen {
  const $AssetsImagesHomeGen();

  /// File path: assets/images/home/Nfc_icon.png
  AssetGenImage get nfcIcon =>
      const AssetGenImage('assets/images/home/Nfc_icon.png');

  /// File path: assets/images/home/Visa_logo.png
  AssetGenImage get visaLogo =>
      const AssetGenImage('assets/images/home/Visa_logo.png');

  /// File path: assets/images/home/failed-icon.png
  AssetGenImage get failedIcon =>
      const AssetGenImage('assets/images/home/failed-icon.png');

  /// File path: assets/images/home/more_grid_icon.png
  AssetGenImage get moreGridIcon =>
      const AssetGenImage('assets/images/home/more_grid_icon.png');

  /// File path: assets/images/home/nfc_scan.png
  AssetGenImage get nfcScan =>
      const AssetGenImage('assets/images/home/nfc_scan.png');

  /// File path: assets/images/home/profile_avatar_icon.png
  AssetGenImage get profileAvatarIcon =>
      const AssetGenImage('assets/images/home/profile_avatar_icon.png');

  /// File path: assets/images/home/success_icon.png
  AssetGenImage get successIcon =>
      const AssetGenImage('assets/images/home/success_icon.png');

  /// File path: assets/images/home/transaction_incoming.png
  AssetGenImage get transactionIncoming =>
      const AssetGenImage('assets/images/home/transaction_incoming.png');

  /// File path: assets/images/home/transaction_outgoing.png
  AssetGenImage get transactionOutgoing =>
      const AssetGenImage('assets/images/home/transaction_outgoing.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        nfcIcon,
        visaLogo,
        failedIcon,
        moreGridIcon,
        nfcScan,
        profileAvatarIcon,
        successIcon,
        transactionIncoming,
        transactionOutgoing
      ];
}

class $AssetsImagesIntroductionGen {
  const $AssetsImagesIntroductionGen();

  /// File path: assets/images/introduction/Intro_bg_1.png
  AssetGenImage get introBg1 =>
      const AssetGenImage('assets/images/introduction/Intro_bg_1.png');

  /// File path: assets/images/introduction/intro_1.png
  AssetGenImage get intro1 =>
      const AssetGenImage('assets/images/introduction/intro_1.png');

  /// File path: assets/images/introduction/intro_2.png
  AssetGenImage get intro2 =>
      const AssetGenImage('assets/images/introduction/intro_2.png');

  /// File path: assets/images/introduction/intro_bg_2.png
  AssetGenImage get introBg2 =>
      const AssetGenImage('assets/images/introduction/intro_bg_2.png');

  /// File path: assets/images/introduction/intro_bg_3.png
  AssetGenImage get introBg3 =>
      const AssetGenImage('assets/images/introduction/intro_bg_3.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [introBg1, intro1, intro2, introBg2, introBg3];
}

class $AssetsImagesLoginGen {
  const $AssetsImagesLoginGen();

  /// File path: assets/images/login/Check_icon.svg
  SvgGenImage get checkIcon =>
      const SvgGenImage('assets/images/login/Check_icon.svg');

  /// File path: assets/images/login/Login.png
  AssetGenImage get login =>
      const AssetGenImage('assets/images/login/Login.png');

  /// File path: assets/images/login/Login_otp.png
  AssetGenImage get loginOtp =>
      const AssetGenImage('assets/images/login/Login_otp.png');

  /// File path: assets/images/login/Phone_number_icon.svg
  SvgGenImage get phoneNumberIcon =>
      const SvgGenImage('assets/images/login/Phone_number_icon.svg');

  /// List of all assets
  List<dynamic> get values => [checkIcon, login, loginOtp, phoneNumberIcon];
}

class $AssetsImagesNumpadGen {
  const $AssetsImagesNumpadGen();

  /// File path: assets/images/numpad/Arrow_Left.svg
  SvgGenImage get arrowLeft =>
      const SvgGenImage('assets/images/numpad/Arrow_Left.svg');

  /// File path: assets/images/numpad/NumXButton.svg
  SvgGenImage get numXButton =>
      const SvgGenImage('assets/images/numpad/NumXButton.svg');

  /// List of all assets
  List<SvgGenImage> get values => [arrowLeft, numXButton];
}

class Assets {
  Assets._();

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
      // colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
