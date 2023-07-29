import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter_primary_architecture/core/constants/constants.dart';
import 'package:flutter_primary_architecture/core/utils/utils.dart';
import 'package:flutter_primary_architecture/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:flutter_primary_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_primary_architecture/features/daily_news/data/models/article.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/entities/article.dart';
import 'package:flutter_primary_architecture/core/resources/data_state.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/repository/articles_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewApiService _newApiService;
  final AppDatabse _appDatabse;
  ArticleRepositoryImpl(this._newApiService, this._appDatabse);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    // TODO: implement getNewsArticles

    try {
      final httpResponse = await _newApiService.getNewsArticles(
          apiKey: Constants.apiKey,
          country: Constants.countryQuery,
          category: Constants.categoryQuery);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            response: httpResponse.response.data,
            type: DioExceptionType.unknown));
      }
    } on DioException catch (e) {
      logApp([e]);
      Future.error(e);
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticiles() {
    return _appDatabse.articleDao.getArticles();
  }

  @override
  Future<void> removeArticiles(ArticleEntity article) {
    return _appDatabse.articleDao
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticiles(ArticleEntity article) {
    return _appDatabse.articleDao
        .insertArticle(ArticleModel.fromEntity(article));
  }
}
