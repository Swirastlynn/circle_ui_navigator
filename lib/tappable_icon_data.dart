import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TappableIconData extends Equatable {
  const TappableIconData({
    required this.assetPath,
    required this.color,
    required this.tappedColor,
    required this.onTap,
    this.outerBorderColor,
  });

  final String assetPath;
  final Color color;
  final Color tappedColor;
  final void Function() onTap;
  final Color? outerBorderColor;

  @override
  List<Object?> get props => [
        assetPath,
        color,
        outerBorderColor,
        onTap, // todo how it behaves for IconData?
      ];
}
