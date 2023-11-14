import 'package:flutter/material.dart';
import 'package:mymny/src/features/explore/domain/models/article.dart';
import 'package:mymny/src/utils/constants/ui_constants.dart';
import 'package:mymny/src/utils/widgets/gaps.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({required this.article, super.key});

  final Article article;

  static const routeName = 'article';
  static const route = '/$routeName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: kPaddingMd,
        children: [
          ClipRRect(
            borderRadius: kBorderRadiusSm,
            child: Image.network(
              article.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          gapH12,
          Text(
            article.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          gapH20,
          Text(
            article.introduction,
          ),
          const Divider(),
          ...article.body.map((e) => Column(
                children: [
                  Text(e, style: Theme.of(context).textTheme.bodyMedium),
                  gapH8,
                ],
              )),
          const Divider(),
          Text(article.conclusion),
        ],
      ),
    );
  }
}
