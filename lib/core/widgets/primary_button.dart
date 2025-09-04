import 'package:flutter/material.dart';
import 'package:servizio_x/core/helpers/app_extensions.dart';
import 'package:servizio_x/core/theme/app_color.dart';
// this widget is a primary button used in the app
Widget primaryButton({required String text, required BuildContext context}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 40.w(context)),
    decoration: BoxDecoration(
      color: AppColor.darkGreen,
      borderRadius: BorderRadius.all(Radius.circular(15.r(context))),
    ),
    height: 70.h(context),
    alignment: Alignment.center,
    child: FittedBox(
      child: Text(
        text,
        style: TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
