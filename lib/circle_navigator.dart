import 'dart:math';
import 'package:circle_ui_navigator/animated_circle_navigator.dart';
import 'package:flutter/material.dart';

class CircleNavigator extends StatelessWidget {
  const CircleNavigator({
    Key? key,
    required this.icons,
    required this.closeIcon,
  }) : super(key: key);

  final List<IconData> icons;
  final IconData closeIcon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedCircleNavigator(
        child: IconsPositionedOnCircle(icons: icons, closeIcon: closeIcon),
      ),
    );
  }
}

class IconsPositionedOnCircle extends StatelessWidget {
  const IconsPositionedOnCircle({super.key, required this.icons, required this.closeIcon});

  final List<IconData> icons;
  final IconData closeIcon;

  @override
  Widget build(BuildContext context) {
    const double iconSize = 48.0;
    final double radius = (icons.length * iconSize * 2) / (2 * pi);
    const double iconRadius = iconSize / 2;

    return SizedBox(
      width: radius * 2 + iconSize,
      height: radius * 2 + iconSize,
      // padding: EdgeInsets.all(padding),
      child: Stack(
        children: [
          Center(
            child: Container(
              width: radius * 2,
              height: radius * 2,
              decoration: const BoxDecoration(
                color: Colors.lightGreen, // todo param
                shape: BoxShape.circle,
              ),
            ),
          ),
          ...List.generate(
            icons.length,
            (index) {
              final double angle = 2 * pi * index / icons.length;
              final double x = radius + radius * cos(angle) - iconSize / 2 + iconRadius;
              final double y = radius + radius * sin(angle) - iconSize / 2 + iconRadius;

              return Positioned(
                left: x,
                top: y,
                width: iconSize,
                height: iconSize,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    icons[index],
                  ),
                ),
              );
            },
          ),
          Center(
            child: Positioned(
              width: iconSize,
              height: iconSize,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blue, // todo param
                    width: 12,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // todo param
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blueGrey, // todo param
                      width: 12,
                    ),
                  ),
                  child: Icon(
                    closeIcon,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
