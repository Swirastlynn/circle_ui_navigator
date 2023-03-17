// ignore_for_file: avoid_print

import 'package:circle_ui_navigator/src/utils/calculus.dart';
import 'package:test/test.dart';

const samsungS20ScreenWidth = 360;
void main() {
  test(
      '''GIVEN 10 icons for standard 48 icons size WHEN calculating appropriate circle radius THEN circle radius size smaller than usual smallest screen width minus icon size''',
      () {
    var iconSize = 48.0;
    var diameter = 2 *
        calculateIconsCircleRadius(
          iconsCount: 10,
          iconSize: iconSize,
        );
    // print(diameter);
    expect(
      diameter,
      lessThan(samsungS20ScreenWidth - iconSize),
    );
  });

  test(
      '''GIVEN 3 icons for standard 48 icons size WHEN calculating appropriate circle radius THEN circle radius size bigger than 2 icons size in a row''',
      () {
    var iconSize = 48.0;
    var diameter = 2 * calculateIconsCircleRadius(iconsCount: 3, iconSize: iconSize);
    // print(diameter);
    expect(
      diameter,
      greaterThan(iconSize * 2),
    );
  });
}
