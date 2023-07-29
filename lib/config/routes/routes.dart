import 'package:flutter/material.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/entities/article.dart';
import 'package:flutter_primary_architecture/features/daily_news/presentation/pages/article_detail/article_detail.dart';
import 'package:flutter_primary_architecture/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter_primary_architecture/features/daily_news/presentation/pages/saved_article/saved_article.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return _meterialRoute(const DailyNews());

      case "/ArticleDetails":
        return _meterialRoute(ArticleDetailView(
          article: settings.arguments as ArticleEntity,
        ));
      case "/SavedArticles":
        return _meterialRoute(const SavedArticles());
      default:
        return _meterialRoute(const DailyNews());
    }
  }

  static Route _meterialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
