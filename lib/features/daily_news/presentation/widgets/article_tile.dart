import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_primary_architecture/features/common/custom_widgets/custom_text.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/entities/article.dart';

class ArticleTile extends StatelessWidget {
  final ArticleEntity? article;
  const ArticleTile({Key? key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 14, end: 14, top: 16, bottom: 20),
      height: MediaQuery.of(context).size.width / 2.2,
      child: Row(children: [_buildImage(), _buildTitleAndDescription()]),
    );
  }

  Widget _buildImage() {
    return article!.urlToImage == null
        ? SizedBox(
            child: CustomText(textString: "Image Found"),
          )
        : CachedNetworkImage(
            imageUrl: article!.urlToImage ?? '',
            imageBuilder: (context, imageProvider) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.08),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
              ),
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                  ),
                  child: const CupertinoActivityIndicator(),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
                  child: const Icon(Icons.error),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                  ),
                ),
              ),
            ),
          );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              textColor: Colors.black87,
              textString: article!.title ?? '',
              textMaxLines: 3,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 7.0),
              child: CustomText(
                textString: article!.description ?? '',
                textColor: Colors.black54,
                textMaxLines: 3,
              ),
            )),
            Row(
              children: [
                const Icon(
                  Icons.timeline_outlined,
                  size: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                CustomText(textString: "${article!.publishedAt}")
              ],
            )
          ]),
    ));
  }
}
