import 'package:flutter/material.dart';

class CircleNavigatorAnimations extends StatefulWidget {
  const CircleNavigatorAnimations({required this.child, super.key});

  final Widget child;

  @override
  State<CircleNavigatorAnimations> createState() => _CircleNavigatorAnimationsState();
}

class _CircleNavigatorAnimationsState extends State<CircleNavigatorAnimations> with TickerProviderStateMixin {
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
