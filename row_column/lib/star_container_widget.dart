import 'package:flutter/material.dart';

// Widgets constants
const defaultStarColor = Color.fromRGBO(255, 255, 255, 1);
const double defaultStarPoints = 5;
const double defaultPointRounding = 0.10;
const double defaultSquash = 1;
const double defaultInnerRadiosRatio = 0.30;

class StarContainer extends StatelessWidget {
  final double width;
  final double height;
  final double starPoints;
  final Color color;

  const StarContainer({
    super.key,
    required this.width,
    required this.height,
    this.starPoints = defaultStarPoints,
    this.color = defaultStarColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: color,
        shape: StarBorder(
          points: starPoints,
          pointRounding: defaultPointRounding,
          squash: defaultSquash,
          innerRadiusRatio: defaultInnerRadiosRatio,
        ),
      ),
    );
  }
}
