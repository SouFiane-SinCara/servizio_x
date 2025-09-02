import 'package:flutter/material.dart';
import 'package:servizio_x/core/router/routes_names.dart';
import 'package:servizio_x/features/authentication/presentation/screens/onboarding_screen.dart';

class RouterApp {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesNames.onboardingScreen:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(backgroundColor: Colors.red),
        );
    }
  }
}
