// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

Size size = WidgetsBinding.instance.window.physicalSize /
    WidgetsBinding.instance.window.devicePixelRatio;

///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
double getHorizontalSize(double px) {
  return px * 1;
}

///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
double getVerticalSize(double px) {
  // num statusBar = MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
  //     .viewPadding
  //     .top;
  // num screenHeight = size.height - statusBar;
  return size.height > 844 ? px + 1 : px * 1;
}

///This method is used to set text font size according to Viewport
double getFontSize(double px) {
  if (size.height > 844) {
    return px + 1;
  } else if (size.height < 667) {
    return px - 2;
  } else {
    return px;
  }
}

///This method is used to set smallest px in image height and width
double getSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}
