import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/features/transactions/domain/models/transaction.dart';
import 'package:mymny/src/features/transactions/domain/models/txn_category.dart';
import 'package:mymny/src/features/transactions/domain/transactions_repository_interface.dart';
import 'package:mymny/src/providers.dart';
import 'package:mymny/src/utils/appwrite_error_messages.dart';
import 'package:mymny/src/utils/constants/appwrite_constants.dart';
import 'package:mymny/src/utils/constants/strings.dart';
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
  FutureEither<List<Transaction>> getTransactions({String? userId}) async {
    try {
      final res = await _databases.listDocuments(
          databaseId: AppwriteConstants.databaseId,
          collectionId: AppwriteConstants.transactions,
          queries: [
            if (userId != null) Query.equal(Strings.userId, userId),
            Query.orderDesc(Strings.date),
          ]);
      return right(
          res.documents.map((e) => Transaction.fromJson(e.data)).toList());
    } on AppwriteException catch (e) {
      debugPrint(e.message);
      return left(Failure(appwriteErrorMessage(e.message)));
    } catch (e) {
      debugPrint(e.toString());
      return left(Failure('Error getting transactions'));
    }
  }

  @override
  FutureVoid addTransaction(Map<String, dynamic> transaction) async {
    try {
      await _databases.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.transactions,
        documentId: ID.unique(),
        data: transaction,
      );
      return right(null);
    } on AppwriteException catch (e) {
      debugPrint(e.message);
      return left(Failure(appwriteErrorMessage(e.message)));
    } catch (e) {
      debugPrint(e.toString());
      return left(Failure('Error adding transaction'));
    }
  }

  @override
  Future<void> deleteTransaction(String id) {
    // TODO: implement deleteTransaction
    throw UnimplementedError();
  }

  @override
  FutureEither<List<TxnCategory>> getTxnCategories() async {
    try {
      final res = await _databases.listDocuments(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.txnCategories,
      );
      return right(
          res.documents.map((e) => TxnCategory.fromJson(e.data)).toList());
    } catch (e) {
      debugPrint(e.toString());
      return left(Failure('Error getting transaction categories'));
    }
  }
}
