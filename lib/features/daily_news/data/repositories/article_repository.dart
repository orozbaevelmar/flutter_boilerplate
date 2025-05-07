import 'package:flutter_boilerplate/core/resources/data_state.dart';
import 'package:flutter_boilerplate/features/daily_news/data/models/article.dart';
import 'package:flutter_boilerplate/features/daily_news/domain/entities/article.dart';
import 'package:flutter_boilerplate/features/daily_news/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    // TODO: implement getNewsArticles
    throw UnimplementedError();
  }
}
