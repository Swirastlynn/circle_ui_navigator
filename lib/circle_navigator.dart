import 'package:circle_ui_navigator/animated_ripple_background.dart';
import 'package:circle_ui_navigator/icons_circle.dart';
import 'package:circle_ui_navigator/closing_animation_inherited_params.dart';
import 'package:circle_ui_navigator/tappable_icon_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CircleNavigator extends StatefulWidget {
  const CircleNavigator({
    Key? key,
    required this.icons,
  }) : super(key: key);

  final List<IconData> icons;

  @override
  State<CircleNavigator> createState() => _CircleNavigatorState();
}

class _CircleNavigatorState extends State<CircleNavigator> {
  bool isClosingAnimation = false;

  @override
  Widget build(BuildContext context) {
    return ClosingAnimationInheriterdParams(
      isClosingAnimation: isClosingAnimation,
      onCloseAnimationComplete: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          SystemNavigator.pop();
        }
      },
      child: Stack(
        children: [
          AnimatedRippleBackground(
            rippleColor: Colors.blue.withOpacity(0.5),
          ),
          IconsCircle(
              icons: List.generate(
                widget.icons.length,
                (index) => TappableIconData(
                    data: widget.icons[index],
                    onTap: () {
                      /**
                    * add navigation call based on your navigation setup
                    */
                    }),
              ),
              closeIcon: TappableIconData(
                  data: Icons.close,
                  onTap: () {
                    setState(() {
                      isClosingAnimation = true;
                    });
                    /**
                   * add navigation call based on your navigation setup
                   */
                  }),
              ),
        ],
      ),
    );
  }
}
