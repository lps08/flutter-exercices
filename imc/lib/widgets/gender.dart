import 'package:flutter/material.dart';
import 'container/gesture_container.dart';
import '../constants.dart';

class GenderContainer extends StatelessWidget {
  final void Function() onPress;
  final String gender;
  final IconData icon;
  final bool tapped;

  const GenderContainer({
    super.key,
    required this.gender,
    required this.icon,
    required this.onPress,
    required this.tapped,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerGesture(
      padding: const EdgeInsets.all(30.0),
      margin: const EdgeInsets.all(15.0),
      color: tapped ? tappedColor : containerBackgroundColor,
      onPress: onPress,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 100.0,
        ),
        Text(
          gender,
          style: textStyle,
        )
      ],
    );
  }
}
