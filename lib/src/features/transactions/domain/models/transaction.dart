// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mymny/src/features/transactions/domain/entry_category_type.dart';
import 'package:mymny/src/features/transactions/domain/models/txn_category.dart';
import 'package:mymny/src/utils/constants/strings.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required double amount,
    required DateTime date,
    required TransactionType type,
    required String userId,
    @JsonKey(includeToJson: false) TxnCategory? category,
    String? note,
    @JsonKey(name: Strings.id$, includeToJson: false) String? id,
    @JsonKey(name: Strings.createdAt$, includeToJson: false)
    DateTime? createdAt,
    @JsonKey(name: Strings.updatedAt$, includeToJson: false)
    DateTime? updatedAt,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
