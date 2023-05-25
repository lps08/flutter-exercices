import 'package:flutter/material.dart';
import '../widgets/height.dart';
import '../widgets/gender.dart';
import '../widgets/container/buttons_container.dart';
import '../widgets/bottom_button.dart';
import 'result_page.dart';
import '../controller/bmi_calculator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BMICalcularor _bmiCalculator = BMICalcularor();

  bool femaleTappedButton = false;
  bool maleTappedButton = false;

  void setGender(String gender) {
    setState(() {
      if (gender == 'MALE') {
        maleTappedButton = true;
        femaleTappedButton = !maleTappedButton;
      } else {
        femaleTappedButton = true;
        maleTappedButton = !femaleTappedButton;
      }
      _bmiCalculator.gender = gender;
    });
  }

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
                  tapped: maleTappedButton,
                  gender: 'MALE',
                  icon: Icons.male,
                  onPress: () => setGender('MALE'),
                ),
                GenderContainer(
                  tapped: femaleTappedButton,
                  gender: 'FEMALE',
                  icon: Icons.female,
                  onPress: () => setGender('FEMALE'),
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
            BottomButton(
              title: 'CALCULATE',
              nextPage: ResultPage(
                bmiCalcularor: _bmiCalculator,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
