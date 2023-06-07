import 'package:flutter/material.dart';

// HOME PAGE VARIABLES
ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    tertiary: Colors.white,
  ),
);

ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  colorScheme: ColorScheme.dark(
    primary: Colors.white,
    secondary: Colors.grey.shade400,
    surface: Colors.deepPurple,
    onPrimary: Colors.white,
    tertiary: Colors.deepPurple,
  ),
);

const TextStyle numberStyle = TextStyle(
  fontFamily: 'Concert One',
  height: 1.0,
);

const TextStyle textStyle = TextStyle(
  fontFamily: 'Marker Felt',
  height: 1.0,
);

const EdgeInsets floatingActionButtonPaddingBottom =
    EdgeInsets.only(bottom: 100.0);

const EdgeInsets screenPadding = EdgeInsets.only(
  left: 20.0,
  right: 20.0,
  bottom: 20.0,
  top: 80.0,
);

// avatar variables
const String imagePath = 'assets/pic.png';
const String name = 'Ziraldo';
// widgets above the cards
String congratsText = 'Parabéns! Esse mês você fez';
const double congratsTextFontSize = 30.0;
const double iconVisibleSize = 40.0;
// cards variables
String novosPedidosString = 'novos pedidos';
String novosClientesString = 'novos clientes';
String novosCidadesString = 'novas cidades';
String valueString = '34.000,00';
// sized box variable
const double mainColumnSizedBoxHeight = 100.0;
// Buttons on bottom variables
const String homeButtonTitle = 'Home';
const EdgeInsets homeButtonPadding = EdgeInsets.symmetric(
  horizontal: 45.0,
  vertical: 20.0,
);

// AVATAR VARIABLES
const double avatarRadiusSize = 60.0;
const AlignmentDirectional avatarStackAlignment =
    AlignmentDirectional(1.0, -2.5);
String avatarPresentationString = 'Olá';
double avatarPresentationStringFontSize = 40.0;
const double avatarNameFontSize = 100.0;

// INFO BUTTON VARIABLES
const EdgeInsets infoButtonPadding = EdgeInsets.only(bottom: 20.0);
const double infoButtonSizedBoxHeight = 135.0;
const double infoButtonSizedBoxWidth = 100.0;
const double infoButtonCounterPositionedTopValue = 15;
const double infoButtonCounterPositionedRightValue = 0;
const double infoButtonCounterStringFontSize = 25.0;
const double infoButtonIconPositionedTopValue = 30.0;
const double infoButtonIconPositionedLeftValue = 0;
const double infoButtonIconPositionedRightValue = 0;
const double infoButtonIconSize = 60.0;
const double infoButtonTitlePositionedBottomValue = 8.0;
const double infoButtonTitlePositionedWidthValue = 100;
const double infoButtonTitleFontSize = 30.0;

// PRICE BUTTON VARIABLES
const EdgeInsets priceButtonPadding = EdgeInsets.symmetric(
  horizontal: 20.0,
  vertical: 30.0,
);
const double priceButtonIconSize = 90.0;
const double priceButtonValueFontSize = 55.0;
String priceButtonTitleString = 'em novos pedidos';
const double priceButtonTitleFontSize = 30.0;

// BOTTOM BUTTON VARIABLES
const double bottomButtonIconSize = 30.0;
const double bottomButtonSizedBoxWidthValue = 20.0;
const double bottomBUttonSizedTitleFontSize = 30.0;
