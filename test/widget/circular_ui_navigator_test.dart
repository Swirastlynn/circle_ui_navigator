// ignore_for_file: prefer_const_constructors

import 'package:circle_ui_navigator/src/config.dart';
import 'package:circle_ui_navigator/src/icons_circle/tappable_icon.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

const iPhone13Size = Size(375, 667);
// todo more sizes
void main() {
  testWidgets('WHEN 5 actions THEN 6 icons found', (tester) async {
    await tester.binding.setSurfaceSize(iPhone13Size);
    await tester.loadCircleNavigatorWidget(actionIcons: 5, size: iPhone13Size);
    await tester.pumpAndSettle(Duration(milliseconds: animationDuration));

    expect(find.byType(TappableIcon), findsNWidgets(6));
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('WHEN 10 actions THEN 11 icons found', (tester) async {
    await tester.binding.setSurfaceSize(iPhone13Size);
    await tester.loadCircleNavigatorWidget(actionIcons: 10, size: iPhone13Size);
    await tester.pumpAndSettle(Duration(milliseconds: animationDuration));

    expect(find.byType(TappableIcon), findsNWidgets(11));
    await tester.binding.setSurfaceSize(null);
  });
}
