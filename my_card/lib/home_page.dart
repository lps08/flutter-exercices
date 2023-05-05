import 'package:flutter/material.dart';
import 'package:my_card/number_email_card.dart';
import 'package:my_card/personal_card.dart';

const String imagePath = 'assets/pic.png';
const String name = 'Luciano Lopes';
const String role = 'Data Scientist';
const String phoneNumber = '+55 86 99994-8302';
const String email = 'lucianolps08@gmail.com';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            PersonalCard(
              imagePath: imagePath,
              name: name,
              role: role,
            ),
            NumberEmailCard(
              text: phoneNumber,
              icon: Icons.phone,
            ),
            NumberEmailCard(
              text: email,
              icon: Icons.email,
            )
          ],
        ),
      ),
    );
  }
}
