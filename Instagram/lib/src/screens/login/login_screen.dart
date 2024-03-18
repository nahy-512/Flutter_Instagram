import 'package:flutter/material.dart';
import 'package:instagram/src/widgets/button_widget.dart';
import 'package:instagram/src/widgets/textfield_default_widget.dart';
import 'package:instagram/src/widgets/textfield_password_widget.dart';

import '../../widgets/image_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: _loginGradient()
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _appLogo(),
                      const SizedBox(height: 80,),
                      const DefaultTextField(labelText: '사용자 이름, 이메일 주소 또는 휴대폰 번호'),
                      _defaultSpace(),
                      PasswordTextField(controller: passwordController,),
                      _defaultSpace(),
                      const ButtonWidget(buttonType: ButtonType.fill, title: "로그인"),
                      const SizedBox(height: 16,),
                      const Text("비밀번호를 잊으셨나요?",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const ButtonWidget(buttonType: ButtonType.outline, title: "새 계정 만들기"),
                    const SizedBox(height: 20,),
                    ImageData(
                      path: IconsPath.metaLogo,
                      width: 180,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appLogo() {
    return ImageData(
      path: IconsPath.appIcon,
      width: 180,
    );
  }

  Gradient _loginGradient() {
    return const LinearGradient(
      // 시작 방향 지정
        begin: Alignment.topLeft,
        // 종료 되는 방향 지정
        end: Alignment.bottomRight,
        colors: [
          // hex 컬러
          Color(0xFFFFF9F1), // 살구
          Color(0xFFFBF1FC), // 핑크
          Color(0xFFEDF4FC), // 하늘
          Color(0xFFECF5FC), // 하늘
          Color(0xFFF0FBF3), // 초록
        ]
    );
  }

  Widget _defaultSpace() {
    return const SizedBox(height: 12,);
  }
}