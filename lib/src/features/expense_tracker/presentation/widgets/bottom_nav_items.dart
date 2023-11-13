import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/widgets.dart';

const bottomNavItems = [
  BottomNavigationBarItem(
    icon: Icon(FluentIcons.book_24_regular),
    activeIcon: Icon(FluentIcons.book_24_filled),
    label: 'Txns',
  ),
  BottomNavigationBarItem(
    icon: Icon(FluentIcons.data_pie_24_regular),
    activeIcon: Icon(FluentIcons.data_pie_24_filled),
    label: 'Stats',
  ),
  BottomNavigationBarItem(
    icon: Icon(FluentIcons.compass_northwest_24_regular),
    activeIcon: Icon(FluentIcons.compass_northwest_24_filled),
    label: 'Explore',
  ),
  BottomNavigationBarItem(
    icon: Icon(FluentIcons.more_circle_24_regular),
    activeIcon: Icon(FluentIcons.more_circle_24_filled),
    label: 'More',
  ),
];
