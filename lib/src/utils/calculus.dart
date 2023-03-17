import 'dart:math';

/// A file to keep custom calculations.
double calculateIconsCircleRadius({
  required int iconsCount,
  required double iconSize,
}) {
  double smallCircleSize = iconsCount * iconSize * 3 / (2 * pi);
  double bigCircleSize = iconsCount * iconSize * 2 / (2 * pi);
  return (iconsCount <= 3) ? smallCircleSize : bigCircleSize;
}
