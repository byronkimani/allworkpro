import 'package:allworkpro/presentation/features/error/page_not_found.dart';
import 'package:allworkpro/presentation/features/home/pages/home_page.dart';
import 'package:allworkpro/presentation/features/onboarding/pages/login_page.dart';
import 'package:allworkpro/presentation/features/onboarding/pages/onboarding_pages.dart';
import 'package:allworkpro/presentation/features/onboarding/pages/welcome_page.dart';
import 'package:allworkpro/presentation/router/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings? routeSettings) {
    switch (routeSettings?.name) {
      case welcomePageRoute:
        return MaterialPageRoute<WelcomePage>(
          builder: (_) => const WelcomePage(),
        );

      case onboardingPagesRoute:
        return MaterialPageRoute<OnboardingPages>(
          builder: (_) => const OnboardingPages(),
        );

      case loginPageRoute:
        return MaterialPageRoute<LoginPage>(
          builder: (_) => const LoginPage(),
        );

      case homePageRoute:
        return MaterialPageRoute<HomePage>(
          builder: (_) => const HomePage(),
        );

      default:
        return MaterialPageRoute<PageNotFound>(
          builder: (_) => const PageNotFound(),
        );
    }
  }
}
