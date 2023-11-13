// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntryImpl _$$EntryImplFromJson(Map<String, dynamic> json) => _$EntryImpl(
      category:
          EntryCategory.fromJson(json['category'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      note: json['note'] as String,
      id: json[r'$id'] as String?,
    );

Map<String, dynamic> _$$EntryImplToJson(_$EntryImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'note': instance.note,
    };
