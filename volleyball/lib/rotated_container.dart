import 'package:flutter/material.dart';
import 'constants.dart';

class RotatedContainer extends StatelessWidget {
  const RotatedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: quarterTurnsValue,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade200,
          border: Border.all(
            color: Colors.blueGrey.shade100,
            width: borderWidth,
          ),
        ),
        padding: paddingRotatedContainer,
        child: Text(
          titleRotatedContainer,
          style: textStyleRoundeContainer.copyWith(
              fontSize: fontSizeTileRotatedBox),
        ),
      ),
    );
  }
}
