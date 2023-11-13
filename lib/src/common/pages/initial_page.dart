import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mymny/src/features/auth/presentation/pages/sign_up_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      context.go(LoginOrSignupPage.routePath);
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Home')),
    );
  }
}
