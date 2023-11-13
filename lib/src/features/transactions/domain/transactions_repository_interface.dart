import 'package:mymny/src/features/transactions/domain/models/transaction.dart';

abstract class TransactionsRepositoryInterface {
  Future<void> getTransactions();
  Future<void> addTransaction(Transaction transaction);
  Future<void> deleteTransaction(String id);
}
