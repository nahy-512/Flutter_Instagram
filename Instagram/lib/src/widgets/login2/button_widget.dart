import 'package:flutter/material.dart';

class ButtonWidget2 extends StatelessWidget {
  final String title;
  final bool isValid;
  final Widget? nextScreen;
  final bool popPrev;
  final Color activateColor = const Color(0xFF0095F6);
  final Color inActivateColor = const Color(0xFF78C8F9);

  const ButtonWidget2({super.key,
    required this.title,
    required this.isValid,
    required this.nextScreen,
    this.popPrev = false
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        // 유효한 경우에만 버튼 클릭 이벤트 처리
        onPressed: isValid ? () {
          if (popPrev) { // 이전 스택을 모두 제거하고 이동
            Navigator.of(context)
                .pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => nextScreen!),
                  (route) => false
            );
          } else { // 스택 쌓기
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => nextScreen!, // 다음 화면의 Widget
              ),
            );
          }
        } : null, // 비활성화된 상태일 때는 null을 전달하여 클릭 방지
        style: TextButton.styleFrom(
          backgroundColor: isValid ? activateColor : inActivateColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
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