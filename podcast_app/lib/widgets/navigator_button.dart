import 'package:flutter/material.dart';

class NavigatorButton extends StatelessWidget {
  const NavigatorButton({
    super.key,
    required this.title,
    required this.pressed,
  });

  final String title;
  final bool pressed;
  final Color pressedColor = Colors.black;
  final Color unpressedColor = Colors.grey;
  final double pressedFontSize = 30.0;
  final double unpressedFontSize = 25.0;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(
          fontSize: pressed ? pressedFontSize : unpressedFontSize,
          fontWeight: FontWeight.bold,
          color: pressed ? pressedColor : unpressedColor,
        ),
      ),
    );
  }
}
