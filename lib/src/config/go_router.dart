import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/common/pages/initial_page.dart';
import 'package:mymny/src/common/pages/main_layout.dart';
import 'package:mymny/src/features/auth/presentation/pages/sign_up_page.dart';

final goRouterProvider = Provider<GoRouter>((_) => _router);

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const InitialPage(),
    ),
    GoRoute(
      path: LoginOrSignupPage.routePath,
      builder: (_, __) => const LoginOrSignupPage(),
    ),
    GoRoute(
      path: MainLayout.routePath,
      builder: (_, __) => const MainLayout(),
    ),
  ],
);
