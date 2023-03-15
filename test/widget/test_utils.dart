import 'dart:math';

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
    required int actionsCount,
    required Point<double> center,
  }) async {
    await loadWidget(
      widget: DefaultAssetBundle(
        bundle: FakeAssetBundle(),
        child: CircleNavigatorConfig(
          config: fakeConfig(actionsCount, center),
          child: const CircleNavigator(),
        ),
      ),
    );
  }
}
