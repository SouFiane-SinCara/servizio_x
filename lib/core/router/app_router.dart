import 'package:flutter/material.dart';
import 'package:servizio_x/core/router/routes_names.dart';
import 'package:servizio_x/features/authentication/presentation/screens/onboarding_screen.dart';

import '../../features/authentication/presentation/screens/login_screen.dart';

class RouterApp {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesNames.onboardingScreen:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      case RoutesNames.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(backgroundColor: Colors.red),
        );
    }
  }
}
