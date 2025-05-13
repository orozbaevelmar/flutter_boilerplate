import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/config/theme/app_themes.dart';
import 'package:flutter_boilerplate/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter_boilerplate/injection_container.dart';
import 'package:flutter_boilerplate/stuffs/bloc/cubit/counter_cubit.dart';
import 'package:flutter_boilerplate/stuffs/bloc/cubit/theme_cubit.dart';
import 'package:flutter_boilerplate/stuffs/ui_presentation/screens/main_screen.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, Themes>(
        builder: (context, theme1) {
          print('theme ===$theme1');
          return MaterialApp(
            title: 'Flutter Demo',
            theme:
                theme(), //theme1 == Themes.dark ? ThemeData.dark() : ThemeData.light(),
            home: DailyNews(), //MainScreen(),
          );
        },
      ),
    );
  }
}
