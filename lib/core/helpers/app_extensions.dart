import 'package:flutter/material.dart';

extension MediaQuerySizeOfExtension on int {
  double h(BuildContext context) {
    return MediaQuery.sizeOf(context).height * (this / 1000);
  }

  double w(BuildContext context) {
    print((this / 1000));
    return MediaQuery.sizeOf(context).width * (this / 1000);
  }
}
