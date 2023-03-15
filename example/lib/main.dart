import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:circle_ui_navigator/circle_ui_navigator.dart';

/// An example of how to show the widget in the middle of the screen.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isOpeningAnimation = true;
  bool _isClosingAnimation = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circle UI Navigator example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Circle UI Navigator example'),
        ),
        body: Builder(builder: (context) {
          double pageWidth = context.screenWidth;
          double pageHeight = context.availableScreenHeight(
            statusBarHeight: MediaQueryData.fromWindow(window).padding.top,
            appBarHeight: 0,
            bottomNavigationBarHeight: kBottomNavigationBarHeight,
          );

          return CircleNavigatorConfig(
            center: Point(pageWidth / 2, pageHeight / 2),
            animatedRippleColor: const Color(0xFF66A0FE).withOpacity(0.7),
            filledCircleColor: const Color(0xFFB4D8FF).withOpacity(0.7),
            isOpeningAnimation: _isOpeningAnimation,
            onOpenAnimationComplete: () {
              setState(() {
                _isOpeningAnimation = false;
              });
            },
            isClosingAnimation: _isClosingAnimation,
            onCloseAnimationComplete: () {
              setState(() {
                _isClosingAnimation = false;
              });
              /**
              * Add navigation call based on your navigation setup.
              * This one is tested only on Android and OSX.
              */
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                SystemNavigator.pop();
              }
            },
            iconSize: 48.0,
            actionIcons: [
              TappableIconData(
                assetPath: 'assets/images/local_florist.svg',
                color: Colors.green,
                tappedColor: Colors.grey,
                onTap: () {
                  /**
                  * Add navigation call based on your navigation setup.
                  */
                },
                outerBorderColor: Colors.white,
                outerBorderSize: 10,
                innerBorderColor: Colors.white,
              ),
              TappableIconData(
                assetPath: 'assets/images/local_activity.svg',
                color: Colors.purple,
                tappedColor: Colors.grey,
                onTap: () {
                  /**
                  * Add navigation call based on your navigation setup.
                  */
                },
                outerBorderColor: Colors.white,
                outerBorderSize: 10,
                innerBorderColor: Colors.white,
              ),
              TappableIconData(
                assetPath: 'assets/images/restaurant.svg',
                color: Colors.orange.shade700,
                tappedColor: Colors.grey,
                onTap: () {
                  /**
                  * Add navigation call based on your navigation setup.
                  */
                },
                outerBorderColor: Colors.white,
                outerBorderSize: 10,
                innerBorderColor: Colors.white,
              ),
              TappableIconData(
                assetPath: 'assets/images/baby_changing_station.svg',
                color: Colors.red.shade700,
                tappedColor: Colors.grey,
                onTap: () {
                  /**
                  * Add navigation call based on your navigation setup.
                  */
                },
                outerBorderColor: Colors.white,
                outerBorderSize: 10,
                innerBorderColor: Colors.white,
              ),
              TappableIconData(
                assetPath: 'assets/images/construction.svg',
                color: Colors.yellow.shade800,
                tappedColor: Colors.grey,
                onTap: () {
                  /**
                  * Add navigation call based on your navigation setup.
                  */
                },
                outerBorderColor: Colors.white,
                outerBorderSize: 10,
                innerBorderColor: Colors.white,
              ),
            ],
            closeIcon: TappableIconData(
              color: const Color(0xFF3678D0),
              assetPath: 'assets/images/close.svg',
              tappedColor: const Color(0xFF3678D0).withOpacity(0.5),
              onTap: () {
                setState(() {
                  _isClosingAnimation = true;
                });
              },
              outerBorderColor: Colors.white54,
              outerBorderSize: 12,
              innerBorderColor: Colors.white,
            ),
            child: const CircleNavigator(),
          );
        }),
      ),
    );
  }
}
