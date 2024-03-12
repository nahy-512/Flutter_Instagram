import 'package:flutter/material.dart';
import 'package:instagram/src/widgets/image_data.dart';

enum AvatarType {
  bottom(24, 0.5, 1),
  story(78, 2, 2.5),
  feed(32, 1, 1.5);

  const AvatarType(this.imageWidth, this.interval, this.borderWidth);
  final double imageWidth; // 이미지 크기
  final double interval; // 이미지-테두리 간격
  final double borderWidth; // 테두리 크기
}

enum BorderType { none, color, gradient, my }

class ImageAvatar extends StatelessWidget {
  final String url;
  final AvatarType avatarType;
  final BorderType borderType;
  const ImageAvatar(
      {super.key, required this.url, required this.avatarType, required this.borderType});

  @override
  Widget build(BuildContext context) {
    switch (borderType) {
      case BorderType.none:
        return _noneBolderImage();
      case BorderType.color:
        return _colorBolderImage();
      case BorderType.gradient:
        return _gradientBolderImage();
      case BorderType.my:
        return _myImage();
    }
  }

  Widget _noneBolderImage() {
    return Container(
      padding: EdgeInsets.all(avatarType.borderWidth),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0)),
      child: _baseImageContainer(),
    );
  }

  Widget _colorBolderImage() {
    Color borderColor = (avatarType == AvatarType.bottom) ? Colors.black : Colors.greenAccent;
    return Container(
      padding: EdgeInsets.all(avatarType.borderWidth),
      decoration: BoxDecoration(
          color: borderColor,
          borderRadius: BorderRadius.circular(100.0)),
      child: _baseImageContainer(),
    );
  }

  Widget _myImage() {
    return Padding(
      padding: const EdgeInsets.all(3.5),
      child: Stack( // 이미지가 겹칠 수 있도록 해줌
        children: [
          _baseImageContainer(),
          Positioned(
            // 위치 변경
            bottom: 0.5, // 하단부
            right: 0.5,	 // 우측
            child: Container( // + 버튼
              padding: EdgeInsets.all(avatarType.interval + 1),
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
    return Container( // 테두리
        padding: EdgeInsets.all(avatarType.borderWidth),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            // 스토리 영역의 테두리를
            // 그라데이션으로 줄 수 있음.
            gradient: _defaultGradient(),
        ),
        child: _baseImageContainer()
    );
  }

  Widget _baseImageContainer() {
    return Container(
      padding: EdgeInsets.all(avatarType.interval), // 테두리와의 간격
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100.0)
      ),
      child: _basicImage(),
    );
  }

  Widget _basicImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        width: avatarType.imageWidth,
        height: avatarType.imageWidth,
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
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