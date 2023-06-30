import 'package:crypto_app/presentation/providers/crypto_page/crypto_provider.dart';
import 'package:crypto_app/presentation/providers/home_page/list_crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'constants.dart';

class CryptoCardLarge extends ConsumerWidget {
  const CryptoCardLarge({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoProvider = ref.watch(cryptoStateProvider);
    return Padding(
      padding: cardLargePadding,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: cardLargeFavoriteButtonPadding,
                  child: IconButton(
                    onPressed: () {
                      ref
                          .read(cryptoListNotifierProvider.notifier)
                          .toggle(cryptoProvider);
                      ref.watch(cryptoStateProvider.notifier).state =
                          cryptoProvider.copyWith(
                              favorite: !cryptoProvider.favorite);
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: cardLargeFavoriteButtonIconSize,
                      color: cryptoProvider.favorite
                          ? favoriteColor
                          : unfavoriteColor,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              child: Column(
                children: [
                  Text(
                    cryptoProvider.symbol,
                    style: symbolTextStyle.copyWith(
                      fontSize: cardLargeSymbolFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    cryptoProvider.name,
                    style: namesTextStyle.copyWith(
                      fontSize: cardLargeNameFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  Text(
                    cardLargePriceTitle,
                    style: namesTextStyle.copyWith(
                      fontSize: cardLargePriceTitleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: moneyLocale, symbol: moneyLocaleType)
                        .format(cryptoProvider.price),
                    style: numbersTextStyle.copyWith(
                        fontSize: cardLargePriceValueFontSize,
                        color: pricesColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  Text(
                    cardLargeMarketCapTitle,
                    style: namesTextStyle.copyWith(
                      fontSize: cardLargeMarketCapTitleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: moneyLocale, symbol: moneyLocaleType)
                        .format(cryptoProvider.marketCap),
                    style: numbersTextStyle.copyWith(
                      fontSize: cardLargeMarketCapValueFontSize,
                      color: pricesColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  Text(
                    cardLargeMarketCapDominanceTitle,
                    style: namesTextStyle.copyWith(
                      fontSize: cardLargeMarketCapDominanceTitleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: moneyLocale, symbol: moneyLocaleType)
                        .format(cryptoProvider.marketCapDominance),
                    style: numbersTextStyle.copyWith(
                      fontSize: cardLargeMarketCapDominanceValueFontSize,
                      color: pricesColor,
                    ),
                  ),
                ],
              ),
            ),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Center(
                        child: Text(
                          cardLargeColumn1hVarianceTitle,
                          style: columnsTableTextStyle,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          cardLargeColumn24hVarianceTitle,
                          style: columnsTableTextStyle,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          cardLargeColumn7dVarianceTitle,
                          style: columnsTableTextStyle,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          cardLargeColumn30dVarianceTitle,
                          style: columnsTableTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Center(
                        child: Text(
                          '${cryptoProvider.percentChange1h > 0 ? '↑' : '↓'} ${cryptoProvider.percentChange1h.toStringAsFixed(2)}',
                          style: rowTableTextStyle.copyWith(
                            color: cryptoProvider.percentChange1h > 0
                                ? positiveVarianceColor
                                : negativeVarianceColor,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          '${cryptoProvider.percentChange24h > 0 ? '↑' : '↓'} ${cryptoProvider.percentChange24h.toStringAsFixed(2)}',
                          style: rowTableTextStyle.copyWith(
                            color: cryptoProvider.percentChange24h > 0
                                ? positiveVarianceColor
                                : negativeVarianceColor,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          '${cryptoProvider.percentChange7d > 0 ? '↑' : '↓'} ${cryptoProvider.percentChange7d.toStringAsFixed(2)}',
                          style: rowTableTextStyle.copyWith(
                            color: cryptoProvider.percentChange7d > 0
                                ? positiveVarianceColor
                                : negativeVarianceColor,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          '${cryptoProvider.percentChange30d > 0 ? '↑' : '↓'} ${cryptoProvider.percentChange30d.toStringAsFixed(2)}',
                          style: rowTableTextStyle.copyWith(
                            color: cryptoProvider.percentChange30d > 0
                                ? positiveVarianceColor
                                : negativeVarianceColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0001,
            )
          ],
        ),
      ),
    );
  }
}
