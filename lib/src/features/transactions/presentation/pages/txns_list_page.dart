import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/features/transactions/presentation/txns_controller.dart';
import 'package:mymny/src/utils/widgets/loaders.dart';

class EntriesListPage extends ConsumerWidget {
  const EntriesListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entries List'),
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
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
    );
  }
}
