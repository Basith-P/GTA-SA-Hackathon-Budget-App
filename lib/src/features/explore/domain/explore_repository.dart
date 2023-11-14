import 'package:appwrite/appwrite.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/features/explore/data/explore_repository_interface.dart';
import 'package:mymny/src/features/explore/domain/models/article.dart';
import 'package:mymny/src/providers.dart';
import 'package:mymny/src/utils/appwrite_error_messages.dart';
import 'package:mymny/src/utils/constants/appwrite_constants.dart';
import 'package:mymny/src/utils/failure.dart';
import 'package:mymny/src/utils/typedefs.dart';

final exploreRepositroyProvider = Provider(
    (ref) => ExploreRepository(databases: ref.read(databasesProvider)));

class ExploreRepository implements ExploreRepositoryInterface {
  ExploreRepository({required Databases databases}) : _databases = databases;

  final Databases _databases;

  @override
  FutureEither<void> addArticle(Article article) async {
    try {
      await _databases.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.articles,
        documentId: ID.unique(),
        data: article.toJson(),
      );
      return right(null);
    } on AppwriteException catch (e) {
      return left(Failure(appwriteErrorMessage(e.message)));
    } catch (e) {
      return left(Failure('Error adding article'));
    }
  }

  @override
  FutureEither<List<Article>> getArticles() async {
    try {
      final res = await _databases.listDocuments(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.articles,
      );
      return right(res.documents.map((e) => Article.fromJson(e.data)).toList());
    } on AppwriteException catch (e) {
      return left(Failure(appwriteErrorMessage(e.message)));
    } catch (e) {
      return left(Failure('Error getting articles'));
    }
  }
}
