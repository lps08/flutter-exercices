import 'package:crypto_app/presentation/widgets/crypto_card_large.dart';
import 'package:flutter/material.dart';

class CryptoPage extends StatelessWidget {
  const CryptoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: const CryptoCardLarge(),
      ),
    );
  }
}
