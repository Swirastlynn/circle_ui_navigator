import 'package:circle_ui_navigator/circle_navigation_params.dart';
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

  late final _animationDuration = CircleNavigatorConfig.of(context).backgroundAnimationDuration;
  late final _controller = AnimationController(
    duration: Duration(milliseconds: _animationDuration),
    vsync: this,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var config = CircleNavigatorConfig.of(context);
    if (config.isOpeningAnimation) {
      _controller.forward().whenComplete(() => config.onOpenAnimationComplete());
    } else if (config.isClosingAnimation) {
      _controller.reverse().whenComplete(() => config.onCloseAnimationComplete());
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
