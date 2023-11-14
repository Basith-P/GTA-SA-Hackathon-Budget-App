import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/features/auth/presentation/auth_controller.dart';
import 'package:mymny/src/features/transactions/domain/models/transaction.dart';
import 'package:mymny/src/features/transactions/presentation/pages/new_transaction_page.dart';
import 'package:mymny/src/features/transactions/presentation/txns_controller.dart';
import 'package:mymny/src/providers.dart';
import 'package:mymny/src/utils/constants/appwrite_constants.dart';
import 'package:mymny/src/utils/widgets/loaders.dart';

class TxnsListPage extends ConsumerStatefulWidget {
  const TxnsListPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TxnsListPageState();
}

class _TxnsListPageState extends ConsumerState<TxnsListPage> {
  late Realtime _realtime;
  late RealtimeSubscription _subscription;

  List<Transaction> transactions = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    ref
        .read(transactionsControllerProvider.notifier)
        .getTransactions(userId: ref.read(currentUserProvider)!.$id)
        .then((value) {
      setState(() {
        transactions = value;
        isLoading = false;
      });
    });

    _realtime = Realtime(ref.read(appWriteClientProvider));
    _subscription = _realtime.subscribe([
      'databases.${AppwriteConstants.databaseId}.collections.${AppwriteConstants.transactions}.documents'
    ]);
    _subscription.stream.listen((response) {
      final txn = Transaction.fromJson(response.payload);
      if (txn.userId != ref.read(currentUserProvider)!.$id) return;

      const eventBase = 'databases.*.collections.*.documents.*';
      if (response.events.contains('$eventBase.create')) {
        setState(() => transactions.insert(0, txn));
      } else if (response.events.contains('$eventBase.delete')) {
        setState(() => transactions.remove(txn));
      } else if (response.events.contains('$eventBase.update')) {
        setState(() {
          final index = transactions.indexWhere((t) => t.id == txn.id);
          transactions[index] = txn;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        actions: [
          IconButton(
            onPressed: () => ref.read(authControllerProvider.notifier).logout(),
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: isLoading
          ? loaderOnButton
          : transactions.isEmpty
              ? const Center(child: Text('No transactions'))
              : ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return ListTile(
                      title: Text(transaction.note ?? 'No note'),
                      subtitle: Text(transaction.amount.toString()),
                      trailing: Text(transaction.category?.name ?? ''),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(NewTransactionPage.routePath),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _subscription.close();
    super.dispose();
  }
}
