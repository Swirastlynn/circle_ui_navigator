import 'package:circle_ui_navigator/circle_ui_navigator.dart';
import 'package:example/ripple_background.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.favorite,
      Icons.music_note,
      Icons.directions_bike,
      Icons.beach_access,
      Icons.bubble_chart,
    ];

    return MaterialApp(
      title: 'Icon Circle Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Icon Circle Demo'),
        ),
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  const FancyAnimationTransition(
                    child: CircularIcons(
                      icons: [
                        Icons.favorite,
                        Icons.star,
                        Icons.thumb_up,
                        Icons.thumb_down,
                        Icons.favorite_border,
                      ],
                      size: 200,
                      strokeWidth: 16,
                      color: Colors.red,
                    ),
                  ),
                  FancyAnimationTransition(
                    child: IconCircle(icons: icons),
                  ),
                ],
              ),
            ),
            const RippleBackground(),
          ],
        ),
      ),
    );
  }
}

class IconCircle extends StatelessWidget {
  final List<IconData> icons;

  const IconCircle({super.key, required this.icons});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 48.0;
    final double radius = (icons.length * iconSize * 2) / (2 * pi);

    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.blueGrey,
          width: 4,
        ),
      ),
      child: Stack(
        children: List.generate(icons.length, (index) {
          final double angle = 2 * pi * index / icons.length;
          final double x = radius + radius * cos(angle) - iconSize / 2;
          final double y = radius + radius * sin(angle) - iconSize / 2;

          return Positioned(
            left: x,
            top: y,
            child: Icon(
              icons[index],
              size: iconSize,
            ),
          );
        }),
      ),
    );
  }
}

class FancyAnimationTransition extends StatefulWidget {
  const FancyAnimationTransition({required this.child, super.key});

  final Widget child;

  @override
  State<FancyAnimationTransition> createState() => _FancyAnimationTransitionState();
}

class _FancyAnimationTransitionState extends State<FancyAnimationTransition> with TickerProviderStateMixin {
  double scale = 1.0;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward(from: 0.0);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build scale=$scale");

    return ScaleTransition(
      scale: _animation,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.child,
      ),
    );
  }
}
