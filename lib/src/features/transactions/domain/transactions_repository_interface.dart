abstract class TransactionsRepositoryInterface {
  Future<void> getTransactions();
  Future<void> getTxnCategories();
  Future<void> addTransaction(Map<String, dynamic> transaction);
  Future<void> deleteTransaction(String id);
}
