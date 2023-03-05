import 'package:circle_ui_navigator/circle_navigation_params.dart';
import 'package:circle_ui_navigator/circle_navigator.dart';
import 'package:circle_ui_navigator/tappable_icon_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isClosingAnimation = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circle UI Navigator example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Circle UI Navigator example'),
        ),
        body: CircleNavigatorParams(
          animatedRippleColor: const Color.fromRGBO(102, 160, 254, 0.7),
          filledCircleColor: const Color(0xFFB4D8FF).withOpacity(0.7),
          isClosingAnimation: _isClosingAnimation,
          onCloseAnimationComplete: () {
            () {
              /**
              * Add navigation call based on your navigation setup.
              * This one works only on Android.
              */
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                SystemNavigator.pop();
              }
            };
          },
          child: CircleNavigator(
            actionIcons: [
              TappableIconData(
                assetPath: 'assets/images/local_florist.svg',
                color: Colors.green,
                onTap: () {
                  /**
                  * Add navigation call based on your navigation setup.
                  */
                },
                tappedColor: Colors.grey,
              ),
              TappableIconData(
                assetPath: 'assets/images/local_activity.svg',
                color: Colors.purple,
                onTap: () {
                  /**
                  * Add navigation call based on your navigation setup.
                  */
                },
                tappedColor: Colors.grey,
              ),
              TappableIconData(
                assetPath: 'assets/images/restaurant.svg',
                color: Colors.orange.shade700,
                onTap: () {
                  /**
                  * Add navigation call based on your navigation setup.
                  */
                },
                tappedColor: Colors.grey,
              ),
              TappableIconData(
                assetPath: 'assets/images/baby_changing_station.svg',
                color: Colors.red.shade700,
                onTap: () {
                  /**
                  * Add navigation call based on your navigation setup.
                  */
                },
                tappedColor: Colors.grey,
              ),
              TappableIconData(
                assetPath: 'assets/images/construction.svg',
                color: Colors.yellow.shade800,
                onTap: () {
                  /**
                  * Add navigation call based on your navigation setup.
                  */
                },
                tappedColor: Colors.grey,
              ),
            ],
            closeIcon: TappableIconData(
              color: const Color(0xFF3678D0),
              assetPath: 'assets/images/close.svg',
              onTap: () {
                setState(() {
                  _isClosingAnimation = true;
                });
              },
              tappedColor: const Color(0xFF3678D0).withOpacity(0.5),
              outerBorderColor: Colors.white54,
            ),
          ),
        ),
      ),
    );
  }
}
