import 'package:circle_ui_navigator/closing_animation_inherited_params.dart';
import 'package:circle_ui_navigator/constants.dart';
import 'package:flutter/material.dart';

class AnimatedIconsCircle extends StatefulWidget {
  const AnimatedIconsCircle({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<AnimatedIconsCircle> createState() => _AnimatedIconsCircleState();
}

class _AnimatedIconsCircleState extends State<AnimatedIconsCircle> with TickerProviderStateMixin {
  double scale = 1.0;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: animationDuration),
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
