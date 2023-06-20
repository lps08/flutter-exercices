import 'package:flutter/material.dart';

class PlayInfo extends StatelessWidget {
  const PlayInfo({
    super.key,
    required this.title,
    required this.author,
  });

  final String title;
  final String author;
  final double titleFontSize = 50.0;
  final double authorFontSize = 30.0;
  final TextStyle textStyle = const TextStyle(
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        title,
        textAlign: TextAlign.center,
        style: textStyle.copyWith(
          fontSize: titleFontSize,
        ),
      ),
      Text(
        'By $author',
        style: textStyle.copyWith(
          fontSize: authorFontSize,
          color: Colors.grey,
        ),
      ),
    ]);
  }
}
