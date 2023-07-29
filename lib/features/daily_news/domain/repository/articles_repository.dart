import 'package:flutter_primary_architecture/core/resources/data_state.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  // API methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // Database methods
  Future<List<ArticleEntity>> getSavedArticiles();
  Future<void> saveArticiles(ArticleEntity a);
  Future<void> removeArticiles(ArticleEntity a);
}
