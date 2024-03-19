import 'package:flutter/material.dart';

class ButtonWidget2 extends StatelessWidget {
  final String title;

  final Color activateColor = const Color(0xFF0095F6);
  final Color inActivateColor = const Color(0xFF78C8F9);

  const ButtonWidget2({super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return _fillButton();
  }

  //TODO: 버튼 활성화 기능 추가
  Widget _fillButton() {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () => print('login button click!'),
        style: TextButton.styleFrom(
          backgroundColor: inActivateColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

}