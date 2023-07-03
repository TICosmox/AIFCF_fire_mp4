// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static late double blockSizeHorizontal = 0;
  static late double blockSizeVertical = 0;

  static late double _safeAreaHorizontal = 0;
  static late double _safeAreaVertical = 0;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;

  static late bool isPortrait = false;
  static late bool isLandscape = false;
  static late bool isMobile = false;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    isPortrait = _mediaQueryData.orientation == Orientation.portrait;
    isLandscape = _mediaQueryData.orientation == Orientation.landscape;

    screenWidth = _mediaQueryData.size.width;
    isMobile = _mediaQueryData.size.shortestSide < 600;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight! - _safeAreaVertical) / 100;
  }
}
