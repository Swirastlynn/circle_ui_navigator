import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Visual representation of [TappableIcon]
/// [assetPath] - path to your local file
/// [color] - icon color
/// [tappedColor] - tapped icon color
/// [assetPath] - lambda to call on icon tap event
/// [outerBorderColor] - color of the border around icon
/// [outerBorderSize] - size of the border around icon
/// [innerBorderColor] - color of the border around icon between icon and outer border
class TappableIconData extends Equatable {
  const TappableIconData({
    required this.assetPath,
    required this.color,
    required this.tappedColor,
    required this.onTap,
    required this.outerBorderColor,
    required this.outerBorderSize,
    required this.innerBorderColor,
  });

  final String assetPath;
  final Color color;
  final Color tappedColor;
  final void Function() onTap;
  final Color outerBorderColor;
  final double outerBorderSize;
  final Color innerBorderColor;

  @override
  List<Object?> get props => [
        assetPath,
        color,
        tappedColor,
        onTap,
        outerBorderColor,
        outerBorderSize,
      ];
}
