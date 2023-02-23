import 'dart:math';
import 'package:circle_ui_navigator/animated_icons_circle.dart';
import 'package:circle_ui_navigator/tappable_icon.dart';
import 'package:circle_ui_navigator/tappable_icon_data.dart';
import 'package:flutter/material.dart';

class IconsCircle extends StatelessWidget {
  const IconsCircle({
    Key? key,
    required this.icons,
    required this.closeIcon,
  }) : super(key: key);

  final List<TappableIconData> icons;
  final TappableIconData closeIcon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedIconsCircle(
        child: IconsPositionedOnCircle(
          icons: icons,
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
    final double radius = (icons.length * iconSize * 2) / (2 * pi);

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
                  tappableIconData: icons[index],
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
                tappableIconData: closeIcon,
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
