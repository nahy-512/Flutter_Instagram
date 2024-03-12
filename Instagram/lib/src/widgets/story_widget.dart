import 'package:flutter/material.dart';
import 'package:instagram/src/widgets/image_avatar.dart';

import 'image_data.dart';

class Story extends StatelessWidget {

  final BorderType borderType;

  const Story({super.key,
    required this.borderType
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageAvatar(
              avatarType: AvatarType.story,
              borderType: borderType,
              url: _setProfileImageUrl(),
            ),
            const SizedBox(height: 8,),
            _setText()
          ],
        ),
      ),
    );
  }

  String _setProfileImageUrl() {
    if (borderType == BorderType.my) {
      return IconsPath.myProfileUrl;
    } else {
      return IconsPath.otherProfileUrl;
    }
  }

  Widget _setText() {
    if (borderType == BorderType.my) {
      return const Text(
        '내 스토리',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black54,
        ),
      );
    } else {
      return const Text(
        'nickname',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
      );
    }
  }
}