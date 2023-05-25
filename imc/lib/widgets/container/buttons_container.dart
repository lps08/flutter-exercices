import 'package:flutter/material.dart';
import 'base_container.dart';
import '../circular_button.dart';
import '../../constants.dart';

class ContainerWithButtons extends StatefulWidget {
  final String title;
  final ValueChanged<int> onChanged;

  const ContainerWithButtons({
    super.key,
    required this.title,
    required this.onChanged,
  });

  @override
  State<ContainerWithButtons> createState() => _ContainerWithButtonsState();
}

class _ContainerWithButtonsState extends State<ContainerWithButtons> {
  int _value = 50;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BaseContainer(
        children: [
          Text(
            widget.title,
            style: textStyle,
          ),
          Text(
            _value.toString(),
            style: textStyle.copyWith(fontSize: 80.0, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularButton(
                icon: Icons.remove,
                onPressed: () {
                  setState(() {
                    _value--;
                  });
                  widget.onChanged(_value);
                },
              ),
              CircularButton(
                icon: Icons.add,
                onPressed: () {
                  setState(() {
                    _value++;
                  });
                  widget.onChanged(_value);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
