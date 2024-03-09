import 'package:flutter/material.dart';

import '../../widgets/image_avatar.dart';
import '../../widgets/image_data.dart';
import '../../widgets/story_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //로고
        title: _appBarLogo(),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(path: IconsPath.alert),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(path: IconsPath.dm),
            ),
          ),
        ],
      ),
      body: _storyView()
    );
  }

  Widget _appBarLogo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageData(
          path: IconsPath.logo,
          width: 300,
        ),
        const SizedBox(width: 6,),
        ImageData(
          path: IconsPath.arrowDown,
          width: 44,
        ),
      ],
    );
  }

  Widget _storyView() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const Story(type: AvatarValue.storyMy),
            ...List.generate(
              10,
                  (index) => const Story(type: AvatarValue.storyDefault),
            ),
          ],
        )
    );
  }
}