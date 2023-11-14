import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mymny/src/config/app_colors.dart';
import 'package:mymny/src/features/transactions/domain/models/transaction.dart';
import 'package:mymny/src/features/transactions/presentation/util_functions.dart';
import 'package:mymny/src/utils/constants/ui_constants.dart';

class TxnGroupCard extends StatelessWidget {
  const TxnGroupCard({required this.date, required this.txns, super.key});

  final String date;
  final List<Transaction> txns;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Column(
        children: [
          Padding(
            padding: kPaddingSm,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat.MMMd().format(DateTime.parse(date))),
                Text(getGroupTotalAmount(txns).toString(),
                    style: textTheme.titleSmall?.copyWith(
                      color: getGroupTotalAmount(txns) > 0
                          ? AppColors.positive
                          : AppColors.negative,
                    )),
              ],
            ),
          ),
          const Divider(height: 0),
          ...txns.map((txn) => ListTile(
                title: Text(txn.note ?? 'No note'),
                subtitle: Text(txn.amount.toString()),
                trailing: Text(txn.category?.name ?? ''),
              )),
        ],
      ),
    );
  }
}
