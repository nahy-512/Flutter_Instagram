import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/src/widgets/image_data.dart';

enum AvatarType { bottom, story }
enum BorderType { none, color, gradient, my }
enum AvatarValue {
  bottomOn(AvatarType.bottom, BorderType.color),
  bottomOff(AvatarType.bottom, BorderType.none),
  storyDefault(AvatarType.story, BorderType.gradient),
  storyMy(AvatarType.story, BorderType.none);

  const AvatarValue(this.avatarType, this.borderType);
  final AvatarType avatarType;
  final BorderType borderType;
}

class ImageAvatar extends StatelessWidget {
  final String url;
  final AvatarValue type;
  const ImageAvatar(
      {super.key, required this.url, required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvatarValue.bottomOff:
        return _noneBolderImage();
      case AvatarValue.bottomOn:
        return _colorBolderImage(type.avatarType);
      case AvatarValue.storyDefault:
        return _gradientBolderImage();
      case AvatarValue.storyMy:
        return _myStoryImage();
    }
  }

  Widget _noneBolderImage() {
    return SizedBox(
      width: _setImageWidthByType(type.avatarType),
      child: CircleAvatar(
        child: _baseImageContainer()
      ),
    );
  }

  Widget _colorBolderImage(AvatarType type) {
    return SizedBox(
      width: _setImageWidthByType(type),
      child: CircleAvatar(child: _baseImageContainerWithBorder(type))
    );
  }

  Widget _myStoryImage() {
    return Padding(
      padding: const EdgeInsets.all(3.5),
      child: Stack(
        children: [
          _basicImage(),
          Positioned(
            // 위치 변경
            bottom: 0.5, // 하단부
            right: 0.5,	 // 우측
            child: Container(
              padding: const EdgeInsets.all(3.0),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: ImageData(
                path: IconsPath.addStory,
                width: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _gradientBolderImage() {
    return Container(
        padding: const EdgeInsets.all(3.5),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            // 스토리 영역의 테두리를
            // 그라데이션으로 줄 수 있음.
            gradient: _defaultGradient(),
        ),
        child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: _basicImage(),
        ),
    );
  }

  Widget _basicImage() {
    double width = _setImageWidthByType(type.avatarType);
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        width: width,
        height: width,
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _baseImageContainer() {
    return Container(
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100.0)
      ),
      child: _basicImage(),
    );
  }

  Widget _baseImageContainerWithBorder(AvatarType type) {
    Color borderColor = (type == AvatarType.bottom) ? Colors.black : Colors.greenAccent;
    double borderWidth = (type == AvatarType.bottom) ? 1 : 2;
    return Container(
        padding: EdgeInsets.all(borderWidth),
        decoration: BoxDecoration(
            color: borderColor, borderRadius: BorderRadius.circular(100.0)),
        child: _baseImageContainer(),
    );
  }

  double _setImageWidthByType(AvatarType type) {
    return (type == AvatarType.bottom) ? 80 / Get.mediaQuery.devicePixelRatio : Get.size.width * 0.2;
  }

  Gradient _defaultGradient() {
    return const LinearGradient(
        // 시작 방향 지정
        begin: Alignment.bottomLeft,
        // 종료 되는 방향 지정
        end: Alignment.topRight,
        colors: [
          // hex 컬러
          Color(0xffffd200), // 노랑
          Color(0xfffc3a0a), // 빨강
          Color(0xffc80afc), // 보라
        ]
    );
  }
}