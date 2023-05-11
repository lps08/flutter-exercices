import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// widget default values
const double radiusSizeValue = 100;
const double scaleValue = 2.0;
const double nameFontSizeValue = 50.0;
const double roleFontSizeValue = 50.0;

class PersonalInformation extends StatelessWidget {
  final String imagePath;
  final double imageScale;
  final String name;
  final String role;
  final double nameFontSize;
  final double roleFontSize;
  final double radiusSize;

  const PersonalInformation({
    super.key,
    required this.imagePath,
    required this.name,
    required this.role,
    this.imageScale = scaleValue,
    this.nameFontSize = nameFontSizeValue,
    this.roleFontSize = roleFontSizeValue,
    this.radiusSize = radiusSizeValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: radiusSize,
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
