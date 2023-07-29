import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_primary_architecture/core/utils/utils.dart';
import 'package:flutter_primary_architecture/features/common/custom_widgets/custom_text.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/entities/article.dart';
import 'package:flutter_primary_architecture/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:flutter_primary_architecture/features/daily_news/presentation/bloc/article/local/local_article_events.dart';
import 'package:flutter_primary_architecture/features/daily_news/presentation/bloc/article/local/local_article_state.dart';
import 'package:flutter_primary_architecture/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:flutter_primary_architecture/injection_container.dart';

class SavedArticles extends HookWidget {
  const SavedArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>()
        ..add(
          const GetSavedArticles(),
        ),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
      ),
      title: CustomText(textString: "Saved Articles"),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LocalArticleBloc, LocalArticlesState>(
        builder: (context, state) {
      if (state is LocalArticlesLoading) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      } else if (state is LocalArticlesDone) {
        return _buildArticlesList(state.articles!);
      }
      return Container();
    });
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onRemoveArticle(BuildContext context, ArticleEntity article) {
    BlocProvider.of<LocalArticleBloc>(context).add(RemoveArticle(article));
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  Widget _buildArticlesList(List<ArticleEntity> articles) {
    if (articles.isEmpty) {
      return Center(
        child: CustomText(
          textString: "NO SAVED ARTICLES",
          textColor: Colors.black,
        ),
      );
    }
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ArticleTile(
            isRemovable: true,
            onRemove: (article) => _onRemoveArticle(context, article),
            onArticlePressed: (article) => _onArticlePressed(context, article),
            article: articles[index],
          );
        });
  }
}
