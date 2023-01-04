import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:futuristiccashmanager/utils/extensions.dart';
import 'package:futuristiccashmanager/utils/magic_strings.dart';

class CreditCard extends StatelessWidget {
  final CreditCardType cardType;
  final double balance;
  final String cardNumber;
  const CreditCard(
      {super.key,
      required this.cardType,
      required this.balance,
      required this.cardNumber});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1.5,
          ),
        ),
        child: SizedBox(
          height: constraints.maxHeight,
          child: AspectRatio(
            aspectRatio: 13 / 7,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      cardIcon(cardType, 60),
                      Text('**** $cardNumber')
                    ],
                  ),
                  const Spacer(),
                  Text(
                    cardType.titleCase,
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '\$${balance.toStringAsFixed(2)}',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

Widget cardIcon(CreditCardType cardType, [double width = 100]) {
  switch (cardType) {
    case CreditCardType.visa:
      return SvgPicture.asset(
        '../icons/visa_logo.svg',
        width: width,
      );
    case CreditCardType.mastercard:
      return SvgPicture.asset(
        '../icons/mastercard_logo.svg',
        width: width,
      );
  }
}
