import 'package:flutter/material.dart';

class RippleBackground extends StatefulWidget {
  const RippleBackground({required this.rippleColor, super.key});

  final Color rippleColor;

  @override
  RippleBackgroundState createState() => RippleBackgroundState();
}

class RippleBackgroundState extends State<RippleBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller; // FIXME late

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
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
        animation: CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOut,
        ),
        rippleColor: widget.rippleColor,
      ),
    );
  }
}

class _RipplePainter extends CustomPainter {
  final Animation<double> animation;

  _RipplePainter({required this.animation, required this.rippleColor})
      : _path = Path(),
        super(repaint: animation);

  final Path _path;
  final Color rippleColor;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = rippleColor
      ..strokeWidth = 4.0
      ..style = PaintingStyle.fill;

    var centralPoint = Offset(size.width / 2, size.height / 2); // TODO pass via parameter
    var radiusOfCircumscribedCircle =
        centralPoint.distance; // todo for passed parameter, the furthest vertex has to be taken into account

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
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_RipplePainter oldDelegate) {
    // TODO think about it
    return true;
  }
}
