import 'package:flutter/material.dart';
import 'constants.dart';

class Team extends StatelessWidget {
  final String teamName;
  final int playersNumber;
  const Team({
    super.key,
    required this.teamName,
    required this.playersNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: paddingTeam,
          child: Row(
            children: [
              Text(
                teamName,
                style: textStyleTeam.copyWith(
                  color: nameColorTeam,
                ),
              ),
              const SizedBox(
                width: sizeBoxWithSizeTeam,
              ),
              Text(
                playersNumber.toString(),
                style: textStyleTeam.copyWith(
                  color: playersNumberColorTeam,
                  fontSize: playersNumberFontSizeTeam,
                ),
              ),
              RotatedBox(
                quarterTurns: quarterTurnsValue,
                child: Text(
                  textJogadoresPlayersNumberTeam,
                  style: TextStyle(
                    color: playersNumberColorTeam,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
