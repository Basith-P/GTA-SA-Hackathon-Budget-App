import 'package:flutter/material.dart';
import 'package:mymny/src/features/expense_tracker/presentation/pages/entries_list_page.dart';
import 'package:mymny/src/features/expense_tracker/presentation/widgets/bottom_nav_items.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  static const routePath = '/main-layout';

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          EntriesListPage(),
          Center(child: Text('Explore')),
          Center(child: Text('More')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (i) => setState(() => selectedIndex = i),
        selectedFontSize: 12,
        items: bottomNavItems,
      ),
    );
  }
}
