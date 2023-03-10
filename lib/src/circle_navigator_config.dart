import 'dart:math';

import 'package:flutter/material.dart';

/// Entry point of the library. Use it in your project.
///
/// [center] - central point of the widget and background ripple animation.
/// It's up to you to be sure that the widget is on the screen.
/// [animatedRippleColor] - color of the background ripple animation
/// [filledCircleColor] - color of the circle whose radius intersects icons
/// [isOpeningAnimation] - is the opening animation happenning at the moment
/// [onOpenAnimationComplete] - lambda to call for open animation
/// [isClosingAnimation] - is the closing animation happenning at the moment
/// [onCloseAnimationComplete] - lambda to call for close animation
/// [iconSize] - default size of the icon
/// [animationDuration] - circle navigator animation in milliseconds
/// [backgroundAnimationDuration] - background ripple animation in milliseconds
/// [child] - [CircleNavigator]. The core widget.
class CircleNavigatorConfig extends InheritedWidget {
  const CircleNavigatorConfig({
    required this.center,
    required this.animatedRippleColor,
    required this.filledCircleColor,
    required this.isOpeningAnimation,
    required this.onOpenAnimationComplete,
    required this.isClosingAnimation,
    required this.onCloseAnimationComplete,
    required this.iconSize,
    this.animationDuration = 800,
    this.backgroundAnimationDuration = 800,
    required super.child,
    super.key,
  });

  final Point<double> center;
  final Color animatedRippleColor;
  final Color filledCircleColor;
  final bool isOpeningAnimation;
  final void Function() onOpenAnimationComplete;
  final bool isClosingAnimation;
  final void Function() onCloseAnimationComplete;
  final double iconSize;
  final int animationDuration;
  final int backgroundAnimationDuration;

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
    return isOpeningAnimation != oldWidget.isOpeningAnimation ||
        isClosingAnimation != oldWidget.isClosingAnimation ||
        onOpenAnimationComplete != oldWidget.onOpenAnimationComplete ||
        onCloseAnimationComplete != oldWidget.onCloseAnimationComplete;
  }
}
