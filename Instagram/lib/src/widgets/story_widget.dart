import 'package:flutter/material.dart';
import 'package:instagram/src/widgets/image_avatar.dart';

import 'image_data.dart';

class Story extends StatelessWidget {

  final AvatarValue type;

  const Story({super.key,
    required this.type
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageAvatar(
              type: type,
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
    if (type == AvatarValue.storyMy) {
      return IconsPath.myProfileUrl;
    } else {
      return IconsPath.otherProfileUrl;
    }
  }

  Widget _setText() {
    if (type == AvatarValue.storyMy) {
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