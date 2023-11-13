import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/features/transactions/data/transactions_repository.dart';
import 'package:mymny/src/features/transactions/domain/models/transaction.dart';
import 'package:mymny/src/features/transactions/domain/models/txn_category.dart';
import 'package:mymny/src/utils/constants/strings.dart';
import 'package:mymny/src/utils/functions.dart';

final transactionsControllerProvider =
    StateNotifierProvider<TransactionsController, bool>((ref) {
  return TransactionsController(
    transactionsRepository: ref.read(transactionsRepositroyProvider),
  );
});

final getTransactionsProvider = FutureProvider<List<Transaction>>((ref) async {
  final transactions =
      await ref.read(transactionsControllerProvider.notifier).getTransactions();
  return transactions;
});

final getTxnCategoriesProvider = FutureProvider<List<TxnCategory>>((ref) async {
  final transactions = await ref
      .read(transactionsControllerProvider.notifier)
      .getTxnCategories();
  return transactions;
});

class TransactionsController extends StateNotifier<bool> {
  TransactionsController({
    required TransactionsRepository transactionsRepository,
  })  : _transactionsRepository = transactionsRepository,
        super(false);

  final TransactionsRepository _transactionsRepository;

  Future<List<Transaction>> getTransactions() async {
    final res = await _transactionsRepository.getTransactions();
    return res.fold(
      (l) {
        throw Exception(l.message);
      },
      (r) => r,
    );
  }

  Future<List<TxnCategory>> getTxnCategories() async {
    final res = await _transactionsRepository.getTxnCategories();
    return res.fold(
      (l) => throw Exception(l.message),
      (r) => r,
    );
  }

  Future<bool> addTransaction(
      Transaction transaction, String txnCategoryId) async {
    state = true;
    final data = transaction.toJson();
    data[Strings.category] = txnCategoryId;
    final res = await _transactionsRepository.addTransaction(data);
    state = false;
    res.fold(
      (l) => showSnackBar(l.message),
      (r) => debugPrint('Transaction added successfully'),
    );
    return res.isRight();
  }
}
