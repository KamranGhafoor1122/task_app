import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static double screenWidth =0;
  static double screenHeight=0;
  static double blockSizeHorizontal=0;
  static double blockSizeVertical=0;
  static double _safeAreaHorizontal=0;
  static double _safeAreaVertical=0;
  static double safeBlockHorizontal=0;
  static double safeBlockVertical=0;
  static double gridItemHeight=0;
  static double gridItemWidth=0;

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth/100;
    blockSizeVertical = screenHeight/100;
    _safeAreaHorizontal = _mediaQueryData.padding.left +
        _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal)/100;
    safeBlockVertical = (screenHeight - _safeAreaVertical)/100;


    /*24 is for notification bar on Android*/
    gridItemHeight = (_mediaQueryData.size.height - kToolbarHeight - 24) / 2;
    gridItemWidth = _mediaQueryData.size.width / 2;

  }


  static SizedBox verticalSpace({required double size}){
    return SizedBox(height: size,);
  }

 static SizedBox horizontalSpace({required double size}){
    return SizedBox(width: size,);
  }
}