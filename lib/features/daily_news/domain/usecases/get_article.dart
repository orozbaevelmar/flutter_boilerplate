import 'package:flutter_boilerplate/core/resources/data_state.dart';
import 'package:flutter_boilerplate/core/usecases/usecase.dart';
import 'package:flutter_boilerplate/features/daily_news/domain/entities/article.dart';
import 'package:flutter_boilerplate/features/daily_news/domain/repositories/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
