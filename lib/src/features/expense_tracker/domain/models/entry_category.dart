// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mymny/src/features/expense_tracker/domain/entry_category_type.dart';

part 'entry_category.freezed.dart';
part 'entry_category.g.dart';

@freezed
class EntryCategory with _$EntryCategory {
  const factory EntryCategory({
    required String name,
    required EntryCategoryType type,
    @JsonKey(name: r'$id', includeToJson: false) String? id,
  }) = _EntryCategory;

  factory EntryCategory.fromJson(Map<String, dynamic> json) =>
      _$EntryCategoryFromJson(json);
}
