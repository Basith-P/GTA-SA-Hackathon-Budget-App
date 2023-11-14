import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/common/pages/more_options_page.dart';
import 'package:mymny/src/features/explore/presentation/pages/explore_page.dart';
import 'package:mymny/src/features/transactions/presentation/pages/txns_list_page.dart';
import 'package:mymny/src/features/transactions/presentation/widgets/bottom_nav_items.dart';
import 'package:mymny/src/utils/widgets/loaders.dart';

class MainLayout extends ConsumerStatefulWidget {
  const MainLayout({super.key});

  static const routePath = '/main-layout';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainLayoutState();
}

class _MainLayoutState extends ConsumerState<MainLayout> {
  int selectedIndex = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // final authNotifier = ref.read(authControllerProvider.notifier);
    // authNotifier.getCurrentAccount().then((value) => value != null
    //     ? {
    //         ref.read(currentUserProvider.notifier).state = value,
    //         setState(() => isLoading = false),
    //       }
    //     : null);
    // // : authNotifier.logout());
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? loaderOnButton
        : Scaffold(
            body: IndexedStack(
              index: selectedIndex,
              children: const [
                TxnsListPage(),
                // Center(child: Text('Stats')),
                ExplorePage(),
                MoreOptionsPage(),
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
