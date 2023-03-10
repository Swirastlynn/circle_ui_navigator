import 'package:circle_ui_navigator/animated_ripple_background.dart';
import 'package:circle_ui_navigator/circle_calculator.dart';
import 'package:circle_ui_navigator/extensions.dart';
import 'package:circle_ui_navigator/icons_circle.dart';
import 'package:circle_ui_navigator/tappable_icon_data.dart';
import 'package:flutter/material.dart';

class CircleNavigator extends StatelessWidget {
  const CircleNavigator({
    Key? key,
    required this.actionIcons, // should be between 3 and 10 icons, looks gorgeous for 5, 6 or 7
    required this.closeIcon,
    required this.calculator,
  }) : super(key: key);

  final List<TappableIconData> actionIcons;
  final TappableIconData closeIcon;
  final CircleCalculator calculator;

  @override
  Widget build(BuildContext context) {
    double radius = calculator.calculateRadius(actionIcons.length, context.config.iconSize);
    double boxSize = radius * 2 + context.config.iconSize;

    return Stack(
      children: [
        const AnimatedRippleBackground(),
        Positioned(
          left: context.config.center.x - boxSize / 2,
          top: context.config.center.y - boxSize / 2,
          child: IconsCircle(
            actionIcons: actionIcons,
            closeIcon: closeIcon,
            boxSize: boxSize,
            radius: radius,
          ),
        ),
      ],
    );
  }
}
