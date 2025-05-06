import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/stuffs/bloc/cubit/theme_cubit.dart';

class CustomToggleTheme extends StatefulWidget {
  const CustomToggleTheme({super.key});

  @override
  State<CustomToggleTheme> createState() => _CustomToggleThemeState();
}

class _CustomToggleThemeState extends State<CustomToggleTheme> {
  @override
  Widget build(BuildContext context) {
    print('1 = ${context.watch<ThemeCubit>().state}');
    return Switch.adaptive(
      activeColor: Theme.of(context).colorScheme.secondary,
      value: context.watch<ThemeCubit>().state == Themes.dark,
      onChanged: (value) {
        context.read<ThemeCubit>().toggleTheme(value);
      },
    );
  }
}
