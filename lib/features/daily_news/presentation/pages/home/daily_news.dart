import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_boilerplate/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_boilerplate/stuffs/constants/color_constant.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(
        'Daily News',
        style: TextStyle(
          color: MColor.black,
        ),
      ),
    );
  }
  
  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticlesState>(
      builder: (context, state) {
        if( state is RemoteArticlesLoading){
          return const Center(child: CupertinoActivityIndicator(),);
        }
        else if( state is RemoteArticlesException){
          return const Center(child: Icon(Icons.refresh),);
        }
        else if( state is RemoteArticlesDone){
          return  ListView.builder(itemBuilder: itemBuilder)
        }

        return const SizedBox();
      },
    )
  }
}
