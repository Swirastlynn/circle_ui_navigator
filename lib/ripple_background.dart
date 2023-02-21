import 'package:flutter/material.dart';

class RippleBackground extends StatefulWidget {
  const RippleBackground({required this.rippleColor, super.key});

  final Color rippleColor;

  @override
  RippleBackgroundState createState() => RippleBackgroundState();
}

class RippleBackgroundState extends State<RippleBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
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
    return CustomPaint(
      size: const Size(double.infinity, double.infinity),
      painter: _RipplePainter(
        animation: _controller,
        rippleColor: widget.rippleColor,
      ),
    );
  }
}

class _RipplePainter extends CustomPainter {
  final Animation<double> animation;

  _RipplePainter({required this.animation, required this.rippleColor})
      : _path = Path(),
        _paint = Paint(),
        super(repaint: animation);

  final Color rippleColor;
  final Path _path;
  final Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    _paint
      ..color = rippleColor
      ..style = PaintingStyle.fill;

    var centralPoint = Offset(size.width / 2, size.height / 2); // TODO pass via parameter
    var radiusOfCircumscribedCircle = centralPoint
        .distance; // TODO for any place on the screen as center, the furthest vertex has to be taken into account

    var value = animation.value;
    if (value >= 0.0 && value <= 1.0) {
      canvas.drawPath(
        _path
          ..addOval(
            Rect.fromCircle(
              center: centralPoint,
              radius: radiusOfCircumscribedCircle * value,
            ),
          ),
        _paint,
      );
    }
  }

  @override
  bool shouldRepaint(_RipplePainter oldDelegate) => false;
}
