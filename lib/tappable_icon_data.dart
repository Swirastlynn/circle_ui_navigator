import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TappableIconData extends Equatable {
  const TappableIconData({
    required this.data,
    required this.onTap,
  });

  final IconData data;
  final void Function() onTap;

  @override
  List<Object> get props => [
        data, // todo how it behaves for IconData?
        onTap,
      ];
}
