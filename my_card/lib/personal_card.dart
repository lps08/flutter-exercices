import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// widget default values
const double circularBorderValue = 200;
const double scaleValue = 2.0;
const double nameFontSizeValue = 50.0;
const double roleFontSizeValue = 50.0;

class PersonalCard extends StatelessWidget {
  final String imagePath;
  final double imageScale;
  final String name;
  final String role;
  final double nameFontSize;
  final double roleFontSize;

  const PersonalCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.role,
    this.imageScale = scaleValue,
    this.nameFontSize = nameFontSizeValue,
    this.roleFontSize = roleFontSizeValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(circularBorderValue),
          child: Image.asset(
            imagePath,
            scale: scaleValue,
          ),
        ),
        Text(
          name,
          style: GoogleFonts.sigmarOne(
            fontSize: nameFontSize,
            color: Colors.white,
          ),
        ),
        Text(
          role,
          style: GoogleFonts.overpass(
            fontSize: roleFontSize,
            color: Colors.white70,
          ),
        )
      ],
    );
  }
}
