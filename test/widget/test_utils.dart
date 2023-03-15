import 'package:circle_ui_navigator/circle_ui_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fakes.dart';

extension WidgetTesterUtils on WidgetTester {
  Future<void> loadWidget({
    required Widget widget,
  }) async {
    await pumpWidget(
      MaterialApp(
        home: Scaffold(body: widget),
      ),
    );
  }

  Future<void> loadCircleNavigatorWidget({
    required int actionIcons,
    required Size size,
  }) async {
    await loadWidget(
      widget: DefaultAssetBundle(
        bundle: FakeAssetBundle(),
        child: CircleNavigatorConfig(
          config: fakeConfig(actionIcons, size),
          child: const CircleNavigator(),
        ),
      ),
    );
  }
}
