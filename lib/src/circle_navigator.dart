import 'package:flutter/material.dart';

import 'background/animated_ripple_background.dart';
import 'icons_circle/icons_circle.dart';
import 'utils/calculus.dart';
import 'utils/extensions.dart';

/// The widget. Set up as a child of [CircleNavigatorConfig].
class CircleNavigator extends StatelessWidget {
  const CircleNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    double radius = calculateIconsCircleRadius(
      context.config.actionIcons.length,
      context.config.iconSize,
    );
    double boxSize = radius * 2 + context.config.iconSize;

    return Stack(
      children: [
        const AnimatedRippleBackground(),
        Positioned(
          left: context.config.center.x - boxSize / 2,
          top: context.config.center.y - boxSize / 2,
          child: IconsCircle(
            actionIcons: context.config.actionIcons,
            closeIcon: context.config.closeIcon,
            boxSize: boxSize,
            radius: radius,
          ),
        ),
      ],
    );
  }
}
