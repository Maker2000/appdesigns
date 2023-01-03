import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CustomIndicator extends Decoration {
  final BuildContext context;

  const CustomIndicator(this.context);
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomIndicatorBox(context);
  }
}

class _CustomIndicatorBox extends BoxPainter {
  final BuildContext context;

  _CustomIndicatorBox(this.context);
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Paint paint = Paint()
      ..color = Theme.of(context).colorScheme.secondary
      ..strokeWidth = 3
      ..isAntiAlias = true;

    canvas.drawLine(offset + Offset(cfg.size!.width * 0.25, 2),
        Offset(cfg.size!.width + offset.dx - cfg.size!.width * 0.25, 2), paint);
    paint.shader = ui.Gradient.linear(offset + Offset(cfg.size!.width * 0.1, 0),
        Offset(cfg.size!.width + offset.dx - (cfg.size!.width * 0.1), 0), [
      Theme.of(context).colorScheme.secondary.withOpacity(0),
      Theme.of(context).colorScheme.secondary.withOpacity(0.2),
      Theme.of(context).colorScheme.secondary.withOpacity(0),
    ], [
      0,
      0.5,
      1
    ]);

    canvas.drawRect(
        Rect.fromPoints(
            offset, Offset(cfg.size!.width + offset.dx, cfg.size!.height)),
        paint);
  }
}
