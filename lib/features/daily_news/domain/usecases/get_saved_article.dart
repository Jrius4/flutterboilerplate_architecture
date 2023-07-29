import 'package:flutter_primary_architecture/core/resources/data_state.dart';
import 'package:flutter_primary_architecture/core/usercases/usecase.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/entities/article.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/repository/articles_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;
  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticiles();
  }
}
