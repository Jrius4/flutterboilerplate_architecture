import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_primary_architecture/config/theme/app_themes.dart';
import 'package:flutter_primary_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_primary_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_primary_architecture/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter_primary_architecture/injection_container.dart';
// import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

void main() async {
  await dotenv.load(fileName: ".env"); // load env variables from the .env file
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
