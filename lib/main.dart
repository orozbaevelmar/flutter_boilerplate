import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/bloc/cubit/counter_cubit.dart';
import 'package:flutter_boilerplate/bloc/cubit/theme_cubit.dart';
import 'package:flutter_boilerplate/ui_presentation/screens/main_screen.dart';

void main() {
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
        builder: (context, theme) {
          print('theme ===$theme');
          return MaterialApp(
            title: 'Flutter Demo',
            theme: theme == Themes.dark ? ThemeData.dark() : ThemeData.light(),
            home: MainScreen(),
          );
        },
      ),
    );
  }
}
