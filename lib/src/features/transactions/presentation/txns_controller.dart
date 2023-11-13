import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/features/transactions/data/transactions_repository.dart';
import 'package:mymny/src/features/transactions/domain/models/transaction.dart';

final transactionsControllerProvider = Provider((ref) => TransactionsController(
      transactionsRepository: ref.read(transactionsRepositroyProvider),
    ));

final getTransactionsProvider = FutureProvider<List<Transaction>>((ref) async {
  final transactions =
      await ref.read(transactionsControllerProvider).getTransactions();
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
}
