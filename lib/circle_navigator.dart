import 'dart:math';
import 'package:circle_ui_navigator/circle_navigator_animations.dart';
import 'package:flutter/material.dart';

class CircleNavigator extends StatelessWidget {
  const CircleNavigator({
    Key? key,
    required this.icons,
  }) : super(key: key);

  final List<IconData> icons;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleNavigatorAnimations(
        child: IconsPositionedOnCircle(icons: icons),
      ),
    );
  }
}

class IconsPositionedOnCircle extends StatelessWidget {
  final List<IconData> icons;

  const IconsPositionedOnCircle({super.key, required this.icons});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 48.0;
    final double radius = (icons.length * iconSize * 2) / (2 * pi);

    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.blueGrey,
          width: 4,
        ),
      ),
      child: Stack(
        children: List.generate(icons.length, (index) {
          final double angle = 2 * pi * index / icons.length;
          final double x = radius + radius * cos(angle) - iconSize / 2;
          final double y = radius + radius * sin(angle) - iconSize / 2;

          return Positioned(
            left: x,
            top: y,
            child: Icon(
              icons[index],
              size: iconSize,
            ),
          );
        }),
      ),
    );
  }
}
