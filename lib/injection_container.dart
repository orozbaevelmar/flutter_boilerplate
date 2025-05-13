import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/features/daily_news/data/datasources/remote1/news_api_service.dart';
import 'package:flutter_boilerplate/features/daily_news/data/repositories/article_repository.dart';
import 'package:flutter_boilerplate/features/daily_news/domain/entities/article.dart';
import 'package:flutter_boilerplate/features/daily_news/domain/repositories/article_repository.dart';
import 'package:flutter_boilerplate/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutter_boilerplate/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(sl()),
  );
}
