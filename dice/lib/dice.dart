import 'package:flutter/material.dart';
import 'dart:math';

class MyDice extends StatefulWidget {
  final int _diceFace = Random().nextInt(6) + 1;
  MyDice({super.key});

  @override
  State<MyDice> createState() => _MyDiceState();
}

class _MyDiceState extends State<MyDice> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset('assets/dice${widget._diceFace}.png'),
      ),
    );
  }
}
