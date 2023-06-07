import 'package:flutter/material.dart';
import 'constants.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({
    super.key,
    required this.count,
    required this.icon,
    required this.title,
    this.visible = true,
  });

  final int count;
  final IconData icon;
  final String title;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: infoButtonPadding,
      onPressed: () {},
      child: SizedBox(
        height: infoButtonSizedBoxHeight,
        width: infoButtonSizedBoxWidth,
        child: Stack(
          children: [
            Positioned(
              top: infoButtonCounterPositionedTopValue,
              right: infoButtonCounterPositionedRightValue,
              child: Text(
                '${visible ? count : '*'}',
                style: numberStyle.copyWith(
                  fontSize: infoButtonCounterStringFontSize,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            Positioned(
              top: infoButtonIconPositionedTopValue,
              left: infoButtonIconPositionedLeftValue,
              right: infoButtonIconPositionedRightValue,
              child: Icon(
                icon,
                size: infoButtonIconSize,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Positioned(
              bottom: infoButtonTitlePositionedBottomValue,
              width: infoButtonTitlePositionedWidthValue,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: infoButtonTitleFontSize,
                    fontFamily: 'Marker Felt',
                    height: 1.0,
                    color: Theme.of(context).colorScheme.secondary),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
