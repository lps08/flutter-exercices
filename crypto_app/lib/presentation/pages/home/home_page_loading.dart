import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class HomePageLoading extends StatelessWidget {
  const HomePageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(100.0),
        child: LoadingIndicator(
          indicatorType: Indicator.audioEqualizer,

          /// Required, The loading type of the widget
          colors: [Colors.black, Colors.grey],

          /// Optional, The color collections
          strokeWidth: 2,
        ),
      ),
    );
  }
}
