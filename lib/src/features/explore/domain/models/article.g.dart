// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      title: json['title'] as String,
      introduction: json['introduction'] as String,
      body: (json['body'] as List<dynamic>).map((e) => e as String).toList(),
      conclusion: json['conclusion'] as String,
      imageUrl: json['imageUrl'] as String,
      id: json[r'$id'] as String?,
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'introduction': instance.introduction,
      'body': instance.body,
      'conclusion': instance.conclusion,
      'imageUrl': instance.imageUrl,
    };
