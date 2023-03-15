// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:circle_ui_navigator/circle_ui_navigator.dart';
import 'package:circle_ui_navigator/src/icons_circle/tappable_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

const samsungS20Size = Size(360, 800);
const iPhone13MiniSize = Size(375, 812);
const iPhone11ProMaxSize = Size(414, 896);
const iPhone13Size = Size(375, 667);
const samsungS20LandscapeSize = Size(800, 360);

void main() {
  testWidgets('''
  GIVEN landscape and widget centered on a screen
  WHEN 5 actions 
  THEN 6 icons found''', (tester) async {
    await tester.binding.setSurfaceSize(samsungS20LandscapeSize);
    await tester.loadCircleNavigatorWidget(
      actionsCount: 5,
      center: Point(samsungS20LandscapeSize.width / 2, samsungS20LandscapeSize.height / 2),
    );
    await tester.pumpAndSettle(Duration(milliseconds: animationDuration));

    expect(find.byType(TappableIcon).hitTestable(), findsNWidgets(6));
    await tester.binding.setSurfaceSize(null);
  });

  // TODO The test works only when called alone, which is flaky.
  // TODO It reminds https://stackoverflow.com/questions/68997984/why-do-some-flutter-widget-tests-fail-if-executed-together-but-pass-individually
  // testWidgets('''
  // GIVEN portrait and widget centered on a screen
  // WHEN 9 actions
  // THEN 10 icons found''', (tester) async {
  //   await tester.binding.setSurfaceSize(iPhone13Size);
  //   await tester.loadCircleNavigatorWidget(
  //     actionsCount: 9,
  //     center: Point(iPhone13Size.width / 2, iPhone13Size.height / 2),
  //   );
  //   await tester.pumpAndSettle(Duration(milliseconds: animationDuration));

  //   expect(find.byType(TappableIcon).hitTestable(), findsNWidgets(10));
  //   await tester.binding.setSurfaceSize(null);
  // });
}
