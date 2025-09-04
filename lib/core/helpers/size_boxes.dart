import 'package:flutter/material.dart';
import 'package:servizio_x/core/helpers/app_extensions.dart';
// this function helps to create a sized box with a responsive height quickly
Widget heightSize(int height, BuildContext context) {
  return SizedBox(height: height.h(context));
}
// this function helps to create a sized box with a responsive width quickly
Widget widthSize(int width, BuildContext context) {
  return SizedBox(width: width.w(context));
}
