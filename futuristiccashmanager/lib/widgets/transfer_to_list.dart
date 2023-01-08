import 'package:flutter/material.dart';
import 'package:futuristiccashmanager/data.dart';

class Person {
  final String name, imageLink, accountNumber;

  Person({
    required this.name,
    required this.imageLink,
    required this.accountNumber,
  });
}

class TransferToList extends StatefulWidget {
  const TransferToList({super.key});
  @override
  State<TransferToList> createState() => _TransferToListState();
}

class _TransferToListState extends State<TransferToList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 12,
        direction: Axis.horizontal,
        children: [
          const SizedBox(
            width: 8,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                color: Theme.of(context).cardColor,
                shape: CircleBorder(
                    side: BorderSide(color: Theme.of(context).dividerColor)),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(Icons.add),
                    )),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'Select',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          for (var person in persons)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                  color: Theme.of(context).cardColor,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    child: Ink.image(
                      height: 48,
                      width: 48,
                      image: NetworkImage(person.imageLink),
                      fit: BoxFit.cover,
                      onImageError: (exception, stackTrace) {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  person.name,
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
