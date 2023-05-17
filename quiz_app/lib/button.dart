import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback function;
  const MyButton({
    super.key,
    required this.title,
    required this.color,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: const Size(0, 80.0),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
