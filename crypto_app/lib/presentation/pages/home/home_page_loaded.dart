import 'package:crypto_app/domain/entities/crypto_entitie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/home_page/list_crypto_provider.dart';
import '../../widgets/crypto_card_item.dart';

class HomePageLoaded extends ConsumerWidget {
  final bool liked = true;
  const HomePageLoaded({super.key});

  List<Widget> getCryptoCardList(List<CryptoEntity> listCrypto) {
    List<Widget> list = [];
    for (var crypto in listCrypto) {
      list.add(
        CryptoCardListItem(cryptoEntity: crypto, liked: crypto.favorite),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(cryptoListNotifierProvider);
    return RefreshIndicator(
      onRefresh: () => ref
          .read(getAllCryptoUseCaseStateNotifierProvider.notifier)
          .getCryptos(),
      child: SingleChildScrollView(
        child: Column(
          children: getCryptoCardList(provider),
        ),
      ),
    );
  }
}
