import 'dart:math';

double calculateCircleRadius(int iconsCount, double iconSize) {
  double smallCircleSize = iconsCount * iconSize * 3 / (2 * pi);
  double bigCircleSize = iconsCount * iconSize * 2 / (2 * pi);
  return (iconsCount <= 3) ? smallCircleSize : bigCircleSize;
}