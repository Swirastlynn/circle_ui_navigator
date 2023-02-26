import 'package:circle_ui_navigator/animated_ripple_background.dart';
import 'package:circle_ui_navigator/icons_circle.dart';
import 'package:circle_ui_navigator/circle_navigation_params.dart';
import 'package:circle_ui_navigator/tappable_icon_data.dart';
import 'package:flutter/material.dart';

class CircleNavigator extends StatefulWidget {
  const CircleNavigator({
    Key? key,
    required this.animatedRippleColor,
    required this.filledCircleColor,
    required this.icons,
    required this.navigateBack,
  }) : super(key: key);

  final Color animatedRippleColor;
  final Color filledCircleColor;
  final List<IconData> icons;
  final void Function() navigateBack;

  @override
  State<CircleNavigator> createState() => _CircleNavigatorState();
}

class _CircleNavigatorState extends State<CircleNavigator> {
  bool isClosingAnimation = false;

  @override
  Widget build(BuildContext context) {
    return CircleNavigatorParams(
      animatedRippleColor: widget.animatedRippleColor,
      filledCircleColor: widget.filledCircleColor,
      isClosingAnimation: isClosingAnimation,
      onCloseAnimationComplete: () {
        widget.navigateBack();
      },
      child: Stack(
        children: [
          const AnimatedRippleBackground(),
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
                }),
          ),
        ],
      ),
    );
  }
}
