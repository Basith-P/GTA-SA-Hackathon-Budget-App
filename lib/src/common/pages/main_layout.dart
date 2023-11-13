import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  static const routePath = '/main-layout';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Main Layout'),
      ),
    );
  }
}
