import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/common/pages/main_layout.dart';
import 'package:mymny/src/config/go_router.dart';
import 'package:mymny/src/features/transactions/domain/entry_category_type.dart';
import 'package:mymny/src/features/transactions/domain/models/transaction.dart';
import 'package:mymny/src/features/transactions/presentation/txns_controller.dart';
import 'package:mymny/src/providers.dart';
import 'package:mymny/src/utils/constants/ui_constants.dart';
import 'package:mymny/src/utils/extensions.dart';
import 'package:mymny/src/utils/functions.dart';
import 'package:mymny/src/utils/widgets/gaps.dart';
import 'package:mymny/src/utils/widgets/loaders.dart';

class NewTransactionPage extends StatefulHookConsumerWidget {
  const NewTransactionPage({super.key});

  static const routeName = 'new-transaction';
  static const routePath = '${MainLayout.routePath}/new-transaction';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewTransactionPageState();
}

class _NewTransactionPageState extends ConsumerState<NewTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  TransactionType _transactionType = TransactionType.expense;
  String? _txnCategory;

  @override
  Widget build(BuildContext context) {
    final amountController = useTextEditingController();
    final noteController = useTextEditingController();

    final isLoading = ref.watch(transactionsControllerProvider);

    Future<void> submit() async {
      if (_formKey.currentState!.validate()) {
        if (_txnCategory == null &&
            _transactionType != TransactionType.transfer) {
          showSnackBar('Please select a category');
          return;
        }

        final txn = Transaction(
          amount: double.parse(amountController.text),
          note: noteController.text,
          date: DateTime.now(),
          type: _transactionType,
          userId: ref.read(currentUserProvider)!.$id,
        );

        final res = await ref
            .read(transactionsControllerProvider.notifier)
            .addTransaction(txn, _txnCategory);

        if (res) ref.read(goRouterProvider).pop();
      }
    }

    final chooseTxnType = SegmentedButton(
      segments: TransactionType.values
          .map((e) => ButtonSegment(value: e, label: Text(e.name.capitalize)))
          .toList(),
      selected: {_transactionType},
      showSelectedIcon: false,
      onSelectionChanged: (value) => isLoading
          ? null
          : setState(() {
              _txnCategory = null;
              _transactionType = value.first;
            }),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('New Transaction')),
      body: ref.watch(getTxnCategoriesProvider).when(
            data: (categories) => Form(
              key: _formKey,
              child: ListView(
                padding: kPaddingSm,
                children: [
                  chooseTxnType,
                  gapH16,
                  DropdownButtonFormField(
                    items: categories
                        .where((e) => e.type == _transactionType)
                        .map(
                          (e) => DropdownMenuItem(
                            value: e.id,
                            child: Text(e.name),
                          ),
                        )
                        .toList(),
                    decoration: kTextFieldDecorationDark.copyWith(
                      hintText: 'Category',
                    ),
                    disabledHint: const Text('No categories'),
                    borderRadius: kBorderRadiusSm,
                    onChanged: (value) =>
                        isLoading ? null : _txnCategory = value,
                  ),
                  gapH12,
                  TextFormField(
                    enabled: !isLoading,
                    controller: amountController,
                    decoration:
                        kTextFieldDecorationDark.copyWith(hintText: 'Amount'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      return (value != null && value.isNotEmpty)
                          ? double.tryParse(value) == null
                              ? 'Please enter a valid amount'
                              : null
                          : 'Please enter amount';
                    },
                  ),
                  gapH12,
                  TextFormField(
                    enabled: !isLoading,
                    controller: noteController,
                    decoration:
                        kTextFieldDecorationDark.copyWith(hintText: 'Note'),
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
            ),
            error: (e, st) => Text(e.toString()),
            loading: () => loaderOnButton,
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: isLoading ? null : submit,
        child: isLoading ? loaderOnButton : const Icon(Icons.done_rounded),
      ),
    );
  }
}
