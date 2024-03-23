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
    if (path.contains('svg')) { // SVG
      return SvgPicture.asset(
        path,
        width: width! / Get.mediaQuery.devicePixelRatio,
      );
    } else { // PNG, ..
      return Image.asset(
        path,
        width: width! / Get.mediaQuery.devicePixelRatio,
      );
    }
  }
}

class IconsPath {
  static String basePath = 'assets/images';

  static String get myProfileUrl => 'https://github.com/nahy-512/Flutter_Instagram/assets/101113025/5fee343c-c7fa-45ee-838c-4d3022da2fcd';
  static String get otherProfileUrl => 'https://github.com/nahy-512/nahy-512/assets/101113025/3fb8e968-e482-4aff-9334-60c41014a80f';
  static String get mongiProfileUrl => 'https://github.com/nahy-512/nahy-512/assets/101113025/f16fcb86-dba3-46ca-9bf4-b6475db9305b';
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
  // Login
  static String get appIcon => '$basePath/ic_logo_transparent.svg';
  static String get metaLogo => '$basePath/ic_logo_meta.png';
  static String get pwdOff => '$basePath/ic_pwd_invisible.png';
  static String get pwdOn => '$basePath/ic_pwd_visible.png';
  static String get facebook => '$basePath/ic_facebook.png';
  // Home
  static String get logo => '$basePath/logo_text.svg';
  static String get alert => '$basePath/ic_heart.svg';
  static String get dm => '$basePath/ic_share.svg';
  static String get addStory => '$basePath/ic_add_story.svg';
  static String get more => '$basePath/ic_more.svg';
  static String get heartOff => '$basePath/ic_heart.svg';
  static String get chat => '$basePath/ic_chat.svg';
  static String get share => '$basePath/ic_share.svg';
  static String get save => '$basePath/ic_bookmark.svg';
  // Profile
  static String get burger => '$basePath/ic_burger.svg';
  static String get friendRecommendOff => '$basePath/ic_friend_recommend.svg';
  static String get friendRecommendOn => '$basePath/ic_friend_recommend_fill.svg';
  static String get accountLock => '$basePath/ic_lock.svg';
}