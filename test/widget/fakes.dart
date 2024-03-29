import 'dart:convert';
import 'dart:math';

import 'package:circle_ui_navigator/circle_ui_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

bool _isOpeningAnimation = true;
bool _isClosingAnimation = false;

Config fakeConfig(int actionsCount, Point<double> center) => Config(
      center: center,
      animatedRippleColor: const Color(0xFF66A0FE).withOpacity(0.7),
      filledCircleColor: const Color(0xFFB4D8FF).withOpacity(0.7),
      isOpeningAnimation: _isOpeningAnimation,
      onOpenAnimationComplete: () {
        _isOpeningAnimation = false;
      },
      isClosingAnimation: _isClosingAnimation,
      onCloseAnimationComplete: () {
        _isClosingAnimation = false;
      },
      iconSize: 48.0,
      actionIcons: fakeActionIcons(actionsCount),
      closeIcon: fakeCloseIcon,
    );

List<TappableIconData> fakeActionIcons(int actionIconsCount) =>
    List<TappableIconData>.of(
      List.filled(
          actionIconsCount,
          TappableIconData(
            assetPath: 'assets/images/local_florist.svg',
            color: Colors.green,
            tappedColor: Colors.grey,
            onTap: () {},
            outerBorderColor: Colors.white,
            outerBorderSize: 10,
            innerBorderColor: Colors.white,
          )),
    );

var fakeCloseIcon = TappableIconData(
  color: const Color(0xFF3678D0),
  assetPath: 'assets/images/close.svg',
  tappedColor: const Color(0xFF3678D0).withOpacity(0.5),
  onTap: () {
    _isClosingAnimation = true;
  },
  outerBorderColor: Colors.white54,
  outerBorderSize: 12,
  innerBorderColor: Colors.white,
);

class FakeAssetBundle extends Fake implements AssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    return fakeSvgStr;
  }

  @override
  Future<ByteData> load(String key) async {
    return Uint8List.fromList(utf8.encode(fakeSvgStr)).buffer.asByteData();
  }

  String fakeSvgStr = '''
<svg xmlns="http://www.w3.org/2000/svg" height="48" viewBox="0 96 960 960" width="48">
<path d="M480 976q0-70 30-135t80-115q50-50 115-80t135-30q0 70-30 135t-80 115q-50 50-115
 80t-135 30Zm75-75q80-26 133-79t79-133q-80 26-133 79.5T555 901Zm-75
 75q0-70-30-135t-80-115q-50-50-115-80t-135-30q0 70 30 135t80 115q50 50 115 80t135
 30Zm-75-75q-80-26-133-79t-79-133q80 26 133 79.5T405 901Zm209.2-362q22.8 0 39.3-16.425Q670
 506.15 670 483.033q0-17.033-9-29.533T637 433l-47-23q-5 29-16.5 50.5T540 499l42.378
 29.815Q589 534 596.8 536.5q7.8 2.5 17.4 2.5ZM590 402l47-23q15-8 
 23.5-21.241t8.5-28.889q0-22.87-15.889-39.37Q637.222 273 614 273q-9 0-16.667 
 2.5Q589.667 278 582 283l-44 30q23 17 35 38t17 51Zm-159-94q14-6 26.5-9t22.5-3q10 0 
 22.5 3t26.5 9l7-62q2-21-16-35.5T480.5 196q-21.5 0-40 14.773Q422 225.545 424 246l7 
 62Zm49.5 148q20.5 0 35-15t14.5-35.5q0-20.5-14.375-35T480 356q-20 0-35 14.375T430 406q0
 20 15 35t35.5 15Zm0 160q21.5 0 39.5-14.5t16-35.5l-7-62q-14 6-26.5 9t-22.5 3q-10 
 0-22.5-3t-26.5-9l-7 62q-2 20.455 16.5 35.227Q459 616 480.5 616ZM370 402q5-30 
 16.5-51t33.5-38l-42.378-29.815Q371 278 363.2 275.5q-7.8-2.5-17.4-2.5-22.8 0-39.3 
 16.475-16.5 16.474-16.5 39.661Q290 345 299 358t24 21l47 23Zm-24 136q9 0 16.5-2.5T378 
 528l44-29q-23-17-35-38.5T370 410l-47 23q-15 8-23.5 21.241T291 483.13Q292 506 307.341 
 522q15.341 16 38.659 16Zm134 138q-36.324 0-65.662-21.5Q385 633 371 598q-6 
 0-12.5.5t-12.5.5q-47.873 0-81.937-34.063Q230 530.873 230 483q0-20 
 8-39.5t23-37.5q-14-18-22-37.5t-8-39.062Q231 281 264.58 247T346 213q6 0 
 12.5.5t12.5.5q14-35 43.338-56.5T480 136q36.324 0 65.662 21.5Q575 179 589 214q6 
 0 12.5-.5t12.5-.5q47.84 0 81.42 34.063Q729 281.127 729 329q0 20-7.5 39.5T699 
 406q14 18 22 37.5t8 39.062Q729 531 695.42 565T614 599q-6 0-12.5-.5T589 598q-14 
 35-43.338 56.5T480 676Zm0-380Zm58 17Zm2 186Zm-60 17Zm-58-17Zm-2-186Zm-15 588Zm150 0Z"/></svg>
 ''';
}
