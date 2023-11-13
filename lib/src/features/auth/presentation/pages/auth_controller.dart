import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/common/pages/main_layout.dart';
import 'package:mymny/src/config/go_router.dart';
import 'package:mymny/src/features/auth/data/auth_repository.dart';
import 'package:mymny/src/utils/functions.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authRepository: ref.watch(authRepositoryProvider),
    router: ref.read(goRouterProvider),
  );
});

class AuthController extends StateNotifier<bool> {
  AuthController({
    required AuthRepository authRepository,
    required GoRouter router,
  })  : _authRepository = authRepository,
        _router = router,
        super(false);

  final AuthRepository _authRepository;
  final GoRouter _router;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = true;
    final res = await _authRepository.login(email, password);
    res.fold(
      (failure) => showSnackBar(failure.message),
      (user) {
        debugPrint(user.toString());
        _router.go(MainLayout.routePath);
      },
    );
    state = false;
  }

  Future<void> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    state = true;
    final res = await _authRepository.signup(
      email: email,
      password: password,
      name: name,
    );
    res.fold(
      (failure) => showSnackBar(failure.message),
      (user) {
        debugPrint(user.toString());
        login(email: email, password: password);
      },
    );
    state = false;
  }
}
