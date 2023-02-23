import 'package:flutter/material.dart';

class TappableIcon extends StatefulWidget {
  final IconData iconData;
  final Color iconColor;
  final Color? outerBorderColor;
  final void Function() onTap;

  const TappableIcon({
    super.key,
    required this.iconData,
    required this.iconColor,
    required this.onTap,
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
      onTap: () => widget.onTap(),
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
            widget.iconData,
            color: _isTapped ? Colors.grey : widget.iconColor,
            size: 28.0,
          ),
        ),
      ),
    );
  }
}
