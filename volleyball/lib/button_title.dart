import 'package:flutter/material.dart';
import 'constants.dart';

class ButtonWithTitle extends StatelessWidget {
  const ButtonWithTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titleOnTopButton,
          style: texStyleButton.copyWith(
            fontSize: titleOnTopFontSizeButton,
          ),
        ),
        const SizedBox(
          height: sizedBoxHeightSizeButton,
        ),
        ElevatedButton(
          onPressed: () => debugPrint('Pressed'),
          style: ButtonStyle(
            shape: const MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    borderRadiusValueButton,
                  ),
                ),
              ),
            ),
            padding: const MaterialStatePropertyAll(paddingButton),
            backgroundColor: MaterialStatePropertyAll(backgoudColorButton),
            side: const MaterialStatePropertyAll(borderSideButton),
          ),
          child: Text(
            titleButton,
            style: texStyleButton.copyWith(
              fontSize: titleFontSizeButton,
            ),
          ),
        ),
        const SizedBox(
          height: sizedBoxHeightBottonButton,
        )
      ],
    );
  }
}
