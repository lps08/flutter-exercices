import 'package:flutter/material.dart';
import 'container/base_container.dart';
import '../constants.dart';

class HeightContainer extends StatefulWidget {
  final ValueChanged<double> onChanged;
  const HeightContainer({super.key, required this.onChanged});

  @override
  State<HeightContainer> createState() => _HeightContainerState();
}

class _HeightContainerState extends State<HeightContainer> {
  double _currentSliderValue = 100;
  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      children: [
        const Text(
          'HEIGHT',
          style: textStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: [
            Text(
              _currentSliderValue.toInt().toString(),
              style: textStyle.copyWith(fontSize: 80.0, color: Colors.white),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              'cm',
              style: textStyle.copyWith(fontSize: 25.0),
            ),
          ],
        ),
        Slider(
          value: _currentSliderValue,
          onChanged: (value) => setState(() {
            _currentSliderValue = value;
          }),
          onChangeEnd: (value) => widget.onChanged(value),
          min: 0,
          max: 300,
          activeColor: Colors.red,
        )
      ],
    );
  }
}
