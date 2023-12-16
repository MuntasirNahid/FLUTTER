import 'dart:html';

import 'package:clean_code_architecture/core/constants/constants.dart';
import 'package:clean_code_architecture/core/resources/data_state.dart';
import 'package:clean_code_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_code_architecture/features/daily_news/data/models/article.dart';
import 'package:clean_code_architecture/features/daily_news/domain/entities/article.dart';
import 'package:clean_code_architecture/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  

  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() {
    final response =
      NewsApiService.getNewsArticles(newsApiKey, countryQuery, categoryQuery);
  
      
  }
  // final NewsApiService _newsApiService;

  // ArticleRepositoryImpl(this._newsApiService);

  // @override
  // Future<DataState<List<ArticleModel>>> getNewsArticles() async {
  //   final httpResponse = await _newsApiService.getNewsArticles(
  //     apiKey: newsApiKey,
  //     country: countryQuery,
  //     category: categoryQuery,
  //   );
  //   if (httpResponse.statusCode == HttpStatus.ok) {
  //     return DataSucess(httpResponse.);
  //   }
  // }
}
