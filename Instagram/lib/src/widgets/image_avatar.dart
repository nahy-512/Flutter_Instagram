import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AvatarType { bottom, story }
enum BorderType { none, color, gradient }
enum AvatarValue {
  bottomOn(AvatarType.bottom, BorderType.color),
  bottomOff(AvatarType.bottom, BorderType.none),
  storyDefault(AvatarType.story, BorderType.color);

  const AvatarValue(this.avatarType, this.borderType);
  final AvatarType avatarType;
  final BorderType borderType;
}

class ImageAvatar extends StatelessWidget {
  final double width;
  final String url;
  final AvatarValue type;
  const ImageAvatar(
      {super.key, this.width = 80, required this.url, required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvatarValue.bottomOn:
        return _bottomProfileOnImage();
      case AvatarValue.bottomOff:
        return _bottomProfileOffImage();
      case AvatarValue.storyDefault:
        return _baseImageContainer();
    }
  }

  Widget _bottomProfileOffImage() {
    return SizedBox(
      width: width / Get.mediaQuery.devicePixelRatio,
      child: CircleAvatar(
        child: _baseImageContainer()
      ),
    );
  }

  Widget _bottomProfileOnImage() {
    return SizedBox(
      width: width / Get.mediaQuery.devicePixelRatio,
      child: CircleAvatar(child: _baseImageContainerWithBorder(Colors.black))
    );
  }

  Widget _basicImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.network(
        url,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _baseImageContainer() {
    return Container(
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100.0)),
      child: _basicImage(),
    );
  }

  Widget _baseImageContainerWithBorder(Color borderColor) {
    return Container(
        padding: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(100.0)),
        child: _baseImageContainer(),
    );
  }
}