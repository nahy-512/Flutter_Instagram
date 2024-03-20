import 'package:flutter/material.dart';

class DefaultTextField2 extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const DefaultTextField2({super.key,
    required this.controller,
    required this.hintText,
    this.onChanged
  });

  @override
  State<DefaultTextField2> createState() => _DefaultTextField2State();
}

class _DefaultTextField2State extends State<DefaultTextField2> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged, // 외부에서 전달된 onChanged 콜백 사용
        cursorColor: Colors.black54,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFFAFAFA),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: -4),
          hintText: widget.hintText,
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

  String get textValue => widget.controller.text;
}