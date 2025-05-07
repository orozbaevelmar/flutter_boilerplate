import 'package:flutter_boilerplate/core/resources/data_state.dart';
import 'package:flutter_boilerplate/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
