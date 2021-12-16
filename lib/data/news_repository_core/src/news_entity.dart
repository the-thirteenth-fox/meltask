import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meltask/data/newsapi_repository/newsapi.dart';
import 'package:meltask/data/newshive_repository/newshive.dart';

class NewsEntity extends Equatable {
  const NewsEntity({
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;

  @override
  List<Object> get props {
    return [
      sourceName,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
    ];
  }

  NewsEntity copyWith({
    String? sourceName,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
  }) {
    return NewsEntity(
      sourceName: sourceName ?? this.sourceName,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sourceName': sourceName,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt.millisecondsSinceEpoch,
    };
  }

  factory NewsEntity.fromMap(Map<String, dynamic> map) {
    return NewsEntity(
      sourceName: map['sourceName'] ?? '',
      author: map['author'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
      publishedAt: DateTime.fromMillisecondsSinceEpoch(map['publishedAt']),
    );
  }

  factory NewsEntity.fromNewsApiEntity(Article newsEntity) {
    return NewsEntity(
      sourceName: newsEntity.source.name ?? newsEntity.author ?? '',
      author: newsEntity.author ?? newsEntity.source.name ?? '',
      title: newsEntity.title,
      description: newsEntity.description,
      url: newsEntity.url,
      urlToImage: newsEntity.urlToImage,
      publishedAt: newsEntity.publishedAt,
    );
  }
  factory NewsEntity.fromHiveNews(NewsHiveEntity newsEntity) {
    return NewsEntity(
      sourceName: newsEntity.author,
      author: newsEntity.author,
      title: newsEntity.title,
      description: newsEntity.description,
      url: newsEntity.url,
      urlToImage: newsEntity.urlToImage,
      publishedAt: newsEntity.publishedAt,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsEntity.fromJson(String source) =>
      NewsEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NewsEntity(sourceName: $sourceName, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt,)';
  }
}
