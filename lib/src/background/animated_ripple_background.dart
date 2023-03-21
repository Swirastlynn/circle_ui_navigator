import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/extensions.dart';

/// An animation making the background of [CircleNavigator]
/// more interesting with a fullscreen ripple effect.
class AnimatedRippleBackground extends StatefulWidget {
  const AnimatedRippleBackground({
    super.key,
  });

  @override
  AnimatedRippleBackgroundState createState() =>
      AnimatedRippleBackgroundState();
}

class AnimatedRippleBackgroundState extends State<AnimatedRippleBackground>
    with SingleTickerProviderStateMixin {
  late final _animationDuration = context.config.backgroundAnimationDuration;
  late final _controller = AnimationController(
    duration: Duration(milliseconds: _animationDuration),
    vsync: this,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Handling a reaction to the config state changes up the tree.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (context.config.isOpeningAnimation) {
      _controller
          .forward()
          .whenComplete(() => context.config.onOpenAnimationComplete());
    } else if (context.config.isClosingAnimation) {
      _controller
          .reverse()
          .whenComplete(() => context.config.onCloseAnimationComplete());
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        size: const Size(double.infinity, double.infinity),
        painter: _RipplePainter(
          animation: CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOutSine,
          ),
          color: context.config.animatedRippleColor,
          center: context.config.center,
          radius:
              context.distanceToTheFurthestScreenCorner(context.config.center),
        ),
      ),
    );
  }
}

class _RipplePainter extends CustomPainter {
  _RipplePainter({
    required this.animation,
    required this.color,
    required this.center,
    required this.radius,
  })  : _paint = Paint(),
        super(repaint: animation);

  final Animation<double> animation;
  final Color color;
  final Point center;
  final double radius;

  final Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    _paint
      ..color = color
      ..style = PaintingStyle.fill;

    var value = animation.value;
    if (value >= 0.0 && value <= 1.0) {
      canvas.drawPath(
        Path()
          ..addOval(
            Rect.fromCircle(
              center: Offset(center.x.toDouble(), center.y.toDouble()),
              radius: radius * value,
            ),
          ),
        _paint,
      );
    }
  }

  @override
  bool shouldRepaint(_RipplePainter oldDelegate) => false;
}
