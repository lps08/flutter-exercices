import 'package:flutter/material.dart';

// Widgets constants
const defaultStarColor = Color.fromRGBO(255, 255, 255, 1);

class StarContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double starPoints;
  final double pointRounding;
  final double squash;
  final double innerRadiosRatio;

  const StarContainer({
    super.key,
    required this.width,
    required this.height,
    this.color = defaultStarColor,
    required this.starPoints,
    required this.pointRounding,
    required this.squash,
    required this.innerRadiosRatio,
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
          pointRounding: pointRounding,
          squash: squash,
          innerRadiusRatio: innerRadiosRatio,
        ),
      ),
    );
  }
}
