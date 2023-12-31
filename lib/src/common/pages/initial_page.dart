import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/common/pages/main_layout.dart';
import 'package:mymny/src/features/auth/presentation/auth_controller.dart';
import 'package:mymny/src/features/auth/presentation/pages/sign_up_page.dart';
import 'package:mymny/src/utils/widgets/loaders.dart';

class InitialPage extends ConsumerStatefulWidget {
  const InitialPage({super.key});

  static const routePath = '/initial';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InitialPageState();
}

class _InitialPageState extends ConsumerState<InitialPage> {
  late Future<bool?> _future;

  @override
  void initState() {
    super.initState();
    _future = ref.read(authControllerProvider.notifier).getCurrentAccount();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (_, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Scaffold(
              body: Center(child: loaderOnButton),
            );
          }
          if (snapshot.hasError) {
            // return SplashPage(
            //   error: snapshot.error.toString(),
            //   refreshFn: _refresh,
            // );
            return const Scaffold(
              body: Center(child: Text('Something went wrong')),
            );
          }
          debugPrint('snapshot.data: ${snapshot.data}');

          if (snapshot.hasData && (snapshot.data ?? false)) {
            // ref.read(currentUserProvider.notifier).state = snapshot.data;
            return const MainLayout();
          } else {
            return const LoginOrSignupPage();
          }
        });
  }
}
