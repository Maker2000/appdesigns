import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:futuristiccashmanager/utils/magic_strings.dart';
import 'package:futuristiccashmanager/widgets/credit_card_card.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              children: [
                const Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: 24,
                      ),
                      hintText: 'Seaarch by app',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor:
                      Theme.of(context).inputDecorationTheme.fillColor,
                  radius: 22,
                  child: const Icon(Icons.notifications),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'Hello',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Colors.white.withOpacity(0.4)),
                    ),
                    CircleAvatar(
                      backgroundColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                      radius: 22,
                      child: const Icon(Icons.person),
                    ),
                    Text(
                      'Sophie',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Wallet',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    SizedBox(width: 16),
                    CreditCard(
                      cardType: CreditCardType.visa,
                      balance: 4532,
                      cardNumber: '3212',
                    ),
                    CreditCard(
                      cardType: CreditCardType.mastercard,
                      balance: 4532,
                      cardNumber: '3212',
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),
              ListTile(
                title: Text('To Expenses'),
                onTap: () {
                  context.goNamed(RouteName.expenses.name);
                },
              )
            ],
          )),
        ],
      ),
    );
  }
}
