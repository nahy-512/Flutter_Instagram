import 'package:flutter/material.dart';
import 'package:instagram/src/widgets/login2/button_widget.dart';
import 'package:instagram/src/widgets/login2/textfield_default_widget.dart';
import 'package:instagram/src/widgets/login2/textfield_password_widget.dart';

import '../../widgets/image_data.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen2> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;
  final Color textColor = const Color(0xFF0095F6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _appLogo(),
                    const SizedBox(height: 30,),
                    _nameTextField(),
                    _defaultSpace(),
                    _pwdTextField(),
                    _defaultSpace(),
                    _forgetPwdText(),
                    const SizedBox(height: 16,),
                    _loginButton(),
                    _defaultSpace(),
                    _orSeparator(),
                    const SizedBox(height: 30,),
                    _facebookLogin(),
                  ],
                ),
              ),
            ),
            _bottomLayout(),
          ],
        ),
      ),
    );
  }

  Widget _appLogo() {
    return ImageData(
      path: IconsPath.logo,
      width: 500,
    );
  }

  Widget _nameTextField() {
    return DefaultTextField2(
        controller: _nameController,
        hintText: '전화번호, 사용자 이름 또는 이메일',
        onChanged: (value) {
          _updateButtonState();
        },
    );
  }

  Widget _pwdTextField() {
    return PasswordTextField2(
      controller: _passwordController,
      onChanged: (value) {
        _updateButtonState();
      },
    );
  }

  Widget _forgetPwdText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '비밀번호를 잊으셨나요?',
          textAlign: TextAlign.end,
          style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }

  Widget _loginButton() {
    return ButtonWidget2(title: "로그인", isValid: _isButtonEnabled,);
  }

  void _updateButtonState() {
    setState(() {
      // TextField의 값이 비어있지 않으면 버튼 활성화
      _isButtonEnabled = _nameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  Widget _orSeparator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(flex: 5,
            child: Container(height: 0.2, color: Colors.grey,)
        ),
        const Flexible(flex: 2,
          child: Text(
            '또는',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
                fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.end,
          ),
        ),
        Flexible(flex: 5,
            child: Container(height: 0.2, color: Colors.grey,)
        ),
      ],
    );
  }

  Widget _facebookLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageData(path: IconsPath.facebook, width: 50,),
        const SizedBox(width: 8,),
        Padding(
          padding: const EdgeInsets.only(top: 2), // 위로 2픽셀 내리기
          child: Text(
            'Facebook으로 로그인',
            textAlign: TextAlign.end,
            style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(height: 0.2, color: Colors.grey,),
        const SizedBox(height: 30,),
        RichText(
          text: TextSpan(
            text: '계정이 없으신가요? ',
            style: const TextStyle(
                fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w400
            ),
            children: [
              TextSpan(
                text: "가입하기",
                style: TextStyle(
                    fontSize: 12, color: textColor, fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _defaultSpace() {
    return const SizedBox(height: 12,);
  }
}