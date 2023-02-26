import 'package:circle_ui_navigator/animated_ripple_background.dart';
import 'package:circle_ui_navigator/icons_circle.dart';
import 'package:circle_ui_navigator/circle_navigation_params.dart';
import 'package:circle_ui_navigator/tappable_icon_data.dart';
import 'package:flutter/material.dart';

class CircleNavigator extends StatelessWidget {
  const CircleNavigator({
    Key? key,
    required this.actionIcons,
    required this.closeIcon,
  }) : super(key: key);

  final List<TappableIconData> actionIcons;
  final TappableIconData closeIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AnimatedRippleBackground(),
        IconsCircle(
          actionIcons: actionIcons, // todo inherinted?
          closeIcon: closeIcon,
        ),
      ],
    );
  }
}
