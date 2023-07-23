import 'package:flutter_primary_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_primary_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/repository/articles_repository.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutter_primary_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());
  // dependencies
  sl.registerSingleton<NewApiService>(NewApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  // Use Cases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  // Bloc
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
}
