import 'package:crypto_app/domain/entities/crypto_entitie.dart';
import 'package:crypto_app/presentation/providers/home_page/scrollcontroller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/home_page/list_crypto_provider.dart';
import '../../widgets/crypto_card_item.dart';

class HomePageLoaded extends ConsumerWidget {
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
    final scrollController = ref.read(scrollControleProvider);

    scrollController.addListener(
      () {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent) {
          ref.read(cryptoListNotifierProvider.notifier).fetchData();
        }
      },
    );

    return RefreshIndicator(
      onRefresh: () => ref
          .read(getAllCryptoUseCaseStateNotifierProvider.notifier)
          .getCryptos(),
      child: ListView.builder(
        controller: scrollController,
        itemCount: provider.length,
        itemBuilder: (context, index) => CryptoCardListItem(
          cryptoEntity: provider[index],
          liked: provider[index].favorite,
        ),
      ),
    );
  }
}
