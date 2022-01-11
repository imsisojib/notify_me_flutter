
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:notify_me_app/providers/firebase_provider.dart';
import 'package:notify_me_app/providers/theme_provider.dart';
import 'package:notify_me_app/repositories/firebase_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //repositories
  sl.registerLazySingleton(() => FirebaseRepository(mAuth: sl()));

  //Provider
  sl.registerFactory(() => FirebaseProvider(firebaseRepository: sl()));
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));

  // External
  final mAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => mAuth);
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

}