import 'package:clean_code_architecture/core/resources/data_state.dart';
import 'package:clean_code_architecture/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
