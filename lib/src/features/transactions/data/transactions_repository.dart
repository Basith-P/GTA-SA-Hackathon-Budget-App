import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/features/transactions/domain/models/transaction.dart';
import 'package:mymny/src/features/transactions/domain/transactions_repository_interface.dart';
import 'package:mymny/src/providers.dart';
import 'package:mymny/src/utils/appwrite_error_messages.dart';
import 'package:mymny/src/utils/constants/appwrite_constants.dart';
import 'package:mymny/src/utils/failure.dart';
import 'package:mymny/src/utils/typedefs.dart';

final transactionsRepositroyProvider = Provider((ref) => TransactionsRepository(
      databases: ref.read(databasesProvider),
    ));

class TransactionsRepository implements TransactionsRepositoryInterface {
  TransactionsRepository({required Databases databases})
      : _databases = databases;

  final Databases _databases;

  @override
  FutureEither<List<Transaction>> getTransactions() async {
    try {
      final res = await _databases.listDocuments(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.transactions,
      );
      debugPrint(res.documents[0].data.toString());
      return right(
          res.documents.map((e) => Transaction.fromJson(e.data)).toList());
    } on AppwriteException catch (e) {
      debugPrint(e.message);
      return left(Failure(appwriteErrorMessage(e.message)));
    } catch (e) {
      debugPrint(e.toString());
      return left(const Failure('Error getting transactions'));
    }
  }

  @override
  Future<void> addTransaction(Transaction transaction) {
    // TODO: implement addTransaction
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTransaction(String id) {
    // TODO: implement deleteTransaction
    throw UnimplementedError();
  }
}
