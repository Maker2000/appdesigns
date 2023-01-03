import 'package:flutter/material.dart';
import 'package:futuristiccashmanager/utils/math_utils.dart';

class IconsInCircle extends StatefulWidget {
  final List<IconItem> items;
  IconsInCircle({super.key, required this.items})
      : assert(_validPercentages(items),
            "Item percentages should add up to 1 or less");

  static bool _validPercentages(List<IconItem> items) {
    return items
            .reduce((value, element) => IconItem(
                title: '',
                icon: value.icon,
                percentage: value.percentage + element.percentage))
            .percentage <=
        1;
  }

  @override
  State<IconsInCircle> createState() => _IconsInCircleState();
}

class _IconsInCircleState extends State<IconsInCircle> {
  List<Align> buildItems() {
    List<Align> items = [];
    for (var i = 0; i < widget.items.length; i++) {
      double multiplier = i / widget.items.length * 360;
      Alignment alignment = MathUtils.rotateWidget(multiplier, 0.9);
      items.add(Align(
        alignment: alignment,
        child: IconItemWidget(
          item: widget.items[i],
          multiplier: multiplier,
        ),
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1.2,
      child: Stack(
        children: buildItems(),
      ),
    );
  }
}

class IconItem {
  final String title;
  final IconData icon;
  final double percentage;
  IconItem({required this.title, required this.icon, required this.percentage});
}

class IconItemWidget extends StatelessWidget {
  final IconItem item;
  final double multiplier;
  IconItemWidget({super.key, required this.item, required this.multiplier})
      : assert(item.percentage > 0 && item.percentage <= 1);

  Widget dataWidget(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Chip(
            label: Text(
              '${(item.percentage * 100)}%',
              style: const TextStyle(fontSize: 12),
            ),
            padding: EdgeInsets.zero,
            backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
          ),
          Text(item.title),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (multiplier > 90 && multiplier < 270) dataWidget(context),
        Icon(
          item.icon,
          size: 50,
        ),
        if (multiplier <= 90 || multiplier >= 270) dataWidget(context),
      ],
    );
  }
}
