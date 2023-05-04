import 'package:flutter/material.dart';
import 'star_container_widget.dart';
import 'dart:math';

Random random = Random();

double randomDoubleInRange(double min, double max) {
  double range = max - min;
  double scaled = random.nextDouble() * range;
  double shifted = scaled + min;

  return shifted;
}

Widget makeStarContainer() {
  double containerHeight = random.nextInt(40) + 10;
  double containerWidth = random.nextInt(40) + 10;

  return StarContainer(
    width: containerWidth,
    height: containerHeight,
    starPoints: random.nextInt(15) + 5,
    pointRounding: randomDoubleInRange(0.0, 0.1),
    squash: random.nextDouble(),
    innerRadiosRatio: randomDoubleInRange(0.0, 0.1),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pic1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            makeStarContainer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                makeStarContainer(),
                makeStarContainer(),
              ],
            ),
            makeStarContainer(),
          ],
        ),
      ),
    );
  }
}
