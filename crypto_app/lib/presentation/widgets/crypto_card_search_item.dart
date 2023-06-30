import 'package:crypto_app/domain/entities/crypto_entitie.dart';
import 'package:crypto_app/presentation/pages/crypto/crypto_page.dart';
import 'package:crypto_app/presentation/providers/crypto_page/crypto_provider.dart';
import 'package:crypto_app/presentation/providers/home_page/list_crypto_provider.dart';
import 'package:crypto_app/presentation/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CrytoCardSearchItem extends ConsumerWidget {
  const CrytoCardSearchItem({
    super.key,
    required this.cryptoEntity,
  });

  final CryptoEntity cryptoEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: cardSearchItemOuterPadding,
      child: Card(
        child: GestureDetector(
          onTap: () {
            final listCryptoProviderStateNotifier =
                ref.read(cryptoListNotifierProvider);
            ref.read(cryptoStateProvider.notifier).state =
                listCryptoProviderStateNotifier
                        .any((element) => element.symbol == cryptoEntity.symbol)
                    ? listCryptoProviderStateNotifier.firstWhere(
                        (element) => element.symbol == cryptoEntity.symbol)
                    : cryptoEntity;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CryptoPage(),
              ),
            );
          },
          child: Padding(
            padding: cardSearchItemInnerPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Center(
                    child: Text(
                      cryptoEntity.symbol,
                      style: symbolTextStyle.copyWith(
                        fontSize: cardSearchItemSymbolFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  fit: FlexFit.tight,
                  child: Center(
                    child: Text(
                      cryptoEntity.name,
                      style: namesTextStyle.copyWith(
                        fontSize: cardSearchItemNameFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Text(
                    NumberFormat.currency(
                      locale: moneyLocale,
                      symbol: moneyLocaleType,
                    ).format(cryptoEntity.price),
                    style: numbersTextStyle.copyWith(
                      color: pricesColor,
                      fontSize: cardSearchItemPriceFontSize,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
