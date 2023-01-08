import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SeeAllButton extends StatelessWidget {
  final void Function()? onTap;
  const SeeAllButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          'See all',
          style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.5)),
        ),
      ),
    );
  }
}

class ContainerRightShadow extends StatelessWidget {
  final Size size;
  final Color color;
  final double rightOffset;
  const ContainerRightShadow(
      {super.key,
      required this.size,
      required this.color,
      required this.rightOffset});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: Transform.translate(
        offset: Offset(rightOffset, 0),
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              color,
              color.withOpacity(0),
            ], stops: const [
              0.2,
              1
            ]),
          ),
        ),
      ),
    );
  }
}
