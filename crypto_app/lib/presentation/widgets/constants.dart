import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle numbersTextStyle = GoogleFonts.dosis();
TextStyle namesTextStyle = GoogleFonts.raleway();
TextStyle symbolTextStyle = GoogleFonts.margarine();

TextStyle columnsTableTextStyle = namesTextStyle.copyWith(
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
);

TextStyle rowTableTextStyle = numbersTextStyle.copyWith(
  fontSize: 20.0,
);

const String moneyLocale = 'br';
const String moneyLocaleType = 'BRL';

const EdgeInsets cardItemPadding = EdgeInsets.symmetric(
  horizontal: 15.0,
  vertical: 30.0,
);
const double cardItemSymbolFontSize = 25.0;
const double cardItemNameFontSize = 25.0;
const double cardItemPriceFontSize = 20.0;
const double cardItemPercentageFontSize = 20.0;
const double cardItemFavoriteIconSize = 40.0;

Color favoriteColor = Colors.red.shade300;
Color unfavoriteColor = Colors.grey.shade300;
Color pricesColor = Colors.green.shade900;
Color negativeVarianceColor = Colors.red;
Color positiveVarianceColor = Colors.green;

const EdgeInsets cardLargePadding = EdgeInsets.all(30.0);
const EdgeInsets cardLargeFavoriteButtonPadding = EdgeInsets.all(10.0);
const double cardLargeFavoriteButtonIconSize = 50.0;
const double cardLargeSymbolFontSize = 120.0;
const double cardLargeNameFontSize = 60.0;
const String cardLargePriceTitle = 'Price';
const double cardLargePriceTitleFontSize = 30.0;
const double cardLargePriceValueFontSize = 28.0;
const String cardLargeMarketCapTitle = 'Market Cap';
const double cardLargeMarketCapTitleFontSize = 30.0;
const double cardLargeMarketCapValueFontSize = 28.0;
const String cardLargeMarketCapDominanceTitle = 'Market Cap Dominance';
const double cardLargeMarketCapDominanceTitleFontSize = 30.0;
const double cardLargeMarketCapDominanceValueFontSize = 28.0;
const String cardLargeColumn1hVarianceTitle = '1h variance';
const String cardLargeColumn24hVarianceTitle = '24h variance';
const String cardLargeColumn7dVarianceTitle = '7d variance';
const String cardLargeColumn30dVarianceTitle = '30d variance';

const EdgeInsets cardSearchItemOuterPadding = EdgeInsets.all(5.0);
const EdgeInsets cardSearchItemInnerPadding = EdgeInsets.all(20.0);
const double cardSearchItemSymbolFontSize = 30;
const double cardSearchItemNameFontSize = 20;
const double cardSearchItemPriceFontSize = 20;
