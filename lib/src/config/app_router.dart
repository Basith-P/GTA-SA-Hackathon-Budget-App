import 'package:centsible/src/common/views/main_layout.dart';
import 'package:centsible/src/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SignupPage());
      default:
        return MaterialPageRoute(builder: (_) => const MainLayout());
    }
  }
}
