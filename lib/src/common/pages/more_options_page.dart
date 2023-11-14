import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/common/widgets/user_profile.dart';
import 'package:mymny/src/features/auth/presentation/auth_controller.dart';
import 'package:mymny/src/providers.dart';
import 'package:mymny/src/utils/widgets/gaps.dart';

class MoreOptionsPage extends ConsumerWidget {
  const MoreOptionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: ListView(
        children: [
          gapH32,
          const UserProfile(),
          gapH12,
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text('Logout'),
            onTap: () {
              ref.read(authControllerProvider.notifier).logout();
            },
          ),
          ListTile(
            leading: const Icon(FluentIcons.dark_theme_24_regular),
            title: const Text('Theme'),
            onTap: () {
              showDialog(context: context, builder: (_) => const ThemeDialog());
            },
          ),
        ],
      ),
    );
  }
}

class ThemeDialog extends ConsumerWidget {
  const ThemeDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return SimpleDialog(
      title: const Text('Theme'),
      children: [
        RadioListTile<ThemeMode>(
          title: const Text('System'),
          value: ThemeMode.system,
          groupValue: themeMode,
          onChanged: (value) {
            ref.read(themeModeProvider.notifier).state = value!;
            Navigator.pop(context);
          },
        ),
        RadioListTile<ThemeMode>(
          title: const Text('Light'),
          value: ThemeMode.light,
          groupValue: themeMode,
          onChanged: (value) {
            ref.read(themeModeProvider.notifier).state = value!;
            Navigator.pop(context);
          },
        ),
        RadioListTile<ThemeMode>(
          title: const Text('Dark'),
          value: ThemeMode.dark,
          groupValue: themeMode,
          onChanged: (value) {
            ref.read(themeModeProvider.notifier).state = value!;
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
