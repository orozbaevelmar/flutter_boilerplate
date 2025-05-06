import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<Themes> {
  ThemeCubit() : super(Themes.light);

  void toggleTheme(bool isTrue) => emit(isTrue ? Themes.dark : Themes.light);
}

enum Themes {
  dark,
  light,
}
