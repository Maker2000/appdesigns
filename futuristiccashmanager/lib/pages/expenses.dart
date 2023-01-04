import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          IconItem(
            title: 'Internet',
            icon: FontAwesomeIcons.globe,
            percentage: 0.7,
          ),
          IconItem(
            title: 'Grocery',
            icon: Icons.local_grocery_store_outlined,
            percentage: 0.24,
          ),
          IconItem(
            title: 'Taxi',
            icon: Icons.local_taxi,
            percentage: 0.9,
          ),
          IconItem(
            title: 'Restaurants',
            icon: Icons.restaurant,
            percentage: 0.6,
          ),
          IconItem(
            title: 'Sport',
            icon: Icons.sports,
            percentage: 0.5,
          ),
          IconItem(
            title: 'Alcohol',
            icon: Icons.liquor_outlined,
            percentage: 0.4,
          ),
          IconItem(
            title: 'Entertainment',
            icon: Icons.attractions,
            percentage: 0.4,
          ),
          IconItem(
            title: 'Clothes',
            icon: Icons.checkroom,
            percentage: 0.4,
          ),
        ]),
      ),
    );
  }
}
