import 'package:flutter/material.dart';
import 'package:instagram/src/widgets/login2/textfield_password_widget.dart';

import '../../widgets/login2/button_widget.dart';

class SignupPasswordScreen extends StatefulWidget {
  const SignupPasswordScreen({super.key});

  @override
  State<SignupPasswordScreen> createState() => _SignupPwdScreen();
}

class _SignupPwdScreen extends State<SignupPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _titleText(),
                    const SizedBox(height: 16,),
                    _contentText(),
                    const SizedBox(height: 20,),
                    _pwdTextField(),
                    _checkBox(),
                    _nextButton()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleText() {
    return const Text(
      '비밀번호 만들기',
      style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _contentText() {
    return const Text(
      '보안을 위해 비밀번호는 6자 이상이어야 합니다.',
      style: TextStyle(
          fontSize: 12,
          color: Colors.black54,
          fontWeight: FontWeight.w400
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _checkBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 0.8,
          child: Checkbox(
            value: isChecked,
            onChanged: (bool? newValue) {
              setState(() {
                isChecked = newValue!;
              });
            },
            activeColor: Colors.blueAccent,
            checkColor: Colors.white,
          ),
        ),
        const Text(
          '비밀번호 저장',
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black54
          ),
        ),
      ],
    );
  }

  Widget _pwdTextField() {
    return PasswordTextField2(
      controller: _passwordController,
      hintText: '비밀번호',
      onChanged: (value) {
        _updateButtonState();
      },
      showPwdButton: false,
    );
  }

  Widget _nextButton() {
    return ButtonWidget2(
      title: "다음",
      isValid: _isButtonEnabled,
      nextScreen: null,
    );
  }

  void _updateButtonState() {
    setState(() {
      //TODO: 비밀번호 유효성 검사
      // TextField의 값이 비어있지 않으면 버튼 활성화
      _isButtonEnabled = _passwordController.text.isNotEmpty;
    });
  }
}