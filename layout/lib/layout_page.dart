import 'package:flutter/material.dart';
import 'expandable_floating_action_button.dart';
import 'price_button.dart';
import 'avatar.dart';
import 'botton_button.dart';
import 'info_button.dart';
import 'constants.dart';

@immutable
class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  late bool _visible;
  late bool _isLight;

  void changeVisible() {
    setState(() {
      _visible = !_visible;
      _isLight = !_isLight;
    });
  }

  @override
  void initState() {
    super.initState();
    _visible = true;
    _isLight = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _isLight ? ThemeMode.light : ThemeMode.dark,
      home: Scaffold(
        floatingActionButton: Padding(
          padding: floatingActionButtonPaddingBottom,
          child: ExpandableFab(
            distance: 112.0,
            children: [
              ActionButton(
                onPressed: () => () {},
                icon: const Icon(Icons.group_add_rounded),
              ),
              ActionButton(
                onPressed: () => () {},
                icon: const Icon(Icons.add_shopping_cart),
              ),
              ActionButton(
                onPressed: () => () {},
                icon: const Icon(Icons.group_add_rounded),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: screenPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const TopAvatar(
                  imagePath: imagePath,
                  name: name,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          congratsText,
                          style: textStyle.copyWith(
                              fontSize: congratsTextFontSize,
                              color:
                                  _isLight ? Colors.deepPurple : Colors.white),
                        ),
                        IconButton(
                            onPressed: changeVisible,
                            icon: Icon(
                              _visible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: iconVisibleSize,
                              color: Theme.of(context).colorScheme.secondary,
                            ))
                      ],
                    ),
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InfoButton(
                            count: 12,
                            title: novosPedidosString,
                            icon: Icons.store_sharp,
                            visible: _visible,
                          ),
                          InfoButton(
                            count: 20,
                            icon: Icons.people,
                            title: novosClientesString,
                            visible: _visible,
                          ),
                          InfoButton(
                            count: 20,
                            icon: Icons.business_outlined,
                            title: novosCidadesString,
                            visible: _visible,
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: PriceButton(
                        value: valueString,
                        visible: _visible,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: mainColumnSizedBoxHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomButton(
                      onPressed: () {},
                      icon: Icons.home,
                      title: homeButtonTitle,
                      padding: homeButtonPadding,
                      backgroundColor:
                          _isLight ? Colors.deepPurple : Colors.white,
                      contentColor: _isLight ? Colors.white : Colors.deepPurple,
                    ),
                    BottomButton(
                      onPressed: () {},
                      icon: Icons.store,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      contentColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    BottomButton(
                      onPressed: () {},
                      icon: Icons.people,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      contentColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    BottomButton(
                      onPressed: () {},
                      icon: Icons.line_axis,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      contentColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
