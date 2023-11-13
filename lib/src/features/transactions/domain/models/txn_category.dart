// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mymny/src/features/transactions/domain/entry_category_type.dart';
import 'package:mymny/src/utils/constants/strings.dart';

part 'txn_category.freezed.dart';
part 'txn_category.g.dart';

@freezed
class TxnCategory with _$TxnCategory {
  const factory TxnCategory({
    required String name,
    required TxnCategoryType type,
    @JsonKey(name: Strings.id$, includeToJson: false) String? id,
    @JsonKey(name: Strings.createdAt$, includeToJson: false)
    DateTime? createdAt,
    @JsonKey(name: Strings.updatedAt$, includeToJson: false)
    DateTime? updatedAt,
  }) = _TxnCategory;

  factory TxnCategory.fromJson(Map<String, dynamic> json) =>
      _$TxnCategoryFromJson(json);
}
