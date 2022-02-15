import 'package:cryptocurrency_converter_app/route/route_error_page.dart';
import 'package:cryptocurrency_converter_app/ui/convert_page.dart';
import 'package:cryptocurrency_converter_app/ui/main_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/home';
  static const convert = '/convert';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // E.g Navigator.of(context).pushNamed(AppRoutes.home);
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const MyHomePage(title: "",),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.convert:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const ConvertPage(),
          settings: settings,
          fullscreenDialog: true,
        );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const ErrorPage(),
          settings: settings,
          fullscreenDialog: true,
        );
    }
  }
}
