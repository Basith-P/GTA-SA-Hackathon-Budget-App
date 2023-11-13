import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/features/auth/presentation/auth_controller.dart';

final getCurrentAccountProvider = FutureProvider<bool>((ref) async {
  final res =
      await ref.read(authControllerProvider.notifier).getCurrentAccount();
  return res;
});
