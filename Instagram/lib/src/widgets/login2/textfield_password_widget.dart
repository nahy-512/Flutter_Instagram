import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:instagram/src/widgets/image_data.dart';

class PasswordTextField2 extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final bool showPwdButton;


  const PasswordTextField2({super.key,
    required this.controller,
    this.hintText = "비밀번호",
    this.onChanged,
    this.showPwdButton = true
  });

  @override
  State<PasswordTextField2> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField2> {
  var _passwordHide = true; // 비밀번호 숨김 여부

  void onIconPressed() {
    setState(() {
      _passwordHide = !_passwordHide;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged, // 외부에서 전달된 onChanged 콜백 사용
        obscureText: _passwordHide,
        cursorColor: Colors.black54,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFFAFAFA),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 14,
          ),
          suffixIcon: widget.showPwdButton ? IconButton(
            onPressed: onIconPressed,
            icon: _passwordHide
                ? ImageIcon(AssetImage(IconsPath.pwdOff), size: 20, color: Colors.black26)
                : ImageIcon(AssetImage(IconsPath.pwdOn), size: 20, color: Colors.blueAccent)
            ) : null,
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