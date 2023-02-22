import 'dart:math';
import 'package:circle_ui_navigator/animated_circle_navigator.dart';
import 'package:circle_ui_navigator/tappable_icon.dart';
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
      child: Stack(
        children: [
          Center(
            child: Container(
              width: radius * 2,
              height: radius * 2,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 74, 171, 195), // todo param
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
                child: TappableIcon(
                  iconData: icons[index],
                  iconColor: Colors.red, // todo different colors possibility
                ),
              );
            },
          ),
          Center(
            child: Positioned(
              width: iconSize,
              height: iconSize,
              child: TappableIcon(
                iconData: closeIcon,
                iconColor: Colors.black, // todo different colors possibility
                outerBorderColor: Colors.lightBlue.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
