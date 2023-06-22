import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import 'home_page_error.dart';
import 'home_page_loaded.dart';
import 'home_page_loading.dart';

class HomePageCrypto extends StatelessWidget {
  const HomePageCrypto({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Crypto currency viewer',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer(
            builder: (context, ref, child) {
              final cryptoResponse = ref.watch(cryptosProvider);

              return cryptoResponse.when(
                loading: () => const HomePageLoading(),
                data: (data) => HomePageLoaded(listCryptoEntity: data),
                error: (_, __) => const HomePageError(),
              );
            },
          ),
        ),
      ),
    );
  }
}
