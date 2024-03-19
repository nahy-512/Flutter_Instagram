import 'package:flutter/material.dart';
import 'package:instagram/src/widgets/image_data.dart';

class PasswordTextField2 extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;

  const PasswordTextField2({super.key,
    required this.controller,
    this.labelText = "비밀번호"
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
        obscureText: _passwordHide,
        cursorColor: Colors.black54,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFFAFAFA),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          hintText: widget.labelText,
          hintStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 14,
          ),
          suffixIcon: IconButton(
          onPressed: onIconPressed,
            icon: _passwordHide
                ? ImageIcon(AssetImage(IconsPath.pwdOff), size: 20, color: Colors.black26)
                : ImageIcon(AssetImage(IconsPath.pwdOn), size: 20, color: Colors.blueAccent)
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