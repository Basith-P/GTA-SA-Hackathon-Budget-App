import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/features/explore/presentation/explore_controller.dart';
import 'package:mymny/src/features/explore/presentation/pages/article_page.dart';
import 'package:mymny/src/utils/constants/ui_constants.dart';
import 'package:mymny/src/utils/widgets/gaps.dart';
import 'package:mymny/src/utils/widgets/loaders.dart';

class ExplorePage extends ConsumerWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      body: ref.watch(getArticlesProvider).when(
          data: (articles) => articles.isEmpty
              ? const Center(child: Text('No articles'))
              : ListView.separated(
                  padding: kPaddingSm,
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return GestureDetector(
                      onTap: () =>
                          context.go(ArticlePage.route, extra: article),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: kBorderRadiusSm,
                          border: Border.all(
                              color: colorScheme.onSurface.withOpacity(0.2)),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          children: [
                            Image.network(article.imageUrl),
                            Padding(
                              padding: kPaddingSm,
                              child: Column(
                                children: [
                                  Text(article.title,
                                      style: textTheme.titleLarge),
                                  gapH8,
                                  Text(
                                      '${article.introduction.substring(0, 100)}...'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => gapH12,
                ),
          error: (e, st) => const Center(child: Text('Error getting articles')),
          loading: () => loaderOnButton),
    );
  }
}
