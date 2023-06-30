import 'package:crypto_app/presentation/delegates/cryto_search_delegate.dart';
import 'package:crypto_app/presentation/providers/home_page/list_crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/home_page/list_preference_provider.dart';
import 'home_page_error.dart';
import 'home_page_loaded.dart';
import 'home_page_loading.dart';

class HomePageCrypto extends ConsumerWidget {
  const HomePageCrypto({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 40.0,
              ),
              onPressed: () {
                showSearch(
                    context: context, delegate: CryptoSearchDelegate(ref));
              },
            )
          ],
          title: const Text(
            'Crypto currency viewer',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer(
            builder: (context, ref, child) {
              ref.watch(preferenceNotifierProvider);
              final cryptoResponse =
                  ref.watch(getAllCryptoUseCaseStateNotifierProvider);

              return cryptoResponse.when(
                loading: () => const HomePageLoading(),
                data: (_) {
                  return const HomePageLoaded();
                },
                error: (_, __) {
                  return const HomePageError();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
