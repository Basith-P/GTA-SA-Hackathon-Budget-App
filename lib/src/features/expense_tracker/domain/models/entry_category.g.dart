// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntryCategoryImpl _$$EntryCategoryImplFromJson(Map<String, dynamic> json) =>
    _$EntryCategoryImpl(
      name: json['name'] as String,
      type: $enumDecode(_$EntryCategoryTypeEnumMap, json['type']),
      id: json[r'$id'] as String?,
    );

Map<String, dynamic> _$$EntryCategoryImplToJson(_$EntryCategoryImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$EntryCategoryTypeEnumMap[instance.type]!,
    };

const _$EntryCategoryTypeEnumMap = {
  EntryCategoryType.income: 'income',
  EntryCategoryType.expense: 'expense',
  EntryCategoryType.transfer: 'transfer',
};
