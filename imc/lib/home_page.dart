import 'package:flutter/material.dart';
import 'result_page.dart';

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
  final BMICalcularor _bmiCalculator = BMICalcularor();

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
                'BMI Calculator',
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
                  onPress: () => _bmiCalculator.setGender = "MALE",
                ),
                GenderContainer(
                  gender: 'FEMALE',
                  icon: Icons.female,
                  onPress: () => _bmiCalculator.setGender = "FEMALE",
                ),
              ],
            ),
            HeightContainer(
              onChanged: (value) => _bmiCalculator.setHeight = value.round(),
            ),
            Row(
              children: [
                ContainerWithButtons(
                  title: 'WEIGHT',
                  onChanged: (value) => _bmiCalculator.setWeight = value,
                ),
                ContainerWithButtons(
                  title: 'AGE',
                  onChanged: (value) => _bmiCalculator.setAge = value,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultPage(),
                    ));
                debugPrint(_bmiCalculator.toString());
              },
              child: Container(
                height: 80.0,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'CALCULATE',
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BMICalcularor {
  String? gender;
  int _height = 170;
  int _weight = 70;
  int _age = 20;

  BMICalcularor();

  String? get getGender => gender;
  set setGender(String gender) {
    this.gender = gender;
  }

  int get getHeight => _height;
  set setHeight(int height) {
    _height = height;
  }

  int get getWeight => _weight;
  set setWeight(int weight) {
    _weight = weight;
  }

  int get getAge => _age;
  set setAge(int age) {
    _age = age;
  }

  Map<String, double> result() {
    double bmiResult = _weight / ((_height / 100) * (_height / 100));
    String bmiStatus;

    if (bmiResult < 18.5) {
      bmiStatus = "Underweight";
    } else if (bmiResult < 25) {
      bmiStatus = "Heathy";
    } else if (bmiResult < 30) {
      bmiStatus = "Overweight";
    } else {
      bmiStatus = "Obesity";
    }

    return {bmiStatus: bmiResult};
  }

  @override
  String toString() {
    return "gender: $gender \nheight: $_height \nweight: $_weight \nage: $_age \nresult: ${result()}";
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
            style: textStyle.copyWith(fontSize: 80.0),
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
          onChangeEnd: (value) => widget.onChanged(value),
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
