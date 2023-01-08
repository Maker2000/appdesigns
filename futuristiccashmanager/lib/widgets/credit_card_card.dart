import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:futuristiccashmanager/utils/extensions.dart';
import 'package:futuristiccashmanager/utils/magic_strings.dart';

class CreditCard extends StatelessWidget {
  final CreditCardData cardData;
  const CreditCard({super.key, required this.cardData});

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
        child: AspectRatio(
          aspectRatio: 13 / 8,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cardIcon(cardData.cardType, 60),
                    Text('**** ${cardData.cardNumber}')
                  ],
                ),
                const Spacer(),
                Text(
                  cardData.cardType.titleCase,
                  textAlign: TextAlign.left,
                ),
                Text(
                  '\$${cardData.balance.toStringAsFixed(2)}',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
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

class CreditCardData {
  final CreditCardType cardType;
  final double balance;
  final String cardNumber;

  const CreditCardData(
      {required this.cardType,
      required this.balance,
      required this.cardNumber});
}
