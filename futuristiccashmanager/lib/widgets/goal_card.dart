import 'package:flutter/material.dart';
import 'package:futuristiccashmanager/widgets/misc.dart';
import 'package:futuristiccashmanager/widgets/percentage_circle.dart';
import 'package:intl/intl.dart';

class GoalCard extends StatelessWidget {
  final Goal goal;
  const GoalCard({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          ContainerRightShadow(
            size: Size(50, constraints.maxHeight),
            color: Theme.of(context).scaffoldBackgroundColor,
            rightOffset: 40,
          ),
          AspectRatio(
            aspectRatio: 11 / 4,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(6),
                boxShadow: const [
                  // BoxShadow(spreadRadius: 0, blurRadius: 8, offset: Offset(3, 0))
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: PercentageCircle(
                        radius: constraints.maxHeight / 3,
                        percentage: goal.percentage),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        goal.goalName,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${NumberFormat.simpleCurrency(decimalDigits: 0).format(goal.currentAmount)} / ${NumberFormat.simpleCurrency(decimalDigits: 0).format(goal.goalAmount)}',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}

class Goal {
  final double goalAmount, currentAmount;
  final String goalName;
  double get percentage => currentAmount / goalAmount;
  Goal(this.goalAmount, this.currentAmount, this.goalName);
}
