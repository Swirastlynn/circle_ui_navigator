import 'package:flutter/material.dart';

import '../utils/extensions.dart';

/// An animation enhancing [IconsCircle] to look more interesting with some circle scaling and icons rotation.
class AnimatedIconsCircle extends StatefulWidget {
  const AnimatedIconsCircle({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<AnimatedIconsCircle> createState() => _AnimatedIconsCircleState();
}

class _AnimatedIconsCircleState extends State<AnimatedIconsCircle>
    with TickerProviderStateMixin {
  double scale = 1.0;

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
        child: widget.child,
      ),
    );
  }
}
