import 'package:flutter/material.dart';

class HomePageError extends StatelessWidget {
  const HomePageError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Error on fetching data',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50.0,
        ),
      ),
    );
  }
}
