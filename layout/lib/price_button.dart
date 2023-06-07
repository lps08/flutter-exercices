import 'package:flutter/material.dart';
import 'constants.dart';

class PriceButton extends StatelessWidget {
  const PriceButton({
    super.key,
    required this.value,
    this.visible = true,
  });

  final String value;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      child: Padding(
        padding: priceButtonPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Icon(
                Icons.store,
                size: priceButtonIconSize,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'R\$ ${visible ? value : '-,--'}',
                    style: numberStyle.copyWith(
                        fontSize: priceButtonValueFontSize,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  Text(
                    priceButtonTitleString,
                    textAlign: TextAlign.end,
                    style: textStyle.copyWith(
                        fontSize: priceButtonTitleFontSize,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
