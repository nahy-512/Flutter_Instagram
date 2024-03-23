import 'package:flutter/material.dart';
import 'package:instagram/src/app.dart';

import '../../widgets/login2/button_widget.dart';

class SignupFinishScreen extends StatefulWidget {
  final String name;

  const SignupFinishScreen({super.key,
    this.name = 'cocoa__log',
  });

  @override
  State<SignupFinishScreen> createState() => _SignupFinishScreenState();
}

class _SignupFinishScreenState extends State<SignupFinishScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 150,),
                    _titleText(),
                    const SizedBox(height: 12,),
                    _contentText(),
                    const SizedBox(height: 20,),
                    _nextButton(),
                    const SizedBox(height: 16,),
                    _addPhoneNumberOrEmail()
                  ],
                ),
              ),
              _bottomText(),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _titleText() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          '${widget.name}님, Instagram에 오신 것을 환영합니다',
          style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
      );
  }
  
  Widget _contentText() {
      return Text(
        'before의 이메일 주소와 전화번호가 ${widget.name}에 추가됩니다. 언제든지 연락처 정보와 사용자 이름을 변경할 수 있습니다.',
        style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
            fontWeight: FontWeight.w400
        ),
        textAlign: TextAlign.center,
      );
    }

  Widget _nextButton() {
    return const ButtonWidget2(
      title: "가입 완료하기",
      isValid: true,
      nextScreen: App(),
      popPrev: true,
    );
  }

  Widget _addPhoneNumberOrEmail() {
    return const Text(
      '새로운 전화번호 또는 이메일 주소 추가',
      textAlign: TextAlign.end,
      style: TextStyle(
          color: Color(0xFF0095F6),
          fontSize: 12,
          fontWeight: FontWeight.w400
      ),
    );
  }

  Widget _bottomText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'before의 개인 정보가 ${widget.name}에 추가됩니다. 약관 및 개인정보 처리방침을 확인해보세요.',
        style: const TextStyle(
            fontSize: 10,
            color: Colors.black54,
            fontWeight: FontWeight.w400
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}