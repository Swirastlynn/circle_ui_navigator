import 'package:circle_ui_navigator/circle_ui_navigator.dart';
import 'package:circle_ui_navigator/src/icons_circle/tappable_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fakes.dart';
import 'test_utils.dart';

void main() {
  testWidgets('WHEN 5 actions THEN 6 icons found', (tester) async {
    await tester.loadWidget(
      widget: DefaultAssetBundle(
        bundle: FakeAssetBundle(),
        child: CircleNavigatorConfig(
          config: configFake(5),
          child: const CircleNavigator(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(TappableIcon), findsNWidgets(6));
  });

  testWidgets('WHEN 10 actions THEN 11 icons found', (tester) async {
    await tester.loadWidget(
      widget: DefaultAssetBundle(
        bundle: FakeAssetBundle(),
        child: CircleNavigatorConfig(
          config: configFake(10),
          child: const CircleNavigator(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(TappableIcon), findsNWidgets(11));
  });
}
