import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.name,
  });

  final String name;
  final EdgeInsets padding = const EdgeInsets.only(top: 20.0);
  final Alignment alignment = const Alignment(-0.95, -2.0);
  final TextStyle textStyle = const TextStyle(
    fontWeight: FontWeight.bold,
  );
  final double nameFontSize = 20.0;
  final double greetingsFontSize = 40.0;
  final EdgeInsets buttonPadding = const EdgeInsets.all(12.0);
  final double buttonIconSize = 30.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: padding,
          child: Stack(
            alignment: alignment,
            children: [
              Text(
                'Hello $name',
                style: textStyle.copyWith(
                  fontSize: nameFontSize,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Good Evening! 👋',
                style: textStyle.copyWith(
                  fontSize: greetingsFontSize,
                ),
              ),
            ],
          ),
        ),
        OutlinedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: const MaterialStatePropertyAll(CircleBorder()),
            side: MaterialStatePropertyAll(
              BorderSide(color: Colors.grey.shade300),
            ),
            padding: MaterialStatePropertyAll(buttonPadding),
          ),
          child: Icon(
            Icons.notifications_none,
            size: buttonIconSize,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
