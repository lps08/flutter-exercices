import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final Widget nextPage;

  const BottomButton({
    super.key,
    required this.title,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => nextPage,
            ));
      },
      child: Container(
        height: 80.0,
        color: Colors.red,
        child: Center(
          child: Text(
            title,
            style: textStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
