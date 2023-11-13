import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/features/transactions/domain/entry_category_type.dart';
import 'package:mymny/src/features/transactions/domain/models/transaction.dart';
import 'package:mymny/src/features/transactions/domain/models/txn_category.dart';

class EntriesListPage extends ConsumerWidget {
  const EntriesListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = [
      Transaction(
        category: const TxnCategory(
          name: 'Food',
          type: TxnCategoryType.expense,
        ),
        amount: 20,
        date: DateTime.now(),
        note: 'note',
      ),
      Transaction(
        category: const TxnCategory(
          name: 'Food',
          type: TxnCategoryType.expense,
        ),
        amount: 20,
        date: DateTime.now(),
        note: 'note',
      ),
    ];

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
        body: const Text('body'));
  }
}
