import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// widget default variables values
const EdgeInsets marginValue = EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0);
const Color boxColorValue = Colors.white;
const double textFontSizeValue = 30.0;

class NumberEmailCard extends StatelessWidget {
  final EdgeInsets margin;
  final IconData icon;
  final String text;
  final double textFontSize;

  const NumberEmailCard({
    super.key,
    required this.text,
    required this.icon,
    this.margin = marginValue,
    this.textFontSize = textFontSizeValue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      child: ListTile(
        leading: Icon(icon),
        trailing: Center(
          child: Text(
            text,
            style: GoogleFonts.playfairDisplay(
              color: Colors.lightBlue,
              fontSize: textFontSize,
            ),
          ),
        ),
      ),
    );
  }
}
