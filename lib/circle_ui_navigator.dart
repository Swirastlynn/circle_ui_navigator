library circle_ui_navigator;

import 'dart:math';

import 'package:flutter/material.dart';

class CircularIcons extends StatelessWidget {
  final List<IconData> icons;
  final double size;
  final double strokeWidth;
  final Color color;

  const CircularIcons({
    Key? key,
    required this.icons,
    this.size = 120,
    this.strokeWidth = 8,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(
        icons: icons,
        strokeWidth: strokeWidth,
        color: color,
      ),
      child: SizedBox(
        width: size,
        height: size,
        child: Padding(
          padding: EdgeInsets.all(strokeWidth),
          child: Stack(
            children: [
              for (int i = 0; i < icons.length; i++)
                Positioned.fill(
                  top: -size / 2 * cos(pi / icons.length * (i + 0.5)),
                  left: size / 2 * sin(pi / icons.length * (i + 0.5)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      icons[i],
                      size: size / 8,
                      color: color,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final List<IconData> icons;
  final double strokeWidth;
  final Color color;

  CirclePainter({
    required this.icons,
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2 - strokeWidth;
    final center = Offset(size.width / 2, size.height / 2);

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => false;
}
