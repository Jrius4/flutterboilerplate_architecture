import 'package:floor/floor.dart';
import 'package:flutter_primary_architecture/features/daily_news/data/models/article.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel articleModel);

  @Query("SELECT * FROM articles")
  Future<List<ArticleModel>> getArticles();
  @delete
  Future<void> deleteArticle(ArticleModel articleModel);
}
