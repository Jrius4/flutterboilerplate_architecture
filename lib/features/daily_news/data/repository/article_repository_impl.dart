import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter_primary_architecture/core/constants/constants.dart';
import 'package:flutter_primary_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_primary_architecture/features/daily_news/data/models/article.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/entities/article.dart';
import 'package:flutter_primary_architecture/core/resources/data_state.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/repository/articles_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewApiService _newApiService;
  ArticleRepositoryImpl(this._newApiService);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    // TODO: implement getNewsArticles

    try {
      final httpResponse = await _newApiService.getNewsArticles(
          apiKey: apiKey, country: countryQuery, category: categoryQuery);

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
      return DataFailed(e);
    }
  }
}