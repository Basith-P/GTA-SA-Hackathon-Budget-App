import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mymny/src/features/explore/domain/explore_repository.dart';
import 'package:mymny/src/features/explore/domain/models/article.dart';

final exploreControllerProvider =
    StateNotifierProvider<ExploreController, bool>((ref) {
  final exploreRepository = ref.watch(exploreRepositroyProvider);
  return ExploreController(exploreRepository: exploreRepository);
});

final getArticlesProvider = FutureProvider<List<Article>>((ref) async {
  final exploreController = ref.watch(exploreControllerProvider.notifier);
  return exploreController.getArticles();
});

class ExploreController extends StateNotifier<bool> {
  ExploreController({required ExploreRepository exploreRepository})
      : _exploreRepository = exploreRepository,
        super(false);

  final ExploreRepository _exploreRepository;

  Future<List<Article>> getArticles() async {
    final res = await _exploreRepository.getArticles();
    return res.fold(
      (l) => [],
      (r) => r,
    );
  }

  Future<void> addArticle(Article article) async {
    final res = await _exploreRepository.addArticle(article);
    res.fold(
      (l) => null,
      (r) => null,
    );
  }
}
