import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/crypto_entitie.dart';
import '../providers/home_page/crypto_list_provider.dart';

const EdgeInsets cryptoCardItemPadding = EdgeInsets.symmetric(
  horizontal: 15.0,
  vertical: 30.0,
);
const double cryptoSymbolFontSize = 25.0;
const double cryptoNameFontSize = 25.0;
const double cryptoPriceFontSize = 20.0;
const double cryptoPercentageFontSize = 20.0;
const double favoriteIconSize = 40.0;
TextStyle numbersTextStyle = GoogleFonts.dosis();
TextStyle namesTextStyle = GoogleFonts.raleway();
TextStyle symbolTextStyle = GoogleFonts.margarine();

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
        padding: cryptoCardItemPadding,
        child: Row(
          children: [
            Flexible(
              flex: 6,
              fit: FlexFit.tight,
              child: GestureDetector(
                onTap: () => debugPrint('pressed'),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text(
                        cryptoEntity.symbol,
                        style: symbolTextStyle.copyWith(
                          fontSize: cryptoSymbolFontSize,
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
                                  fontSize: cryptoNameFontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                NumberFormat.currency(
                                        locale: 'br', symbol: 'BRL')
                                    .format(cryptoEntity.price),
                                style: numbersTextStyle.copyWith(
                                  fontSize: cryptoPriceFontSize,
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
                                  fontSize: cryptoPercentageFontSize,
                                  fontWeight: FontWeight.w300,
                                  color: cryptoEntity.percentChange1h > 0
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                              Text(
                                '${cryptoEntity.percentChange24h > 0 ? '↑' : '↓'} 24h: ${cryptoEntity.percentChange24h.toStringAsFixed(2)} %',
                                style: numbersTextStyle.copyWith(
                                  fontSize: cryptoPercentageFontSize,
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
                  color: liked ? Colors.red.shade300 : Colors.grey.shade300,
                  size: favoriteIconSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
