import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/common/pages/main_layout.dart';
import 'package:mymny/src/features/auth/presentation/auth_controller.dart';
import 'package:mymny/src/features/auth/presentation/pages/sign_up_page.dart';
import 'package:mymny/src/utils/widgets/loaders.dart';

class InitialPage extends ConsumerWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: ref.read(authControllerProvider.notifier).getCurrentAccount(),
        builder: (_, AsyncSnapshot<bool> snapshot) {
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

          if (snapshot.hasData && (snapshot.data ?? false)) {
            return const MainLayout();
          } else {
            return const LoginOrSignupPage();
          }
        });
  }
}
