import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;

  const PasswordTextField({super.key,
    required this.controller,
    this.labelText = "비밀번호"
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
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
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          labelText: widget.labelText,
          labelStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 14
          ),
          suffixIcon: IconButton(
          onPressed: onIconPressed,
            icon: Icon(_passwordHide
              ? Icons.visibility_off
              : Icons.visibility,
              color: Colors.grey,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 1, color: Colors.black),
          ),
          border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}