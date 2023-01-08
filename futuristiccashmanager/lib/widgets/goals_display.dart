import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:futuristiccashmanager/widgets/goal_card.dart';

class GoalsDisplay extends StatefulWidget {
  final List<Goal> goals;
  const GoalsDisplay({super.key, required this.goals});

  @override
  State<GoalsDisplay> createState() => _GoalsDisplayState();
}

class _GoalsDisplayState extends State<GoalsDisplay> {
  PageController controller = PageController();
  double page = 0;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        page = controller.page!;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<Widget> get buildItems {
    return widget.goals
        .asMap()
        .entries
        .map<Widget>((e) {
          double position = -16;
          if (page > e.key) {
            position += (page - e.key) * 400;
          }

          return Positioned(
              left: -position + 50 * (e.key - page),
              child: SizedBox(height: 100, child: GoalCard(goal: e.value)));
        })
        .toList()
        .reversed
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.center,
            fit: StackFit.passthrough,
            children: buildItems,
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: PageView.builder(
              controller: controller,
              itemCount: widget.goals.length,
              itemBuilder: (context, index) => Container(),
            ),
          ),
        ],
      ),
    );
  }
}
