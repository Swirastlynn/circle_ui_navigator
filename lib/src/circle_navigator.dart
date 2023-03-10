import 'package:circle_ui_navigator/src/background/animated_ripple_background.dart';
import 'package:circle_ui_navigator/src/icons_circle/icons_circle.dart';
import 'package:circle_ui_navigator/src/tappable_icon_data.dart';
import 'package:circle_ui_navigator/src/utils/calculus.dart';
import 'package:circle_ui_navigator/src/utils/extensions.dart';
import 'package:flutter/material.dart';

/// Part of the configuration. Child of [CircleNavigatorConfig].
///
/// [actionIcons] contains predefined icons data.
/// Its count should be between 3 and 10. The widget looks gorgeous for 5, 6 or 7 icons.
/// [closeIcon] contains predefined close icon data.
/// It's the one in the middle of the widget.
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
    double radius = calculateCircleRadius(actionIcons.length, context.config.iconSize);
    double boxSize = radius * 2 + context.config.iconSize;

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
            radius: radius,
          ),
        ),
      ],
    );
  }
}
