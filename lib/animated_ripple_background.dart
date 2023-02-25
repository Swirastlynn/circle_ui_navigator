import 'package:circle_ui_navigator/closing_animation_inherited_params.dart';
import 'package:circle_ui_navigator/constants.dart';
import 'package:flutter/material.dart';

class AnimatedRippleBackground extends StatefulWidget {
  const AnimatedRippleBackground({
    required this.rippleColor,
    super.key,
  });

  final Color rippleColor;

  @override
  AnimatedRippleBackgroundState createState() => AnimatedRippleBackgroundState();
}

class AnimatedRippleBackgroundState extends State<AnimatedRippleBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: backgroundAnimationDuration),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var inheritedParams = ClosingAnimationInheriterdParams.of(context);
    if (inheritedParams.isClosingAnimation) {
      _controller.reverse().whenComplete(() => inheritedParams.onCloseAnimationComplete());
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        size: const Size(double.infinity, double.infinity),
        painter: _RipplePainter(
          animation: CurvedAnimation(parent: _controller, curve: Curves.easeOutSine),
          rippleColor: widget.rippleColor,
        ),
      ),
    );
  }
}

class _RipplePainter extends CustomPainter {
  _RipplePainter({required this.animation, required this.rippleColor})
      : _paint = Paint(),
        super(repaint: animation);

  final Animation<double> animation;
  final Color rippleColor;
  final Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    _paint
      ..color = rippleColor
      ..style = PaintingStyle.fill;

    var centralPoint = Offset(size.width / 2, size.height / 2); // TODO pass via parameter
    var radiusOfCircumscribedCircle = centralPoint
        .distance; // TODO for any place on the screen as the center of the ripple, the furthest vertex has to be taken into account

    var value = animation.value;
    if (value >= 0.0 && value <= 1.0) {
      canvas.drawPath(
        Path()
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
