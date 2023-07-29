import 'package:floor/floor.dart';
import 'package:flutter_primary_architecture/features/daily_news/domain/entities/article.dart';

@Entity(tableName: 'articles', primaryKeys: ['uuid'])
class ArticleModel extends ArticleEntity {
  final String? sourceMap;
  const ArticleModel({
    this.sourceMap,
    String? uuid,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
            uuid: uuid,
            author: author,
            title: title,
            description: description,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt,
            content: content);

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        sourceMap: json["source"] == null
            ? null
            : Source.fromJson(json['source']).toRawJson(),
        author: json["author"] ?? "",
        title: json["title"] ?? "",
        uuid: json["uuid"] ?? "",
        description: json["description"] ?? "",
        url: json["url"] ?? "",
        urlToImage: json["urlToImage"] ?? "",
        publishedAt: json["publishedAt"] ?? "",
        content: json["content"] ?? "",
      );

  factory ArticleModel.fromEntity(ArticleEntity entity) => ArticleModel(
        uuid: entity.uuid,
        author: entity.author,
        title: entity.title,
        description: entity.description,
        url: entity.url,
        urlToImage: entity.urlToImage,
        publishedAt: entity.publishedAt,
        content: entity.content,
      );
}
