import 'package:flutter/material.dart';
import 'package:futuristiccashmanager/widgets/icons_in_circle.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconsInCircle(items: [
          IconItem(title: 'Home', icon: Icons.house, percentage: 0.1),
          IconItem(title: 'Phone', icon: Icons.phone, percentage: 0.1),
          IconItem(title: 'Phone', icon: Icons.phone, percentage: 0.1),
          IconItem(title: 'Settings', icon: Icons.settings, percentage: 0.2),
          IconItem(title: 'Location', icon: Icons.location_on, percentage: 0.2),
          IconItem(title: 'Books', icon: Icons.book, percentage: 0.1),
          IconItem(title: 'Cards', icon: Icons.card_giftcard, percentage: 0.1),
          IconItem(title: 'Cards', icon: Icons.card_giftcard, percentage: 0.1),
        ]),
      ),
    );
  }
}
