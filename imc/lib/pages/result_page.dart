import 'package:flutter/material.dart';
import 'package:imc/widgets/container/base_container.dart';
import 'package:imc/controller/bmi_calculator.dart';
import 'package:imc/widgets/bottom_button.dart';
import 'package:imc/pages/home_page.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  final BMICalcularor bmiCalcularor;
  const ResultPage({super.key, required this.bmiCalcularor});

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
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Your result',
                style: textStyle.copyWith(fontSize: 80.0, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Expanded(
              child: BaseContainer(
                children: [
                  Text(
                    bmiCalcularor.bmiStatus(),
                    style:
                        textStyle.copyWith(fontSize: 40.0, color: Colors.green),
                  ),
                  Text(
                    bmiCalcularor.result().toStringAsPrecision(3),
                    style: textStyle.copyWith(
                        fontSize: 170.0, color: Colors.white),
                  ),
                  Text(
                    bmiCalcularor.bmiOutcome(),
                    style: textStyle.copyWith(
                      fontSize: 40.0,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const BottomButton(
              title: 'RE-CALCULATE',
              nextPage: HomePage(),
            ),
          ],
        ),
      ),
    );
  }
}
