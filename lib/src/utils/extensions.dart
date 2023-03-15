import 'dart:math';

import 'package:circle_ui_navigator/src/config.dart';
import 'package:flutter/material.dart';

import '../circle_navigator_config.dart';

extension BuildContextExtension on BuildContext {
  Config get config => CircleNavigatorConfig.of(this).config;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension ScreenSizesExtension on BuildContext {
  double distanceToTheFurthestScreenCorner(Point<double> point) {
    var distanceToTopLeftCorner = point.distanceTo(const Point(0, 0));
    var distanceToTopRightCorner = point.distanceTo(Point(mediaQuery.size.width, 0));
    var distanceToBottomLeftCorner = point.distanceTo(Point(0, mediaQuery.size.height));
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

  double availableScreenHeight({
    required double statusBarHeight,
    required double appBarHeight,
    required double bottomNavigationBarHeight,
  }) {
    return mediaQuery.size.height - (statusBarHeight + appBarHeight + kBottomNavigationBarHeight);
  }
}
