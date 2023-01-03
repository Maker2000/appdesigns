import 'package:flutter/material.dart';

class ATMs extends StatefulWidget {
  const ATMs({super.key});

  @override
  State<ATMs> createState() => _ATMsState();
}

class _ATMsState extends State<ATMs> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('ATMs'),
    );
  }
}
