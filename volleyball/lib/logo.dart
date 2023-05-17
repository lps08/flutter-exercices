import 'package:flutter/material.dart';
import 'constants.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingImageValueLogo),
          child: CircleAvatar(
            backgroundImage: AssetImage(ballPathLogo),
            radius: radiusImageValueLogo,
          ),
        ),
        Stack(
          alignment: alignmentDirectionalLogo,
          children: [
            Text(titleNameLogo,
                style: styleTextLogo.copyWith(fontSize: fontSizeTitleNameLogo)),
            Text(
              subtitleNameLogo,
              style: styleTextLogo.copyWith(fontSize: fontSizeSubtitleNameLogo),
            ),
          ],
        ),
      ],
    );
  }
}
