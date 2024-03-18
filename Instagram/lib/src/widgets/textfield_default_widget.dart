import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String labelText;

  const DefaultTextField({super.key,
    required this.labelText
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        cursorColor: Colors.black54,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          labelText: labelText,
          labelStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 14
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