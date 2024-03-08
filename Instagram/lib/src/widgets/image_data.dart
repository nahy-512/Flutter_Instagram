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
  static String get homeOff => 'assets/images/ic_home_unselected.svg';
  static String get homeOn => 'assets/images/ic_home_selected.svg';
  static String get searchOff => 'assets/images/ic_search_unselected.svg';
  static String get searchOn => 'assets/images/ic_search_selected.svg';
  static String get uploadOff => 'assets/images/ic_add_unselected.svg';
  static String get uploadOn => 'assets/images/ic_add_selected.svg';
  static String get reelsOff => 'assets/images/ic_reels_unselected.svg';
  static String get reelsOn => 'assets/images/ic_reels_selected.svg';
}