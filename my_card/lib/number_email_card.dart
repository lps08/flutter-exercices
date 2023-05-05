import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// widget default variables values
const EdgeInsets marginValue = EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0);
const EdgeInsets paddingValue = EdgeInsets.only(top: 10.0, bottom: 20.0);
const Color boxColorValue = Colors.white;
const double circularRadiosValue = 10.0;
const double iconSizeValue = 35.0;
const double textFontSizeValue = 35.0;

class NumberEmailCard extends StatelessWidget {
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color boxColor;
  final double circularRadios;
  final IconData icon;
  final double iconSize;
  final String text;
  final double textFontSize;

  const NumberEmailCard({
    super.key,
    required this.text,
    required this.icon,
    this.margin = marginValue,
    this.padding = paddingValue,
    this.boxColor = boxColorValue,
    this.circularRadios = circularRadiosValue,
    this.iconSize = iconSizeValue,
    this.textFontSize = textFontSizeValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(circularRadios),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            icon,
            size: iconSizeValue,
            color: Colors.lightBlue,
          ),
          Text(
            text,
            style: GoogleFonts.playfairDisplay(
              color: Colors.lightBlue,
              fontSize: textFontSize,
            ),
          )
        ],
      ),
    );
  }
}
