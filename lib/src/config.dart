import 'dart:math';

import 'package:flutter/material.dart';

import '../circle_ui_navigator.dart';

const int animationDuration = 800;

/// [center] - central point of the widget and background ripple animation.
/// It's up to you to be sure that the widget is on the screen.
/// [animatedRippleColor] - color of the background ripple animation
/// [filledCircleColor] - color of the circle whose radius intersects icons
/// [isOpeningAnimation] - is the opening animation happenning at the moment
/// [onOpenAnimationComplete] - lambda to call for open animation
/// [isClosingAnimation] - is the closing animation happenning at the moment
/// [onCloseAnimationComplete] - lambda to call for close animation
/// [circleAnimationDuration] - circle navigator animation in milliseconds
/// [backgroundAnimationDuration] - background ripple animation in milliseconds
/// [iconSize] - default size of the icon
/// [actionIcons] contains predefined icons data.
/// Icons count should be between 3 and 10. The widget looks gorgeous for 5, 6 or 7 icons.
/// [closeIcon] contains predefined close icon data. It's the one in the middle of the widget.
class Config {
  const Config({
    required this.center,
    required this.animatedRippleColor,
    required this.filledCircleColor,
    required this.isOpeningAnimation,
    required this.onOpenAnimationComplete,
    required this.isClosingAnimation,
    required this.onCloseAnimationComplete,
    this.circleAnimationDuration = animationDuration,
    this.backgroundAnimationDuration = animationDuration,
    required this.iconSize,
    required this.actionIcons,
    required this.closeIcon,
  });

  final Point<double> center;
  final Color animatedRippleColor;
  final Color filledCircleColor;
  final bool isOpeningAnimation;
  final void Function() onOpenAnimationComplete;
  final bool isClosingAnimation;
  final void Function() onCloseAnimationComplete;
  final int circleAnimationDuration;
  final int backgroundAnimationDuration;
  final double iconSize;
  final List<TappableIconData> actionIcons;
  final TappableIconData closeIcon;
}
