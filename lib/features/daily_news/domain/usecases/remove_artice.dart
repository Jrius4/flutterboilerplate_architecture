import 'package:flutter_primary_architecture/core/resources/data_state.dart';
import 'package:flutter_primary_architecture/core/usercases/usecase.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/entities/article.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/repository/articles_repository.dart';

class RemoveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;
  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.removeArticiles(params!);
  }
}
