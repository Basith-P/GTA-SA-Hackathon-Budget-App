// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mymny/src/utils/constants/strings.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required String title,
    required String introduction,
    required List<String> body,
    required String conclusion,
    required String imageUrl,
    @JsonKey(name: Strings.id$, includeToJson: false) String? id,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
