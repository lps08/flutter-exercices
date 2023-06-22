import 'package:crypto_app/domain/entities/crypto_entitie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../providers/providers.dart';

class HomePageLoaded extends StatelessWidget {
  final List<CryptoEntity> listCryptoEntity;
  final bool liked = true;
  const HomePageLoaded({super.key, required this.listCryptoEntity});

  List<Widget> getCryptoCardList() {
    List<Widget> list = [];
    for (var crypto in listCryptoEntity) {
      list.add(
        CryptoCardListItem(cryptoEntity: crypto, liked: crypto.favorite),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: getCryptoCardList(),
      ),
    );
  }
}

class CryptoCardListItem extends ConsumerWidget {
  const CryptoCardListItem({
    super.key,
    required this.cryptoEntity,
    required this.liked,
  });

  final CryptoEntity cryptoEntity;
  final bool liked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                cryptoEntity.symbol,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        cryptoEntity.name,
                        style: const TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(locale: 'br', symbol: 'BRL')
                            .format(cryptoEntity.price),
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '1h: ${cryptoEntity.percentChange1h.toStringAsPrecision(2)} %',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                          color: cryptoEntity.percentChange1h > 0
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      Text(
                        '24h: ${cryptoEntity.percentChange24h.toStringAsPrecision(2)} %',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                          color: cryptoEntity.percentChange24h > 0
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Flexible(
            //   flex: 1,
            //   fit: FlexFit.tight,
            //   child: IconButton(
            //     onPressed: () =>
            //         ref.watch(cryptoStateChanges).toggle(cryptoEntity.id),
            //     icon: Icon(
            //       Icons.favorite,
            //       color: liked ? Colors.red.shade800 : Colors.grey,
            //       size: 35.0,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
