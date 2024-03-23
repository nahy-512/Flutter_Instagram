import 'package:flutter/material.dart';
import 'package:instagram/src/widgets/image_data.dart';

import '../../widgets/login2/button_widget.dart';
import '../../widgets/login2/textfield_default_widget.dart';

class SignupNameScreen extends StatefulWidget {
  const SignupNameScreen({super.key});

  @override
  State<SignupNameScreen> createState() => _SignupNameScreenState();
}

class _SignupNameScreenState extends State<SignupNameScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool _isButtonEnabled = false;

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
                    _nameTextField(),
                    const SizedBox(height: 20,),
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
      return const Text('사용자 이름 만들기',
        style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      );
    }

    Widget _contentText() {
      return const Text(
        '새 계정에 사용할 사용자 이름을 선택하세요. 나중에 언제든지 변경할 수 있습니다.',
        style: TextStyle(
            fontSize: 12,
            color: Colors.black54,
            fontWeight: FontWeight.w400
        ),
        textAlign: TextAlign.center,
      );
    }

  Widget _nameTextField() {
    return DefaultTextField2(
      controller: _nameController,
      hintText: '사용자 이름',
      onChanged: (value) {
        _updateButtonState();
      },
    );
  }

  Widget _nextButton() {
    return ButtonWidget2(title: "다음", isValid: _isButtonEnabled,);
  }

  void _updateButtonState() {
    setState(() {
      //TODO: 닉네임 유효성 검사
      // TextField의 값이 비어있지 않으면 버튼 활성화
      _isButtonEnabled = _nameController.text.isNotEmpty;
    });
  }
}