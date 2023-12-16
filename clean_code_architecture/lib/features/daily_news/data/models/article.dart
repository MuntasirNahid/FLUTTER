import 'package:clean_code_architecture/features/daily_news/domain/entities/article.dart';

//it is basically same as Article Entity, then why we are building that extra ArticleEntity? Becaause we want
//to keep our domain layer independent and not dependent on any other layer.
//We dont want to change our entity in future,that's why we are making model.so any changes in db or anywhere will be tackled here.

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] != null ? map['url'] as String : null,
      urlToImage: map['urlToImage'] ?? "",
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }
}
