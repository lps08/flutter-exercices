import 'package:flutter/material.dart';
import 'package:volleyball/constants.dart';
import 'logo.dart';
import 'rotated_container.dart';
import 'team.dart';
import 'button_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      floatingActionButton: FloatingActionButton(
        backgroundColor: backgoudColorButton,
        onPressed: () => debugPrint('Pressed!'),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Logo(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RotatedContainer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Team(teamName: "Fulano", playersNumber: 4),
                    Team(teamName: "Cicrano", playersNumber: 3),
                    Team(teamName: "Max turbo", playersNumber: 3),
                    Team(teamName: "Equipe cão", playersNumber: 3),
                  ],
                ),
              ],
            ),
            ButtonWithTitle()
          ],
        ),
      ),
    );
  }
}
