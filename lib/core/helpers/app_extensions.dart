import 'package:flutter/material.dart';
  // this extension helps to convert a  number into a percentage of the screen size 
extension MediaQuerySizeOfExtension on int {
  // for height
  double h(BuildContext context) {
    return MediaQuery.sizeOf(context).height * (this / 1000);
  }
  // for the longest side (useful for radius)
  double r(BuildContext context) {
    return MediaQuery.sizeOf(context).longestSide * (this / 1000);
  }
  // for width
  double w(BuildContext context) {
    return MediaQuery.sizeOf(context).width * (this / 1000);
  }
}
