// To parse this JSON data, do
//
//     final articleEntity = articleEntityFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String? uuid;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleEntity({
    this.uuid,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  ArticleEntity copyWith({
    String? uuid,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) =>
      ArticleEntity(
        uuid: uuid ?? this.uuid,
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage,
        publishedAt: publishedAt ?? this.publishedAt,
        content: content ?? this.content,
      );

  factory ArticleEntity.fromRawJson(String str) =>
      ArticleEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArticleEntity.fromJson(Map<String, dynamic> json) => ArticleEntity(
        uuid: json["uuid"],
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] ?? "",
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt,
        "content": content,
      };

  @override
  List<Object?> get props {
    return [
      uuid,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content
    ];
  }
}

class Source extends Equatable {
  final String? id;
  final String? name;

  Source({
    this.id,
    this.name,
  });

  Source copyWith({
    String? id,
    String? name,
  }) =>
      Source(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Source.fromRawJson(String str) => Source.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  List<Object?> get props {
    return [id, name];
  }
}
