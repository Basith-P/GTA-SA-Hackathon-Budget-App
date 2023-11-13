import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/l10n/l10n.dart';
import 'package:mymny/src/config/app_theme.dart';
import 'package:mymny/src/config/go_router.dart';
import 'package:mymny/src/utils/global_keys.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // debugShowMaterialGrid: true,
      theme: AppTheme.theme(),
      darkTheme: AppTheme.theme(isDark: true),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      scaffoldMessengerKey: scaffoldMessengerKey,
      routerConfig: ref.read(goRouterProvider),
    );
  }
}
