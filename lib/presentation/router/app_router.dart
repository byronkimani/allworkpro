import 'package:allworkpro/presentation/features/error/page_not_found.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings? routeSettings) {
    switch (routeSettings?.name) {
      // case welcomePageRoute:
      //   return MaterialPageRoute<WelcomePage>(
      //     builder: (_) => const WelcomePage(),
      //   );

      // case onboardingPagesRoute:
      //   return MaterialPageRoute<OnboardingPages>(
      //     builder: (_) => const OnboardingPages(),
      //   );

      // case loginPageRoute:
      //   return MaterialPageRoute<LoginPage>(
      //     builder: (_) => const LoginPage(),
      //   );

      default:
        return MaterialPageRoute<PageNotFound>(
          builder: (_) => const PageNotFound(),
        );
    }
  }
}
