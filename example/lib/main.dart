import 'package:circle_ui_navigator/animated_ripple_background.dart';
import 'package:circle_ui_navigator/circle_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      title: 'Circle UI Navigator example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Circle UI Navigator example'),
        ),
        body: Stack(
          children: [
            AnimatedRippleBackground(rippleColor: Colors.blue.withOpacity(0.5)),
            CircleNavigator(
              icons: icons,
              closeIcon: Icons.close,
              onClose: () {
                // add navigation call based on your navigation setup
                if (Navigator.canPop(context)) {
                  // TODO check & fix on iOS
                  Navigator.pop(context);
                } else {
                  SystemNavigator.pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
