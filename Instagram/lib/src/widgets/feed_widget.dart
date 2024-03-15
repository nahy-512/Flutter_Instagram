import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/src/widgets/image_data.dart';

import 'image_avatar.dart';

class Feed extends StatelessWidget {
  final String userName;

  const Feed({super.key,
    required this.userName
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          _header(),
          _image(),
          _buttons(),
          _body()
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageAvatar( // 프로필 사진
                url: IconsPath.mongiProfileUrl,
                avatarType: AvatarType.feed,
                borderType: BorderType.none,
              ),
              const SizedBox(width: 8,),
              Text( // 계정 이름
                userName,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const Icon(Icons.more_horiz),
        ],
      ),
    );
  }

  Widget _image() {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.0, // 1:1 비율
          child: Image.network(
            IconsPath.otherProfileUrl,
            fit: BoxFit.cover, // 이미지를 화면에 꽉 채우도록 설정
          ),
        ),
      ],
    );
  }

  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton( // 좋아요
                onPressed: () {},
                icon: SvgPicture.asset(IconsPath.heartOff),
            ),
            IconButton( // 댓글
              onPressed: () {},
              icon: SvgPicture.asset(IconsPath.chat),
            ),
            IconButton( // 공유
              onPressed: () {},
              icon: SvgPicture.asset(IconsPath.share),
            ),
          ],
        ),
        IconButton( // 북마크
          onPressed: () {},
          icon: SvgPicture.asset(IconsPath.save),
        ),
      ],
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                text: '좋아요 ',
                style: TextStyle(
                    fontSize: 13, color: Colors.black
                ),
                children: [
                  TextSpan(
                    text: "10,922개",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4,),
            RichText(
              text: const TextSpan(
                text: 'mongi  ',
                style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: "부산 여행을 갔다. 여름이었ㄸr...",
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4,),
            Text("댓글 46개 모두 보기",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black45
              ),
            ),
            const SizedBox(height: 4,),
            Text("1월 25일",
              style: TextStyle(
                  fontSize: 11,
                  color: Colors.black45
              ),
            ),
          ],
        ),
      ),
    );
  }
}