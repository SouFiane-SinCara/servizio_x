import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:servizio_x/core/helpers/app_extensions.dart';
import 'package:servizio_x/core/helpers/size_boxes.dart';
import 'package:servizio_x/core/theme/app_color.dart';

// this widget is a primary button used in the app
Widget primaryButton({
  required String text,
  TextStyle? textStyle,
  Widget? prefixWidget,
  BoxBorder? border,
  required BuildContext context,
  Color? buttonColor,
}) {
  return Container(
    decoration: BoxDecoration(
      color: buttonColor ?? AppColor.darkGreen,
      border: border,
      borderRadius: BorderRadius.all(Radius.circular(15.r(context))),
    ),
    height: 70.h(context),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (prefixWidget != null)
          Row(children: [prefixWidget, widthSize(20, context)]),
        AutoSizeText(
          text,
          style:
              textStyle ??
              TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
        ),
      ],
    ),
  );
}
