import 'package:centsible/src/config/app_router.dart';
import 'package:centsible/src/config/theme/app_theme.dart';
import 'package:centsible/src/utils/global_keys.dart';
import 'package:flutter/material.dart';

class Centsible extends StatelessWidget {
  const Centsible({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: AppTheme.appTheme(),
      darkTheme: AppTheme.appTheme(isDark: true),
      themeMode: ThemeMode.dark,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
