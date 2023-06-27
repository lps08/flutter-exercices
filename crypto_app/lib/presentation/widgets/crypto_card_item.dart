import 'package:crypto_app/presentation/pages/crypto/crypto_page.dart';
import 'package:crypto_app/presentation/providers/crypto_page/crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'constants.dart';

import '../../domain/entities/crypto_entitie.dart';
import '../providers/home_page/list_crypto_provider.dart';

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
        padding: cardItemPadding,
        child: Row(
          children: [
            Flexible(
              flex: 6,
              fit: FlexFit.tight,
              child: GestureDetector(
                onTap: () {
                  ref.read(cryptoStateProvider.notifier).state = cryptoEntity;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CryptoPage(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text(
                        cryptoEntity.symbol,
                        style: symbolTextStyle.copyWith(
                          fontSize: cardItemSymbolFontSize,
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
                                style: namesTextStyle.copyWith(
                                  fontSize: cardItemNameFontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                NumberFormat.currency(
                                  locale: moneyLocale,
                                  symbol: moneyLocaleType,
                                ).format(cryptoEntity.price),
                                style: numbersTextStyle.copyWith(
                                  fontSize: cardItemPriceFontSize,
                                  color: pricesColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '${cryptoEntity.percentChange1h > 0 ? '↑' : '↓'} 1h: ${cryptoEntity.percentChange1h.toStringAsFixed(2)} %',
                                style: numbersTextStyle.copyWith(
                                  fontSize: cardItemPercentageFontSize,
                                  fontWeight: FontWeight.w300,
                                  color: cryptoEntity.percentChange1h > 0
                                      ? positiveVarianceColor
                                      : negativeVarianceColor,
                                ),
                              ),
                              Text(
                                '${cryptoEntity.percentChange24h > 0 ? '↑' : '↓'} 24h: ${cryptoEntity.percentChange24h.toStringAsFixed(2)} %',
                                style: numbersTextStyle.copyWith(
                                  fontSize: cardItemPercentageFontSize,
                                  fontWeight: FontWeight.w300,
                                  color: cryptoEntity.percentChange24h > 0
                                      ? positiveVarianceColor
                                      : negativeVarianceColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: IconButton(
                onPressed: () => ref
                    .read(cryptoListNotifierProvider.notifier)
                    .toggle(cryptoEntity),
                icon: Icon(
                  Icons.favorite,
                  color: liked ? favoriteColor : unfavoriteColor,
                  size: cardItemFavoriteIconSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
