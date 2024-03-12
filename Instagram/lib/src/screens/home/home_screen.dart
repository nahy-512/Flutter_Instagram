import 'package:flutter/material.dart';

import '../../widgets/feed_widget.dart';
import '../../widgets/image_avatar.dart';
import '../../widgets/image_data.dart';
import '../../widgets/story_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        reverse: false,
        scrollDirection: Axis.vertical,
        slivers: [
          _appBar(),
          _storyView(),
          _feedView()
        ]
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      floating: true,
      // snap: true,
      expandedHeight: 50,
      title: _appBarLogo(), //로고
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ImageData(path: IconsPath.alert),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ImageData(path: IconsPath.dm),
          ),
        ),
      ],
    );
  }

  Widget _storyView() {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Story(type: AvatarValue.storyMy),
              ...List.generate(
                6,
                    (index) => const Story(type: AvatarValue.storyDefault),
              ),
            ],
          ),
      ),
    );
  }

  Widget _feedView() {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ...List.generate(4,
                  (index) => Column(
                    children: [
                      Feed(userName: "mongi"),
                      const SizedBox(height: 14,)
                    ],
                  )
            ),
          ],
        ),
      ),
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
}