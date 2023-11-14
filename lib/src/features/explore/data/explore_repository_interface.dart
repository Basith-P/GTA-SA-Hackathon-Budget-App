import 'package:mymny/src/features/explore/domain/models/article.dart';
import 'package:mymny/src/utils/typedefs.dart';

abstract class ExploreRepositoryInterface {
  FutureEither<List<Article>> getArticles();
  Future<void> addArticle(Article article);
}
