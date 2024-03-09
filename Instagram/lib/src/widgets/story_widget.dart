import 'package:flutter/material.dart';
import 'package:instagram/src/widgets/image_avatar.dart';

class Story extends StatelessWidget {
  const Story({super.key});

  @override
  Widget build(BuildContext context) {
    const String imageUrl = 'https://cdn.discordapp.com/attachments/1124558739211558993/1215771754308571146/autumncocoa.jpg?ex=65fdf6ae&is=65eb81ae&hm=e9177ec52036f9a2e405d0bb2583d31486f6a621a451feac4a424a9ad5a6584d&';

    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ImageAvatar(
              type: AvatarValue.storyDefault,
              url: imageUrl,
            ),
            SizedBox(height: 8,),
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