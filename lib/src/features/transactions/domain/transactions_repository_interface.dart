abstract class TransactionsRepositoryInterface {
  Future<void> getTransactions({String? userId});
  Future<void> getTxnCategories();
  Future<void> addTransaction(Map<String, dynamic> transaction);
  Future<void> deleteTransaction(String id);
}
