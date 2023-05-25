import 'package:flutter/material.dart';
import 'base_container.dart';

class ContainerGesture extends StatelessWidget {
  final void Function() onPress;
  final List<Widget> children;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color color;
  const ContainerGesture({
    super.key,
    required this.onPress,
    required this.padding,
    required this.color,
    this.margin = const EdgeInsets.all(0),
    this.children = const <Widget>[],
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: BaseContainer(
          color: color,
          children: children,
        ),
      ),
    );
  }
}
