import 'package:circle_ui_navigator/tappable_icon_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TappableIcon extends StatefulWidget {
  final TappableIconData tappableIconData;

  const TappableIcon({
    super.key,
    required this.tappableIconData,
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
          border: widget.tappableIconData.outerBorderColor != null
              ? Border.all(
                  color: widget.tappableIconData.outerBorderColor!,
                  width: 16,
                )
              : Border.all(
                  color: Colors.white,
                  width: 10,
                ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: SvgPicture.asset(
            widget.tappableIconData.assetPath,
            color: _isTapped ? widget.tappableIconData.tappedColor : widget.tappableIconData.color,
            width: 32,
            height: 32,
          ),
        ),
      ),
    );
  }
}
