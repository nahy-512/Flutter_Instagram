import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:instagram/src/controller/bottom_nav_controller.dart';
import 'package:instagram/src/screens/home/home_screen.dart';
import 'package:instagram/src/screens/profile/profile_screen.dart';
import 'package:instagram/src/screens/reels/reels_screen.dart';
import 'package:instagram/src/screens/search/search_screen.dart';
import 'package:instagram/src/screens/upload/upload_screen.dart';
import 'package:instagram/src/widgets/image_avatar.dart';
import 'package:instagram/src/widgets/image_data.dart';

class App extends GetView<BottomNavigationController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => WillPopScope(
        onWillPop: controller.popAction,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('App Bar'),
          ),
          body: _body(),
          bottomNavigationBar: _bottomNavigationBar(),
        ),
      ),
    );
  }

  Widget _bottomNavigationBar() {

    const String imageUrl = 'https://cdn.discordapp.com/attachments/1124558739211558993/1215771754308571146/autumncocoa.jpg?ex=65fdf6ae&is=65eb81ae&hm=e9177ec52036f9a2e405d0bb2583d31486f6a621a451feac4a424a9ad5a6584d&';

    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: controller.pageIndex, // 현재 페이지 인덱스
      onTap: controller.changeIndex, //페이지 이동 메서드
      items: [
        BottomNavigationBarItem(
            icon: ImageData(path: IconsPath.homeOff),
            activeIcon: ImageData(path: IconsPath.homeOn),
            label: 'home'),
        BottomNavigationBarItem(
            icon: ImageData(path: IconsPath.searchOff),
            activeIcon: ImageData(path: IconsPath.searchOn),
            label: 'search'),
        BottomNavigationBarItem(
            icon: ImageData(path: IconsPath.uploadOff),
            activeIcon: ImageData(path: IconsPath.uploadOn),
            label: 'upload'),
        BottomNavigationBarItem(
            icon: ImageData(path: IconsPath.reelsOff),
            activeIcon: ImageData(path: IconsPath.reelsOn),
            label: 'reels'),
        const BottomNavigationBarItem(
            icon: ImageAvatar(
              type: AvatarType.OFF,
              url: imageUrl,
            ),
            activeIcon: ImageAvatar(
              type: AvatarType.ON,
              url: imageUrl,
            ),
            label: 'profile'),
      ],
    );
  }

  Widget _body() {
    return IndexedStack(
      index: controller.pageIndex,
      children: const [
        HomeScreen(),
        SearchScreen(),
        UploadScreen(),
        ReelsScreen(),
        ProfileScreen(),
      ],
    );
  }
}