import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  final Color color;
  final List<Widget> children;
  const BaseContainer({
    super.key,
    this.children = const <Widget>[],
    this.color = const Color.fromRGBO(29, 30, 48, 1),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }
}
