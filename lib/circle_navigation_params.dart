import 'package:flutter/material.dart';

class CircleNavigatorConfig extends InheritedWidget {
  const CircleNavigatorConfig({
    required this.animatedRippleColor,
    required this.filledCircleColor,
    required this.isOpeningAnimation,
    required this.onOpenAnimationComplete,
    required this.isClosingAnimation,
    required this.onCloseAnimationComplete,
    this.animationDuration = 800,
    this.backgroundAnimationDuration = 800,
    required this.iconSize,
    required super.child,
    super.key,
  });

  final Color animatedRippleColor;
  final Color filledCircleColor;
  final bool isOpeningAnimation;
  final void Function() onOpenAnimationComplete;
  final bool isClosingAnimation;
  final void Function() onCloseAnimationComplete;
  final int animationDuration;
  final int backgroundAnimationDuration;
  final double iconSize;

  static CircleNavigatorConfig? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CircleNavigatorConfig>();
  }

  static CircleNavigatorConfig of(BuildContext context) {
    final CircleNavigatorConfig? result = maybeOf(context);
    assert(result != null, 'No ClosingAnimationInheriterdParams found in the context');
    return result!;
  }

  @override
  bool updateShouldNotify(CircleNavigatorConfig oldWidget) {
    return isOpeningAnimation != oldWidget.isOpeningAnimation || isClosingAnimation != oldWidget.isClosingAnimation;
    // todo test lambda equality
  }
}
