import 'package:flutter/material.dart';

class ClosingAnimationInheriterdParams extends InheritedWidget {
  const ClosingAnimationInheriterdParams({
    required this.isClosingAnimation,
    required this.onCloseAnimationComplete,
    super.key,
    required super.child,
  });

  final bool isClosingAnimation;
  final void Function() onCloseAnimationComplete;

  static ClosingAnimationInheriterdParams? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ClosingAnimationInheriterdParams>();
  }

  static ClosingAnimationInheriterdParams of(BuildContext context) {
    final ClosingAnimationInheriterdParams? result = maybeOf(context);
    assert(result != null, 'No ClosingAnimationInheriterdParams found in the context');
    return result!;
  }

  @override
  bool updateShouldNotify(ClosingAnimationInheriterdParams oldWidget) {
    return isClosingAnimation != oldWidget.isClosingAnimation ||
        onCloseAnimationComplete != oldWidget.onCloseAnimationComplete;
    // todo test lambda equality
  }
}
