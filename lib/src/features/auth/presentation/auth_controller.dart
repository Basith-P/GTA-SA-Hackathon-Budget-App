import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/common/pages/initial_page.dart';
import 'package:mymny/src/common/pages/main_layout.dart';
import 'package:mymny/src/config/go_router.dart';
import 'package:mymny/src/features/auth/data/auth_repository.dart';
import 'package:mymny/src/providers.dart';
import 'package:mymny/src/utils/functions.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authRepository: ref.watch(authRepositoryProvider),
    router: ref.read(goRouterProvider),
    currentUserProviderNotifier: ref.read(currentUserProvider.notifier),
  );
});

class AuthController extends StateNotifier<bool> {
  AuthController({
    required AuthRepository authRepository,
    required GoRouter router,
    required this.currentUserProviderNotifier,
  })  : _authRepository = authRepository,
        _router = router,
        super(false);

  final AuthRepository _authRepository;
  final GoRouter _router;
  final StateController<User?> currentUserProviderNotifier;

  Future<bool> getCurrentAccount() async {
    final res = await _authRepository.getCurrentAccount();
    res.fold(
      (failure) {},
      (user) {
        debugPrint(user.toString());
        currentUserProviderNotifier.state = user;
      },
    );
    return res.isRight();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = true;
    final res = await _authRepository.login(email, password);
    res.fold(
      (failure) => showSnackBar(failure.message),
      (session) async {
        debugPrint(session.toString());
        final user = await getCurrentAccount();
        if (user) {
          _router.go(MainLayout.routePath);
        }
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

  Future<void> logout() async {
    state = true;
    final res = await _authRepository.logout();
    res.fold(
      (l) => showSnackBar(l.message),
      (r) => _router.go(InitialPage.routePath),
    );
    state = false;
  }
}
