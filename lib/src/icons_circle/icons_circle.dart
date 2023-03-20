import 'package:flutter/material.dart';

import '../tappable_icon_data.dart';
import 'animated_icons_circle.dart';
import 'icons_positioned_on_circle.dart';

/// The animated circle part of the [CircleNavigator]
class IconsCircle extends StatelessWidget {
  const IconsCircle({
    Key? key,
    required this.actionIcons,
    required this.closeIcon,
    required this.boxSize,
    required this.radius,
  }) : super(key: key);

  final List<TappableIconData> actionIcons;
  final TappableIconData closeIcon;
  final double boxSize;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return AnimatedIconsCircle(
      child: IconsPositionedOnCircle(
        icons: actionIcons,
        closeIcon: closeIcon,
        boxSize: boxSize,
        radius: radius,
      ),
    );
  }
}
