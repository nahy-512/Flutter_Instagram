import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ImageData extends StatelessWidget {
  final String path;
  final double? width;

  const ImageData({
    super.key,
    required this.path,
    this.width = 70, //기본값은 항상 70
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: width! / Get.mediaQuery.devicePixelRatio,
    );
  }
  /*
  icon: SvgPicture.asset(
    'assets/icons/ic_seal.svg',
    color: Colors.blueAccent,
  ),
   */
}

class IconsPath {
  static String basePath = 'assets/images';

  static String get myProfileUrl => 'https://cdn.discordapp.com/attachments/1124558739211558993/1215771754308571146/autumncocoa.jpg?ex=65fdf6ae&is=65eb81ae&hm=e9177ec52036f9a2e405d0bb2583d31486f6a621a451feac4a424a9ad5a6584d&';
  // Bottom Nav Icon
  static String get homeOff => '$basePath/ic_home_unselected.svg';
  static String get homeOn => '$basePath/ic_home_selected.svg';
  static String get searchOff => '$basePath/ic_search_unselected.svg';
  static String get searchOn => '$basePath/ic_search_selected.svg';
  static String get uploadOff => '$basePath/ic_add_unselected.svg';
  static String get uploadOn => '$basePath/ic_add_selected.svg';
  static String get reelsOff => '$basePath/ic_reels_unselected.svg';
  static String get reelsOn => '$basePath/ic_reels_selected.svg';
  // Common
  static String get arrowDown => '$basePath/ic_arrow_down.svg';
  // Home
  static String get logo => '$basePath/logo_text.svg';
  static String get alert => '$basePath/ic_heart.svg';
  static String get dm => '$basePath/ic_share.svg';
}