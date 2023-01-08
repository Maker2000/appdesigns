import 'package:flutter/material.dart';
import 'package:futuristiccashmanager/widgets/expenses_graph.dart';
import '../data.dart';
import '../widgets/credit_card_card.dart';
import '../widgets/goals_display.dart';
import '../widgets/misc.dart';
import '../widgets/transfer_to_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      //   direction: Axis.horizontal,
                      children: [
                        const SizedBox(width: 16),
                        for (var card in creditCards) ...[
                          CreditCard(cardData: card),
                          const SizedBox(width: 16),
                        ]
                      ],
                    ),
                  ),
                ),
                const ExpensesCard(height: 200),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Transfer to',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SeeAllButton(
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const SizedBox(
                  height: 80,
                  child: TransferToList(),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Goals',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SeeAllButton(
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                GoalsDisplay(goals: goals),
                const SafeArea(child: SizedBox(height: 16)),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
