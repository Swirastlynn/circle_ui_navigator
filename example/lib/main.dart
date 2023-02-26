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
    final List<IconData> icons = [
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
        body: CircleNavigator(
          animatedRippleColor: Colors.blue.withOpacity(0.5),
          filledCircleColor: const Color.fromARGB(255, 74, 171, 195),
          icons: icons,
          navigateBack: () {
            /**
            * Add navigation call based on your navigation setup.
            * This one works only on Android.
            */
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              SystemNavigator.pop();
            }
          },
        ),
      ),
    );
  }
}
