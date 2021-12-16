import 'package:flutter/cupertino.dart';
import 'package:meltask/presentation/app.dart';
import 'package:meltask/presentation/screens/detailed_screen.dart';
import 'package:meltask/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:meltask/presentation/screens/premium_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute<App>(
            builder: (_) => const App(), settings: settings);
      case '/onboarding':
        return CupertinoPageRoute<App>(
            builder: (_) => const OnboardingScreen(), settings: settings);
      case '/premium':
        return CupertinoPageRoute<App>(
            builder: (_) => const PremiumScreen(), settings: settings);
      case '/detailed':
        return CupertinoPageRoute<App>(
            builder: (_) => const DetailedScreen(), settings: settings);
      default:
        return CupertinoPageRoute<App>(
            builder: (_) => const App(), settings: settings);
    }
  }
}
