import 'package:flutter/material.dart';

class CircleNavigatorParams extends InheritedWidget {

  const CircleNavigatorParams({
    required this.animatedRippleColor,
    required this.filledCircleColor,
    required this.isClosingAnimation,
    required this.onCloseAnimationComplete,
    required this.iconSize,
    required super.child,
    super.key,
  });

  final Color animatedRippleColor;
  final Color filledCircleColor;
  final bool isClosingAnimation;
  final void Function() onCloseAnimationComplete;
  final double iconSize;

  static CircleNavigatorParams? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CircleNavigatorParams>();
  }

  static CircleNavigatorParams of(BuildContext context) {
    final CircleNavigatorParams? result = maybeOf(context);
    assert(result != null, 'No ClosingAnimationInheriterdParams found in the context');
    return result!;
  }

  @override
  bool updateShouldNotify(CircleNavigatorParams oldWidget) {
    return isClosingAnimation != oldWidget.isClosingAnimation ||
        onCloseAnimationComplete != oldWidget.onCloseAnimationComplete;
    // todo test lambda equality
  }
}
