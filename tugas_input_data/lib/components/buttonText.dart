import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String icon;
  final String Judul;
  final VoidCallback onPressed;

  CustomTextButton({
    required this.icon,
    required this.Judul,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          
          width: 80,
          height: 60,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xffF18265),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              icon,
              style: TextStyle(
                fontSize: 30,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
        ),
        Text(style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(27, 27,27, 1)),Judul),
      ],
    );
  }
}
