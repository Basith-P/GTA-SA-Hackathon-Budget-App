// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mymny/src/features/expense_tracker/domain/models/entry_category.dart';

part 'entry.freezed.dart';
part 'entry.g.dart';

@freezed
class Entry with _$Entry {
  const factory Entry({
    required EntryCategory category,
    required double amount,
    required DateTime date,
    required String note,
    @JsonKey(name: r'$id', includeToJson: false) String? id,
  }) = _Entry;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
}
