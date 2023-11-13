import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/features/auth/domain/auth_repository_interface.dart';
import 'package:mymny/src/providers.dart';
import 'package:mymny/src/utils/appwrite_error_messages.dart';
import 'package:mymny/src/utils/failure.dart';
import 'package:mymny/src/utils/typedefs.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(account: ref.watch(accountProvider)),
);

class AuthRepository implements AuthRepoistoryInterface {
  AuthRepository({required Account account}) : _account = account;

  final Account _account;

  @override
  FutureEither<User> getCurrentAccount() async {
    try {
      final account = await _account.get();
      return right(account);
    } on AppwriteException catch (e) {
      debugPrint(e.toString());
      return left(Failure(appwriteErrorMessage(e.type)));
    } catch (e) {
      debugPrint(e.toString());
      return left(const Failure('Something went wrong'));
    }
  }

  @override
  FutureEither<Session> login(String email, String password) async {
    try {
      final session = await _account.createEmailSession(
        email: email,
        password: password,
      );
      return right(session);
    } on AppwriteException catch (e) {
      debugPrint(e.toString());
      return left(Failure(appwriteErrorMessage(e.type)));
    } catch (e) {
      debugPrint(e.toString());
      return left(const Failure('Something went wrong'));
    }
  }

  @override
  FutureEither<User> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final account = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );
      return right(account);
    } on AppwriteException catch (e) {
      debugPrint(e.toString());
      return left(Failure(appwriteErrorMessage(e.type)));
    } catch (e) {
      debugPrint(e.toString());
      return left(const Failure('Something went wrong'));
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
