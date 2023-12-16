import 'dart:io';

import 'package:clean_code_architecture/core/constants/constants.dart';
import 'package:clean_code_architecture/features/daily_news/data/models/article.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

// @RestApi(baseUrl: newsApiBaseUrl)
// abstract class NewsApiService {
//   factory NewsApiService(Dio dio) = _NewsApiService;

//   @GET('/top-headlines')
//   Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
//     @Query("apiKey") String? apiKey,
//     @Query("country") String? country,
//     @Query("category") String? category,
//   });
// }

class NewsApiService {
  static Future<List<ArticleModel>> getNewsArticles(
      String apiKey, String country, String category) async {
    Response response = await Dio().get(
      'https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=$apiKey',
    );
    print(response.data);
    print(response.headers.toString().length);
    print(response.data.toString().length);

    List<ArticleModel> NewsArticles = [];
    return NewsArticles;
  }
}
