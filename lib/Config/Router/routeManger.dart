import 'package:flutter/material.dart';

import '../../Screens/MainLayOut/homescreen.dart';
import '../../Screens/Splash/Ui/splash.dart';

import '../../Screens/quran/Ui/sura_details_screen.dart';
import 'routes.dart';

class RouteManager {
  static final Map<String, WidgetBuilder> routes = {
    Routes.Splash: (context) => const Splash(),
    Routes.Home: (context) => const HomeScreen(),
    Routes.Sura: (context) => const SuraDetailsScreen(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.Splash:
        return MaterialPageRoute(builder: (context) => const Splash());
      case Routes.Home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.Sura:
        return MaterialPageRoute(
          builder: (context) => const SuraDetailsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }
}
