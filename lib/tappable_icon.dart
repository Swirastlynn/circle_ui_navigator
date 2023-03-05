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
          border: widget.tappableIconData.outerBorderColor !=
                  null // todo this is different information than what I wanted to express actually
              ? Border.all(
                  color: widget.tappableIconData.outerBorderColor!, // todo
                  width: 12, // todo
                )
              : Border.all(
                  color: Colors.white, // todo
                  width: 10, // todo
                ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white, //todo
          ),
          child: SvgPicture.asset(
            widget.tappableIconData.assetPath,
            colorFilter: ColorFilter.mode(
              _isTapped ? widget.tappableIconData.tappedColor : widget.tappableIconData.color,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
