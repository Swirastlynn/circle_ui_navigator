import 'dart:math';

import 'package:circle_ui_navigator/animated_ripple_background.dart';
import 'package:circle_ui_navigator/extensions.dart';
import 'package:circle_ui_navigator/icons_circle.dart';
import 'package:circle_ui_navigator/tappable_icon_data.dart';
import 'package:flutter/material.dart';

class CircleNavigator extends StatelessWidget {
  const CircleNavigator({
    Key? key,
    required this.actionIcons, // should be between 3 and 10 icons, looks gorgeous for 5, 6 or 7
    required this.closeIcon,
  }) : super(key: key);

  final List<TappableIconData> actionIcons;
  final TappableIconData closeIcon;

  @override
  Widget build(BuildContext context) {
    double iconSize = context.config.iconSize; // todo calculations to separate class
    double smallCircleSize = actionIcons.length * iconSize * 3 / (2 * pi);
    double bigCircleSize = actionIcons.length * iconSize * 2 / (2 * pi);
    final double circleRadius = (actionIcons.length <= 3) ? smallCircleSize : bigCircleSize;
    final double circleDiameter = circleRadius * 2;
    final boxSize = circleDiameter + iconSize;

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
            circleRadius: circleRadius,
            circleDiameter: circleDiameter,
          ),
        ),
      ],
    );
  }
}
