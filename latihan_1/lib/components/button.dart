import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String
      text_button; // Parameter for button text (consider renaming to 'text')
  final VoidCallback onPressed; // Parameter for button action

  const Button({
    required this.text_button,
    required this.onPressed,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(StadiumBorder()),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      ),
      onPressed: onPressed,
      child: Text(text_button),
    );
  }
}
