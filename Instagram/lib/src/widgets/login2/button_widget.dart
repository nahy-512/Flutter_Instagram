import 'package:flutter/material.dart';

class ButtonWidget2 extends StatelessWidget {
  final String title;
  final bool isValid;
  final Color activateColor = const Color(0xFF0095F6);
  final Color inActivateColor = const Color(0xFF78C8F9);

  const ButtonWidget2({super.key,
    required this.title,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: isValid ? () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('login button click!'),
          ));
        } : null, // 비활성화된 상태일 때는 null을 전달하여 클릭 방지
        style: TextButton.styleFrom(
          backgroundColor: isValid ? activateColor : inActivateColor,
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