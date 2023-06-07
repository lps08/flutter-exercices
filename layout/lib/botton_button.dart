import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
    required this.onPressed,
    required this.icon,
    this.title,
    this.backgroundColor,
    this.contentColor,
  });

  final EdgeInsets padding;
  final VoidCallback onPressed;
  final IconData icon;
  final String? title;
  final Color? backgroundColor;
  final Color? contentColor;

  List<Widget> titleContent() {
    return title == null
        ? [
            Icon(
              icon,
              color: contentColor,
              size: bottomButtonIconSize,
            )
          ]
        : [
            Icon(
              icon,
              color: contentColor,
              size: bottomButtonIconSize,
            ),
            const SizedBox(
              width: bottomButtonSizedBoxWidthValue,
            ),
            Text(
              title!,
              style: textStyle.copyWith(
                fontSize: bottomBUttonSizedTitleFontSize,
                color: contentColor,
              ),
            )
          ];
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(padding),
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
      ),
      onPressed: onPressed,
      child: Row(
        children: titleContent(),
      ),
    );
  }
}
