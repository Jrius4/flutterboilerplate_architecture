// import 'dart:io';

import 'package:flutter_primary_architecture/core/constants/constants.dart';
import 'package:flutter_primary_architecture/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';
// import 'package:retrofit/http.dart';
// import 'package:dio/dio.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newApiBaseURL)
abstract class NewApiService {
  factory NewApiService(DioResponseType dio) = _NewApiService;

  @GET("/top-headlines")
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
