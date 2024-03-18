import 'package:flutter/material.dart';

enum ButtonType { fill, outline }

class ButtonWidget extends StatelessWidget {
  final String title;
  final ButtonType buttonType;
  final Color buttonColor = const Color(0xFF0163E0);

  const ButtonWidget({super.key,
    required this.buttonType,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.fill:
        return _fillButton();
      case ButtonType.outline:
        return _outlineButton();
    }
  }

  Widget _fillButton() {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () => print('login button click!'),
        style: TextButton.styleFrom(
          backgroundColor: buttonColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _outlineButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () => print('create account button click!'),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          side: BorderSide(color: buttonColor, width: 1),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: buttonColor,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

}