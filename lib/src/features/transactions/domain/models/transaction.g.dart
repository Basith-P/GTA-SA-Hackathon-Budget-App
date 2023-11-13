// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      category: json['category'] == null
          ? null
          : TxnCategory.fromJson(json['category'] as Map<String, dynamic>),
      note: json['note'] as String?,
      categoryId: json['categoryId'] as String?,
      id: json[r'$id'] as String?,
      createdAt: json[r'$createdAt'] == null
          ? null
          : DateTime.parse(json[r'$createdAt'] as String),
      updatedAt: json[r'$updatedAt'] == null
          ? null
          : DateTime.parse(json[r'$updatedAt'] as String),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'note': instance.note,
      'categoryId': instance.categoryId,
    };
