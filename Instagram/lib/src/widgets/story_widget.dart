import 'package:flutter/material.dart';
import 'package:instagram/src/widgets/image_avatar.dart';

import 'image_data.dart';

class Story extends StatelessWidget {
  const Story({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageAvatar(
              type: AvatarValue.storyDefault,
              url: IconsPath.myProfileUrl,
            ),
            const SizedBox(height: 8,),
            Text(
              'nickname',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}