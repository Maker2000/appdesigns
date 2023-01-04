import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:futuristiccashmanager/utils/math_utils.dart';

class IconsInCircle extends StatefulWidget {
  final List<IconItem> items;
  const IconsInCircle({super.key, required this.items});

  // static bool _validPercentages(List<IconItem> items) {
  //   return items
  //           .reduce((value, element) => IconItem(
  //               title: '',
  //               icon: value.icon,
  //               percentage: value.percentage + element.percentage))
  //           .percentage <=
  //       1;
  // }

  @override
  State<IconsInCircle> createState() => _IconsInCircleState();
}

class _IconsInCircleState extends State<IconsInCircle> {
  late List<PointData> points;
  List<Align> buildItems() {
    List<Align> items = [];
    points = [];
    for (var i = 0; i < widget.items.length; i++) {
      double angle = i / widget.items.length * 360;
      Alignment alignment = MathUtils.rotateWidget(angle, 0.9);
      items.add(Align(
        alignment: alignment,
        child: IconItemWidget(
          item: widget.items[i],
          angle: angle,
        ),
      ));
      points.add(PointData(
          Offset(alignment.x, alignment.y), widget.items[i].percentage));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1.2,
      child: Stack(
        children: [
          ...buildItems(),
          Align(
            alignment: Alignment.center,
            child: CustomPaint(
              size: const Size(125, 125),
              painter: PercentageGraph(points, Theme.of(context)),
            ),
          )
        ],
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
  final double angle;
  IconItemWidget({super.key, required this.item, required this.angle})
      : assert(item.percentage >= 0 && item.percentage <= 1);

  Widget dataWidget(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Chip(
            label: Text(
              '${(item.percentage * 100).truncate()}%',
            ),
            labelStyle: const TextStyle(fontSize: 12),
            visualDensity: VisualDensity.compact,
            padding: EdgeInsets.zero,
            backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
          ),
          Text(
            item.title,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (angle > 90 && angle < 270) dataWidget(context),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Icon(
            item.icon,
            size: 50,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        if (angle <= 90 || angle >= 270) dataWidget(context),
      ],
    );
  }
}

class PercentageGraph extends CustomPainter {
  final List<PointData> points;
  final ThemeData theme;
  PercentageGraph(this.points, this.theme);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..strokeWidth = 1.2
      ..color = theme.colorScheme.secondary
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Path path = Path()..addPolygon(generatePoints(null, size), true);
    canvas.drawPath(path, paint);
    paint.strokeWidth = 6;
    canvas.drawPoints(PointMode.points, generatePoints(null, size), paint);
    paint.color = theme.colorScheme.secondary.withOpacity(0.3);
    paint.style = PaintingStyle.fill;
    path = Path()..addPolygon(generatePoints(null, size), true);
    canvas.drawPath(path, paint);
    // graph lines
    paint.color = Colors.white.withOpacity(0.1);
    paint.strokeWidth = 0.8;
    paint.style = PaintingStyle.stroke;
    path = Path()
      ..addPolygon(generatePoints(0.2, size), true)
      ..addPolygon(generatePoints(0.4, size), true)
      ..addPolygon(generatePoints(0.6, size), true)
      ..addPolygon(generatePoints(0.8, size), true)
      ..addPolygon(generatePoints(1, size), true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  List<Offset> generatePoints(double? scale, Size size) => points
      .map<Offset>((e) => e.point.scale(size.height * (scale ?? e.percentage),
          size.width * (scale ?? e.percentage)))
      .toList();
}

class PointData {
  Offset point;
  double percentage;
  PointData(this.point, this.percentage);
}
