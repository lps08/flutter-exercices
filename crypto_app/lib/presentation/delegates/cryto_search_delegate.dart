import 'package:crypto_app/domain/entities/crypto_entitie.dart';
import 'package:crypto_app/presentation/providers/home_page/list_crypto_provider.dart';
import 'package:crypto_app/presentation/widgets/crypto_card_search_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CryptoSearchDelegate extends SearchDelegate {
  final WidgetRef ref;
  CryptoSearchDelegate(this.ref);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final listCryptoProvider =
        ref.read(cryptoListNotifierProvider.notifier).fullList;

    List<CryptoEntity> listFromQuery = listCryptoProvider
        .where((crypto) =>
            crypto.symbol.toUpperCase().startsWith(query.toUpperCase()))
        .toList();

    if (query.isNotEmpty) {
      return ListView.builder(
        itemCount: listFromQuery.length,
        itemBuilder: (context, index) {
          CryptoEntity cryptoEntity = listFromQuery[index];
          return CrytoCardSearchItem(cryptoEntity: cryptoEntity);
        },
      );
    }
    return const Column();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listCryptoProvider =
        ref.read(cryptoListNotifierProvider.notifier).fullList;

    List<CryptoEntity> listFromQuery = listCryptoProvider
        .where((crypto) =>
            crypto.symbol.toUpperCase().startsWith(query.toUpperCase()))
        .toList();

    if (query.isNotEmpty) {
      return ListView.builder(
        itemCount: listFromQuery.length,
        itemBuilder: (context, index) {
          CryptoEntity cryptoEntity = listFromQuery[index];
          return CrytoCardSearchItem(cryptoEntity: cryptoEntity);
        },
      );
    }
    return const Column();
  }
}
