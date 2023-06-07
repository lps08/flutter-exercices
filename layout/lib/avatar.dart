import 'package:flutter/material.dart';
import 'constants.dart';

class TopAvatar extends StatelessWidget {
  const TopAvatar({
    super.key,
    required this.imagePath,
    required this.name,
  });

  final String imagePath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: avatarRadiusSize,
        ),
        Stack(
          alignment: avatarStackAlignment,
          children: [
            Text(
              avatarPresentationString,
              style: textStyle.copyWith(
                  fontSize: avatarPresentationStringFontSize,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            Text(
              '$name!',
              style: textStyle.copyWith(
                  fontSize: avatarNameFontSize,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ],
    );
  }
}
