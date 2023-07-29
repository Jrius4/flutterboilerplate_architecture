import 'package:flutter_primary_architecture/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:flutter_primary_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_primary_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/repository/articles_repository.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/usecases/remove_artice.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/usecases/save_article.dart';
import 'package:flutter_primary_architecture/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:flutter_primary_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  // create local database
  final database =
      await $FloorAppDatabse.databaseBuilder("app_database.db").build();
  sl.registerSingleton<AppDatabse>(database);
  // Dio
  sl.registerSingleton<Dio>(Dio());
  // dependencies
  sl.registerSingleton<NewApiService>(NewApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  // Use Cases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  // Bloc
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
  sl.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc(sl(), sl(), sl()));
}
