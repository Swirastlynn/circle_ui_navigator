import 'dart:math';
import 'package:circle_ui_navigator/animated_icons_circle.dart';
import 'package:circle_ui_navigator/extensions.dart';
import 'package:circle_ui_navigator/tappable_icon.dart';
import 'package:circle_ui_navigator/tappable_icon_data.dart';
import 'package:flutter/material.dart';

class IconsCircle extends StatelessWidget {
  const IconsCircle({
    Key? key,
    required this.actionIcons,
    required this.closeIcon,
    required this.boxSize,
    required this.circleRadius,
    required this.circleDiameter,
  }) : super(key: key);

  final List<TappableIconData> actionIcons;
  final TappableIconData closeIcon;
  final double boxSize;
  final double circleRadius;
  final double circleDiameter;

  @override
  Widget build(BuildContext context) {
    return AnimatedIconsCircle(
      child: IconsPositionedOnCircle(
        icons: actionIcons,
        closeIcon: closeIcon,
        boxSize: boxSize,
        circleRadius: circleRadius,
        circleDiameter: circleDiameter,
      ),
    );
  }
}

class IconsPositionedOnCircle extends StatelessWidget {
  const IconsPositionedOnCircle({
    super.key,
    required this.icons,
    required this.closeIcon,
    required this.boxSize,
    required this.circleRadius,
    required this.circleDiameter,
  });

  final List<TappableIconData> icons;
  final TappableIconData closeIcon;
  final double boxSize;
  final double circleRadius;
  final double circleDiameter;

  @override
  Widget build(BuildContext context) {
     double iconSize = context.config.iconSize;
     double iconRadius = iconSize / 2;
    return SizedBox(
      width: boxSize,
      height: boxSize,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: circleDiameter,
              height: circleDiameter,
              decoration: BoxDecoration(
                color: context.config.filledCircleColor,
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
          Positioned(
            left: circleDiameter / 2,
            top: circleDiameter / 2,
            width: iconSize,
            height: iconSize,
            child: TappableIcon(
              tappableIconData: closeIcon,
            ),
          ),
        ],
      ),
    );
  }
}
