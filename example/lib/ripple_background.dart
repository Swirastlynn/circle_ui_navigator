import 'dart:math';
import 'package:flutter/material.dart';

class RippleBackground extends StatefulWidget {
  const RippleBackground({super.key});

  @override
  RippleBackgroundState createState() => RippleBackgroundState();
}

class RippleBackgroundState extends State<RippleBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller; // FIXME late

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // FIXME from theme file
      body: Center(
        child: CustomPaint(
          size: const Size(double.infinity, double.infinity),
          painter: _RipplePainter(animation: _controller),
        ),
      ),
    );
  }
}

class _RipplePainter extends CustomPainter {
  final Animation<double> animation;

  _RipplePainter({required this.animation})
      : _path = Path(),
        super(repaint: animation);
  final Path _path;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue.withOpacity(0.5) // TODO pass via parameter
      ..strokeWidth = 4.0
      ..style = PaintingStyle.fill;

    var radius = max(size.width, size.height) / 2;
    var center = Offset(size.width / 2, size.height / 2); // TODO pass via parameter

    var value = animation.value;
    if (value >= 0.0 && value <= 1.0) {
      var path = _path..addOval(Rect.fromCircle(center: center, radius: radius * value));
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_RipplePainter oldDelegate) {
    // TODO think about it
    return true;
  }
}
