// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_boilerplate/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? exceptoin;

  const RemoteArticlesState({this.articles, this.exceptoin});

  @override
  List<Object> get props => [articles!, exceptoin!];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticlesState {
  const RemoteArticlesDone(List<ArticleEntity> article)
      : super(articles: article);
}

class RemoteArticlesException extends RemoteArticlesState {
  const RemoteArticlesException(DioException excepton)
      : super(exceptoin: excepton);
}
