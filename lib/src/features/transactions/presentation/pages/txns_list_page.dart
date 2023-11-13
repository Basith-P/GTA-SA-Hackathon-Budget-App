import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/features/transactions/presentation/pages/new_transaction_page.dart';
import 'package:mymny/src/features/transactions/presentation/txns_controller.dart';
import 'package:mymny/src/utils/widgets/loaders.dart';

class EntriesListPage extends ConsumerWidget {
  const EntriesListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: ref.watch(getTransactionsProvider).when(
            data: (transactions) => ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return ListTile(
                  title: Text(transaction.note ?? 'No note'),
                  subtitle: Text(transaction.amount.toString()),
                  trailing: Text(transaction.category!.name),
                );
              },
            ),
            error: (e, st) => Text(e.toString()),
            loading: () => loaderOnButton,
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(NewTransactionPage.routePath),
        // onPressed: () {
        //   final txn = Transaction(
        //     amount: 100,
        //     note: 'Family test',
        //     date: DateTime.now(),
        //   ).toJson();
        //   txn['category'] = '6552725f6d4847a95ea9';
        //   ref
        //       .read(databasesProvider)
        //       .createDocument(
        //         databaseId: AppwriteConstants.databaseId,
        //         collectionId: AppwriteConstants.transactions,
        //         documentId: ID.unique(),
        //         data: txn,
        //       )
        //       .then((value) => debugPrint(value.data.toString()))
        //       .catchError((e) => debugPrint(e.toString()));
        // },
        child: const Icon(Icons.add),
      ),
    );
  }
}
