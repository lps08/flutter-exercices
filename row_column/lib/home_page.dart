import 'package:flutter/material.dart';

const leftRightContainerEdges = EdgeInsets.only(top: 100, bottom: 80);
const double containerHeight = 100;
const double containerWidth = 100;

// colors
const MaterialColor rowContainerColorLeft = Colors.cyan;
const MaterialColor rowContainerColorRight = Colors.amber;
const MaterialColor columnContainerTop = Colors.deepPurple;
const MaterialColor columnContainerBottom = Colors.red;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: leftRightContainerEdges,
            width: containerHeight,
            color: rowContainerColorLeft,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: containerWidth,
                height: containerHeight,
                color: columnContainerTop,
              ),
              Container(
                width: containerWidth,
                height: containerWidth,
                color: columnContainerBottom,
              )
            ],
          ),
          Container(
            margin: leftRightContainerEdges,
            width: containerWidth,
            color: rowContainerColorRight,
          ),
        ],
      ),
    );
  }
}
