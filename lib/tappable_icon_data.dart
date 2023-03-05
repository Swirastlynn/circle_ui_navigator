import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
        onTap, // todo how it behaves for IconData?
        outerBorderColor,
        outerBorderSize,
      ];
}
