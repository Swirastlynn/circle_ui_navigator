import 'package:circle_ui_navigator/animated_ripple_background.dart';
import 'package:circle_ui_navigator/icons_circle.dart';
import 'package:circle_ui_navigator/tappable_icon_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CircleNavigator extends StatelessWidget {
  const CircleNavigator({
    Key? key,
    required this.icons,
  }) : super(key: key);

  final List<IconData> icons;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedRippleBackground(rippleColor: Colors.blue.withOpacity(0.5)),
        IconsCircle(
          icons: List.generate(
            icons.length,
            (index) => TappableIconData(
                data: icons[index],
                onTap: () {
                  /**
                  * add navigation call based on your navigation setup
                  */
                }),
          ),
          closeIcon: TappableIconData(
              data: Icons.close,
              onTap: () {
                /**
                 * add navigation call based on your navigation setup
                 */

                // example works on Android
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  SystemNavigator.pop();
                }
              }),
        ),
      ],
    );
  }
}