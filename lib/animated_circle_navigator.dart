import 'package:circle_ui_navigator/constants.dart';
import 'package:flutter/material.dart';

class AnimatedCircleNavigator extends StatefulWidget {
  const AnimatedCircleNavigator({required this.child, super.key});

  final Widget child;

  @override
  State<AnimatedCircleNavigator> createState() => _AnimatedCircleNavigatorState();
}

class _AnimatedCircleNavigatorState extends State<AnimatedCircleNavigator> with TickerProviderStateMixin {
  double scale = 1.0;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: animationDuration),
    vsync: this,
  )..forward(from: 0.0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCirc,
    );
    var reverseTween = Tween<double>(
      begin: 1,
      end: 0,
    );
    return RotationTransition(
      turns: reverseTween.animate(curvedAnimation),
      child: ScaleTransition(
        scale: curvedAnimation,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.child,
        ),
      ),
    );
  }
}
