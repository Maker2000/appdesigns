import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:futuristiccashmanager/data.dart';
import 'package:futuristiccashmanager/utils/extensions.dart';
import 'package:futuristiccashmanager/widgets/icons_in_circle.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../utils/magic_strings.dart';

class ExpensesCard extends StatelessWidget {
  final double height;
  const ExpensesCard({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
      child: AspectRatio(
        aspectRatio: 11 / 2.35,
        child: Material(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
          color: Theme.of(context).cardColor,
          child: InkWell(
            onTap: () {
              context.goNamed(RouteName.expenses.name);
            },
            child: LayoutBuilder(builder: (context, constraints) {
              return Stack(
                children: [
                  Positioned(
                    right: 0,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: constraints.maxHeight,
                          maxWidth: constraints.maxWidth * 0.6),
                      child: const ExpensesGraph(),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: constraints.maxHeight,
                          maxWidth: constraints.maxWidth * 0.7),
                      child: Material(
                        type: MaterialType.circle,
                        color: Colors.transparent,
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).cardColor,
                                Theme.of(context).cardColor.withOpacity(0)
                              ],
                              stops: const [0.7, 1],
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Total spent in ${DateFormat(DateFormat.MONTH).format(DateTime.now())}',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white.withOpacity(0.65),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    children: [
                                      Text(
                                        '\$${personalExpense.amount}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      const SizedBox(width: 6),
                                      Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).dividerColor,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        padding: const EdgeInsets.all(3),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              personalExpense.changePrcentage <
                                                      0
                                                  ? FontAwesomeIcons
                                                      .arrowDownLong
                                                  : FontAwesomeIcons
                                                      .arrowUpLong,
                                              size: 12,
                                            ),
                                            Text(
                                              NumberFormat
                                                      .decimalPercentPattern()
                                                  .format(personalExpense
                                                      .changePrcentage
                                                      .abs()),
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class ExpensesGraph extends StatefulWidget {
  final bool fadeGradient, showLines, background;

  const ExpensesGraph(
      {super.key,
      this.fadeGradient = true,
      this.showLines = false,
      this.background = false});

  @override
  State<ExpensesGraph> createState() => _ExpensesGraphState();
}

class _ExpensesGraphState extends State<ExpensesGraph> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: widget.background
            ? Theme.of(context).cardColor
            : Colors.transparent,
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: 2,
          style: widget.background ? BorderStyle.none : BorderStyle.solid,
        ),
      ),
      child: Stack(
        children: [
          if (widget.showLines)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0;
                    i < personalExpense.expenses.length * 2 + 1;
                    i++)
                  const VerticalDivider()
              ],
            ),
          ClipPath(
            clipper: GraphClipper(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      if (widget.fadeGradient) ...[
                        Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.4),
                        Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.2),
                        Theme.of(context).colorScheme.secondary.withOpacity(0),
                      ] else ...[
                        Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.4),
                        Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.4),
                      ]
                    ],
                    stops: [
                      if (widget.fadeGradient) ...[0.4, 0.8, 1] else ...[0, 1]
                    ]),
              ),
            ),
          ),
          CustomPaint(
            size: const Size(double.infinity, double.infinity),
            painter: GraphPainter(Theme.of(context), widget.showLines),
          )
        ],
      ),
    );
  }
}

List<Offset> getGraphLine(Size size) => personalExpense.expenses
    .asMap()
    .entries
    .map<Offset>(
      (e) => Offset(
        size.width *
            e.key.remap(0, personalExpense.expenses.length, 1.1,
                personalExpense.expenses.length + 2.2) *
            0.1,
        size.height - size.height * personalExpense.getGraphPercentage(e.value),
      ),
    )
    .toList();

class GraphClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    CatmullRomSpline curve = CatmullRomSpline([
      Offset(0, size.height),
      ...getGraphLine(size),
      Offset(size.width, size.height),
    ]);
    return Path()
      ..addPolygon(curve.generateSamples().map((e) => e.value).toList(), false)
      // ..lineTo(size.width, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}

class GraphPainter extends CustomPainter {
  final ThemeData theme;
  final bool drawDots;
  GraphPainter(this.theme, [this.drawDots = false]);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 2
      ..color = theme.colorScheme.secondary
      // ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    CatmullRomSpline curve = CatmullRomSpline([
      Offset(0, size.height),
      ...getGraphLine(size),
      Offset(size.width, size.height),
    ]);
    canvas.drawPoints(
      PointMode.polygon,
      curve.generateSamples().map((e) => e.value).toList(),
      paint,
    );

    paint.color = Colors.white;
    // for (var i = 0; i < expenses.length + 2; i++) {
    //   canvas.drawLine(Offset(size.width * i / (expenses.length + 1), 0),
    //       Offset(size.width * i / (expenses.length + 1), size.height), paint);
    // }
    paint.strokeWidth = 7;
    if (drawDots) {
      canvas.drawPoints(PointMode.points, getGraphLine(size), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Expense {
  final double changePrcentage;
  final List<ExpenseItem> expenses;
  double getPercentage(ExpenseItem item) {
    return item.amountSpent / expenses.sum((element) => element.amountSpent);
  }

  double getGraphPercentage(ExpenseItem item) {
    double maxNumber =
        expenses.max((element) => element.amountSpent).ceilToDouble();
    double total = amount;
    maxNumber += (pow(10, total.toStringAsFixed(0).split('').length - 1) * 0.3);

    return item.amountSpent / maxNumber;
  }

  double get amount =>
      expenses.sum(((element) => element.amountSpent)).truncateToDouble();
  Expense(this.changePrcentage, this.expenses);
}
