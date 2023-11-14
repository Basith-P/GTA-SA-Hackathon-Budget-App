import 'package:mymny/src/features/transactions/domain/entry_category_type.dart';
import 'package:mymny/src/features/transactions/domain/models/transaction.dart';

Map<String, List<Transaction>> groupTransactionsByDate(
    List<Transaction> transactions) {
  final groupedTransactions = <String, List<Transaction>>{};
  for (final txn in transactions) {
    final date = txn.date.toIso8601String().split('T').first;
    if (groupedTransactions.containsKey(date)) {
      groupedTransactions[date]!.add(txn);
    } else {
      groupedTransactions[date] = [txn];
    }
  }
  return groupedTransactions;
}

double getGroupTotalAmount(List<Transaction> transactions) {
  var total = 0.0;
  for (final txn in transactions) {
    if (txn.type == TransactionType.income) {
      total += txn.amount;
    } else if (txn.type == TransactionType.expense) {
      total -= txn.amount;
    }
  }
  return total;
}
