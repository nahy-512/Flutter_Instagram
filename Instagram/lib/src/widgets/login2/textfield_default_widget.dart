import 'package:flutter/material.dart';

class DefaultTextField2 extends StatelessWidget {
  final String hintText;

  const DefaultTextField2({super.key,
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        cursorColor: Colors.black54,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFFAFAFA),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: -4),
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 14,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(width: 0.3, color: Colors.black12),
          ),
          focusedBorder: const OutlineInputBorder( // border 스타일로 지정
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(width: 0.5, color: Colors.black12),
          ),
        ),
      ),
    );
  }

}