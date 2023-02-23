import 'package:circle_ui_navigator/tappable_icon_data.dart';
import 'package:flutter/material.dart';

class TappableIcon extends StatefulWidget {
  final TappableIconData tappableIconData;
  final Color iconColor;
  final Color? outerBorderColor;

  const TappableIcon({
    super.key,
    required this.tappableIconData,
    required this.iconColor,
    this.outerBorderColor,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TappableIconState createState() => _TappableIconState();
}

class _TappableIconState extends State<TappableIcon> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.tappableIconData.onTap(),
      onTapDown: (_) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapped = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: widget.outerBorderColor != null
              ? Border.all(
                  color: widget.outerBorderColor!,
                  width: 18,
                )
              : null,
        ),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(
            widget.tappableIconData.data,
            color: _isTapped ? Colors.grey : widget.iconColor,
            size: 28.0,
          ),
        ),
      ),
    );
  }
}
