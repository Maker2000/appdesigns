import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:futuristiccashmanager/data.dart';
import 'package:futuristiccashmanager/widgets/expenses_graph.dart';
import 'package:futuristiccashmanager/widgets/icons_in_circle.dart';
import 'package:futuristiccashmanager/widgets/misc.dart';
import 'package:intl/intl.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            iconTheme: IconThemeData(
              size: 15,
              color: Theme.of(context).colorScheme.secondary,
            ),
            titleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary, fontSize: 18),
            title: const Text('Expenses'),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Total spent in ${DateFormat(DateFormat.MONTH).format(DateTime.now())}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.white.withOpacity(0.5)),
                      ),
                      Row(
                        children: [
                          Text(
                            NumberFormat.simpleCurrency()
                                .format(personalExpense.amount),
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(width: 12),
                          Chip(
                            visualDensity: const VisualDensity(vertical: -4),
                            padding: EdgeInsets.zero,
                            backgroundColor: Theme.of(context).cardColor,
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  personalExpense.changePrcentage < 0
                                      ? FontAwesomeIcons.arrowDownLong
                                      : FontAwesomeIcons.arrowUpLong,
                                  size: 12,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  NumberFormat.percentPattern().format(
                                      personalExpense.changePrcentage.abs()),
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Center(
                  child: IconsInCircle(
                    items: personalExpense.expenses,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        'Expense dynamics',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text(
                          'See details',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const AspectRatio(
                      aspectRatio: 2 / 1,
                      child: ExpensesGraph(
                        fadeGradient: false,
                        background: true,
                        showLines: true,
                      ),
                    ),
                  ),
                ),
                const SafeArea(
                    child: SizedBox(
                  height: 4,
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
