// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'txn_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TxnCategoryImpl _$$TxnCategoryImplFromJson(Map<String, dynamic> json) =>
    _$TxnCategoryImpl(
      name: json['name'] as String,
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      id: json[r'$id'] as String?,
      createdAt: json[r'$createdAt'] == null
          ? null
          : DateTime.parse(json[r'$createdAt'] as String),
      updatedAt: json[r'$updatedAt'] == null
          ? null
          : DateTime.parse(json[r'$updatedAt'] as String),
    );

Map<String, dynamic> _$$TxnCategoryImplToJson(_$TxnCategoryImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$TransactionTypeEnumMap[instance.type]!,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expense: 'expense',
  TransactionType.transfer: 'transfer',
};
