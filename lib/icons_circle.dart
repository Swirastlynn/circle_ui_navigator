import 'dart:math';
import 'package:circle_ui_navigator/animated_icons_circle.dart';
import 'package:circle_ui_navigator/circle_navigation_params.dart';
import 'package:circle_ui_navigator/tappable_icon.dart';
import 'package:circle_ui_navigator/tappable_icon_data.dart';
import 'package:flutter/material.dart';

class IconsCircle extends StatelessWidget {
  const IconsCircle({
    Key? key,
    required this.actionIcons,
    required this.closeIcon,
  }) : super(key: key);

  final List<TappableIconData> actionIcons;
  final TappableIconData closeIcon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedIconsCircle(
        child: IconsPositionedOnCircle(
          icons: actionIcons,
          closeIcon: closeIcon,
        ),
      ),
    );
  }
}

class IconsPositionedOnCircle extends StatelessWidget {
  const IconsPositionedOnCircle({
    super.key,
    required this.icons,
    required this.closeIcon,
  });

  final List<TappableIconData> icons;
  final TappableIconData closeIcon;

  @override
  Widget build(BuildContext context) {
    const double iconSize = 48.0;
    const double iconRadius = iconSize / 2;
    final double circleRadius = (icons.length * iconSize * 2) / (2 * pi);
    final double circleDiameter = circleRadius * 2;
    final params = CircleNavigatorParams.of(context);

    return SizedBox(
      width: circleDiameter + iconSize,
      height: circleDiameter + iconSize,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: circleDiameter,
              height: circleDiameter,
              decoration: BoxDecoration(
                color: params.filledCircleColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          ...List.generate(
            icons.length,
            (index) {
              final double angle = 2 * pi * index / icons.length;
              final double x = circleRadius + circleRadius * cos(angle) - iconSize / 2 + iconRadius;
              final double y = circleRadius + circleRadius * sin(angle) - iconSize / 2 + iconRadius;
              return Positioned(
                left: x,
                top: y,
                width: iconSize,
                height: iconSize,
                child: TappableIcon(
                  tappableIconData: icons[index],
                ),
              );
            },
          ),
          Center(
            child: Positioned(
              width: iconSize,
              height: iconSize,
              child: TappableIcon(
                tappableIconData: closeIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
