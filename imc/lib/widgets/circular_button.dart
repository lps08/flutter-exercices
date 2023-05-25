import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  const CircularButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: const Color.fromRGBO(76, 79, 95, 1),
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
      child: Icon(
        icon,
        size: 35.0,
        color: Colors.white,
      ),
    );
  }
}
