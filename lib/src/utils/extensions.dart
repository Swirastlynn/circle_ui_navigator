import 'dart:math';

import 'package:circle_ui_navigator/src/config.dart';
import 'package:flutter/material.dart';

import '../circle_navigator_config.dart';

/// File for utility functions in form of an extension
extension BuildContextExtension on BuildContext {
  Config get config => CircleNavigatorConfig.of(this).config;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension ScreenSizesExtension on BuildContext {
  /// [point] - from this point the distance is measured
  double distanceToTheFurthestScreenCorner(Point<double> point) {
    var distanceToTopLeftCorner = point.distanceTo(const Point(0, 0));
    var distanceToTopRightCorner =
        point.distanceTo(Point(mediaQuery.size.width, 0));
    var distanceToBottomLeftCorner =
        point.distanceTo(Point(0, mediaQuery.size.height));
    var distanceToBottomRightCorner = point.distanceTo(Point(
      mediaQuery.size.width,
      mediaQuery.size.height,
    ));
    return [
      distanceToTopLeftCorner,
      distanceToTopRightCorner,
      distanceToBottomLeftCorner,
      distanceToBottomRightCorner,
    ].reduce(max);
  }

  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;

  /// Occasionally, it's up to us - developers - to decide how much space is available for
  /// our widgets. An example is when we want to know available height to center the widget
  /// in accordance to that height.
  /// [statusBarHeight] - a tiny the most top bar in the app
  /// [appBarHeight] - our AppBar height
  /// [bottomNavigationBarHeight] - usually kBottomNavigationBarHeight
  double availableScreenHeight({
    required double statusBarHeight,
    required double appBarHeight,
    required double bottomNavigationBarHeight,
  }) {
    return mediaQuery.size.height -
        (statusBarHeight + appBarHeight + bottomNavigationBarHeight);
  }
}
