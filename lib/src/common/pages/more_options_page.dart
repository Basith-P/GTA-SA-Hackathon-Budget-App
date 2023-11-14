import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/common/widgets/user_profile.dart';
import 'package:mymny/src/features/auth/presentation/auth_controller.dart';
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
        ],
      ),
    );
  }
}
