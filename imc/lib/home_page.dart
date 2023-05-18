import 'package:flutter/material.dart';

const TextStyle textStyle = TextStyle(
  color: Colors.white,
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 14, 32, 1),
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'IMC Calculator',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                GenderContainer(
                  gender: 'MALE',
                  icon: Icons.male,
                  onPress: () => debugPrint('MALE!'),
                ),
                GenderContainer(
                  gender: 'FEMALE',
                  icon: Icons.female,
                  onPress: () => debugPrint('FEMALE!'),
                ),
              ],
            ),
            const HeightContainer(),
            const Row(
              children: [
                ContainerWithButtons(
                  title: 'WEIGHT',
                ),
                ContainerWithButtons(
                  title: 'AGE',
                ),
              ],
            ),
            Container(
              color: Colors.red,
              child: const Center(
                child: Text(
                  'CALCULATE',
                  style: textStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContainerGesture extends StatelessWidget {
  final void Function() onPress;
  final List<Widget> children;
  final EdgeInsets padding;
  final EdgeInsets margin;
  const ContainerGesture({
    super.key,
    required this.onPress,
    required this.padding,
    this.margin = const EdgeInsets.all(0),
    this.children = const <Widget>[],
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: BaseContainer(
          children: children,
        ),
      ),
    );
  }
}

class ContainerWithButtons extends StatefulWidget {
  final String title;
  const ContainerWithButtons({
    super.key,
    required this.title,
  });

  @override
  State<ContainerWithButtons> createState() => _ContainerWithButtonsState();
}

class _ContainerWithButtonsState extends State<ContainerWithButtons> {
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
            '200',
            style: textStyle.copyWith(fontSize: 80.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularButton(
                icon: Icons.add,
                onPressed: () => debugPrint('Pressed!'),
              ),
              CircularButton(
                icon: Icons.remove,
                onPressed: () => debugPrint('Pressed!'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  const CircularButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: const Color.fromRGBO(76, 79, 95, 1),
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
      child: Icon(
        icon,
        size: 35.0,
      ),
    );
  }
}

class HeightContainer extends StatefulWidget {
  const HeightContainer({super.key});

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
              style: textStyle.copyWith(fontSize: 80.0),
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
          min: 0,
          max: 300,
        )
      ],
    );
  }
}

class GenderContainer extends StatelessWidget {
  final void Function() onPress;
  final String gender;
  final IconData icon;

  const GenderContainer({
    super.key,
    required this.gender,
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerGesture(
      padding: const EdgeInsets.all(30.0),
      margin: const EdgeInsets.all(15.0),
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
        children: children,
      ),
    );
  }
}
