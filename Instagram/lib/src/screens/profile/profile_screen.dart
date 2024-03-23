import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/image_avatar.dart';
import '../../widgets/image_data.dart';

class ProfileScreen extends StatelessWidget {
  final String name;

  const ProfileScreen({super.key,
    this.name = 'nah25_01'
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        reverse: false,
        scrollDirection: Axis.vertical,
        slivers: [
          _appBar(),
          _profileLayout()
        ],
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      floating: true,
      // snap: true,
      expandedHeight: 50,
      elevation: 0.4,
      shadowColor: Colors.black12,
      title: _appBarUserName(),
      actions: [
        GestureDetector( // 만들기
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ImageData(path: IconsPath.uploadOff),
          ),
        ),
        GestureDetector( // 설정 및 활동
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ImageData(path: IconsPath.burger),
          ),
        ),
      ],
    );
  }

  Widget _profileLayout() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _myInfoLayout(),
            const SizedBox(height: 4,),
            _descriptionLayout(),
            const SizedBox(height: 16,),
            _buttonLayout()
          ],
        ),
      ),
    );
  }

  Widget _myInfoLayout() { // 유저 프로필 + 게시물 & 팔로우 정보
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _profileImage(),
        const SizedBox(width: 8,),
        Flexible(
            fit: FlexFit.tight,
            child: _followInfoLayout()
        )
      ],
    );
  }

  Widget _descriptionLayout() { // 이름, 소개, 링크 등
    return Text(
      '김나현',
      style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
    );
  }

  Widget _buttonLayout() {
    return Container(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buttonWidget('프로필 편집'),
          const SizedBox(width: 8,),
          _buttonWidget('프로필 공유'),
          const SizedBox(width: 8,),
          _recommendButtonWidget()
        ],
      ),
    );
  }

  Widget _appBarUserName() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(width: 6,),
        ImageData(
          path: IconsPath.arrowDown,
          width: 44,
        ),
      ],
    );
  }

  Widget _profileImage() {
    return ImageAvatar(
      avatarType: AvatarType.profile,
      borderType: BorderType.my,
      url: IconsPath.myProfileUrl,
    );
  }

  Widget _followInfoLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _followInfoWidget(11, '게시물'),
        _followInfoWidget(258, '팔로워'),
        _followInfoWidget(274, '팔로잉')
      ],
    );
  }

  Widget _followInfoWidget(int count, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text( // 숫자
          count.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 4,),
        Text(
          title,
          style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w400
          ),
        ),
      ],
    );
  }

  Widget _buttonWidget(String title) {
    return Expanded(
      child: TextButton(
        onPressed: (){},
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xFFF7F7F7),
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _recommendButtonWidget() {
    return Container(
      width: 35,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: IconButton(
        onPressed: (){},
        icon: SvgPicture.asset(IconsPath.friendRecommendOff),
      ),
    );
  }
}