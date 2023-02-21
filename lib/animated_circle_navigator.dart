import 'package:flutter/material.dart';

class AnimatedCircleNavigator extends StatefulWidget {
  const AnimatedCircleNavigator({required this.child, super.key});

  final Widget child;

  @override
  State<AnimatedCircleNavigator> createState() => _AnimatedCircleNavigatorState();
}

class _AnimatedCircleNavigatorState extends State<AnimatedCircleNavigator> with TickerProviderStateMixin {
  double scale = 1.0;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 400), // todo magic number
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
