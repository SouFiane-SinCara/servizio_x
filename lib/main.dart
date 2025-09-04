import 'package:flutter/material.dart';
import 'package:servizio_x/core/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouterApp().onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
