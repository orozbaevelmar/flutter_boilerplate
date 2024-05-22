import 'package:flutter_boilerplate/utils/loc_secure_storage.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<String> configureDi() async {
  //getIt.registerSingleton<AuthRepository>(AuthRepository());
  /* getIt.registerSingleton<SharedPreferencesService>(
      SharedPreferencesService()..init()); */
  getIt.registerSingleton<LocaleSecureStorage>(LocaleSecureStorage()..init());
  return 'fsda';
}
