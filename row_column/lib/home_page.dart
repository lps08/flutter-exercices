import 'package:flutter/material.dart';
import 'star_container_widget.dart';

const double containerHeight = 100;
const double containerWidth = 100;

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
            const StarContainer(
              width: 100,
              height: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                StarContainer(
                  width: 100,
                  height: 100,
                ),
                StarContainer(
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            const StarContainer(
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
