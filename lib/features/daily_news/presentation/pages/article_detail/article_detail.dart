// import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_primary_architecture/features/common/custom_widgets/custom_text.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/entities/article.dart';
import 'package:flutter_primary_architecture/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:flutter_primary_architecture/features/daily_news/presentation/bloc/article/local/local_article_events.dart';
import 'package:flutter_primary_architecture/injection_container.dart';

class ArticleDetailView extends HookWidget {
  final ArticleEntity? article;
  const ArticleDetailView({Key? key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
          builder: (context) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _onButtonTapped(context),
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black,
                ),
              )),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(children: [
        _buildArticleTitleAndDate(),
        _buildArticleImage(),
        _buildArticleDescription(),
      ]),
    );
  }

  Widget _buildFloatingActionButton() {
    return Builder(
      builder: (context) => FloatingActionButton(
        onPressed: () => _onFloatingButtionPressed(context),
        child: const Icon(
          Icons.bookmark,
          color: Colors.white,
        ),
      ),
    );
  }

  _onButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  Widget _buildArticleTitleAndDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomText(
          textString: article!.title!,
          textFontSize: 20,
        ),
        const SizedBox(
          height: 14,
        ),
        Row(
          children: [
            const Icon(Icons.timeline_sharp, size: 16),
            const SizedBox(
              width: 4,
            ),
            CustomText(
              textString: article!.publishedAt!,
              textFontSize: 12,
            )
          ],
        )
      ]),
    );
  }

  Widget _buildArticleImage() {
    return Container(
      width: double.maxFinite,
      height: 250,
      margin: const EdgeInsets.only(top: 14),
      child: article!.urlToImage! == ""
          ? Builder(builder: (context) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                  ),
                  child: const Icon(
                    Icons.image_not_supported_outlined,
                    size: 100,
                  ),
                ),
              );
            })
          : Image.network(
              article!.urlToImage!,
              fit: BoxFit.cover,
            ),
    );
  }

  Widget _buildArticleDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      child: CustomText(
        textString:
            "${article!.description! ?? ''}\n\n${article!.content ?? ''}",
        textFontSize: 16,
      ),
    );
  }

  _onFloatingButtionPressed(BuildContext context) {
    BlocProvider.of<LocalArticleBloc>(context).add(SavedArticle(article!));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black,
        content: CustomText(
          textColor: Colors.white,
          textString: "Article Saved successfully",
        )));
  }
}
