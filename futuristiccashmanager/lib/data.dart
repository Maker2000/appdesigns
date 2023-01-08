import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'utils/magic_strings.dart';
import 'widgets/credit_card_card.dart';
import 'widgets/expenses_graph.dart';
import 'widgets/goal_card.dart';
import 'widgets/transfer_to_list.dart';

import 'widgets/icons_in_circle.dart';

// goals
final Goal teslaModelS = Goal(120000, 45940, 'Tesla Model S');
final Goal yacht = Goal(1260000, 669080, 'Yacht');
final Goal house = Goal(2000000, 1200000, 'House');
final Goal bently = Goal(200000, 130000, 'Bently');
final List<Goal> goals = [teslaModelS, yacht, house, bently];

//persons
final Person jackie = Person(
  name: 'Jackie',
  imageLink:
      'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  accountNumber: '334235245',
);
final Person rob = Person(
  name: 'Rob',
  imageLink:
      'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=644&q=80',
  accountNumber: '3422543543',
);
final Person jane = Person(
  name: 'Jane',
  imageLink:
      'https://images.unsplash.com/photo-1506863530036-1efeddceb993?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1044&q=80',
  accountNumber: '334235245',
);
final Person timothy = Person(
  name: 'Timothy',
  imageLink:
      'https://images.unsplash.com/photo-1583864697784-a0efc8379f70?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80',
  accountNumber: '334235245',
);
final List<Person> persons = [
  jackie,
  rob,
  jane,
  timothy,
  jackie,
  rob,
  jane,
  timothy,
  jackie,
  rob,
  jane,
  timothy,
];

final List<ExpenseItem> _expenses = [
  ExpenseItem(
    title: 'Internet',
    icon: FontAwesomeIcons.globe,
    amountSpent: 125.45,
  ),
  ExpenseItem(
    title: 'Grocery',
    icon: Icons.local_grocery_store_outlined,
    amountSpent: 200.23,
  ),
  ExpenseItem(
    title: 'Taxi',
    icon: Icons.local_taxi,
    amountSpent: 120.51,
  ),
  ExpenseItem(
    title: 'Restaurants',
    icon: Icons.restaurant,
    amountSpent: 290.67,
  ),
  ExpenseItem(
    title: 'Sport',
    icon: Icons.sports,
    amountSpent: 390.22,
  ),
  ExpenseItem(
    title: 'Alcohol',
    icon: Icons.liquor_outlined,
    amountSpent: 79.99,
  ),
  ExpenseItem(
    title: 'Entertainment',
    icon: Icons.attractions,
    amountSpent: 430.60,
  ),
  ExpenseItem(
    title: 'Clothes',
    icon: Icons.checkroom,
    amountSpent: 500,
  ),
];

final Expense personalExpense = Expense(-0.15, _expenses);

const visa1 = CreditCardData(
  cardType: CreditCardType.visa,
  balance: 4532,
  cardNumber: '3212',
);
const mastercard1 = CreditCardData(
  cardType: CreditCardType.mastercard,
  balance: 4532,
  cardNumber: '3212',
);

const creditCards = [visa1, mastercard1];
