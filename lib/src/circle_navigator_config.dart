import 'package:flutter/material.dart';

import 'config.dart';

/// Entry point of the library.
/// [config] - [Config] class responsible for customization the widget.
/// [child] - [CircleNavigator]. The core widget.
class CircleNavigatorConfig extends InheritedWidget {
  static CircleNavigatorConfig? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CircleNavigatorConfig>();
  }

  static CircleNavigatorConfig of(BuildContext context) {
    // ignore: avoid-returning-widgets
    final CircleNavigatorConfig? result = maybeOf(context);
    assert(result != null,
        'No ClosingAnimationInheriterdParams found in the context');
    return result!;
  }

  const CircleNavigatorConfig({
    required this.config,
    required super.child,
    super.key,
  });

  final Config config;

  /// Calls [State.didChangeDependencies] in the widgets down the tree.
  @override
  bool updateShouldNotify(CircleNavigatorConfig oldWidget) {
    return config.isOpeningAnimation != oldWidget.config.isOpeningAnimation ||
        config.isClosingAnimation != oldWidget.config.isClosingAnimation ||
        config.onOpenAnimationComplete !=
            oldWidget.config.onOpenAnimationComplete ||
        config.onCloseAnimationComplete !=
            oldWidget.config.onCloseAnimationComplete;
  }
}
