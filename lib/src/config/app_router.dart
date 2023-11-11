import 'package:centsible/src/common/views/main_layout.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      default:
        return MaterialPageRoute(builder: (_) => const MainLayout());
    }
  }
}
