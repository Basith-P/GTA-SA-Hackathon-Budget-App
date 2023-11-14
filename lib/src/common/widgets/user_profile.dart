import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/providers.dart';
import 'package:mymny/src/utils/constants/ui_constants.dart';
import 'package:mymny/src/utils/widgets/gaps.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final user = ref.watch(currentUserProvider)!;

    return Padding(
      padding: kPaddingLg,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: Text(user.name[0], style: textTheme.displaySmall),
          ),
          gapH16,
          Text(user.name, style: textTheme.titleLarge),
          gapH8,
          Text(user.email, style: textTheme.bodySmall),
        ],
      ),
    );
  }
}
