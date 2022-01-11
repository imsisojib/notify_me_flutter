
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:notify_me_app/providers/firebase_provider.dart';
import 'package:notify_me_app/repository/firebase_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //repository
  sl.registerLazySingleton(() => FirebaseRepository(mAuth: sl()));

  //Provider
  sl.registerFactory(() => FirebaseProvider(firebaseRepository: sl()));

  // External
  sl.registerLazySingleton(() => FirebaseAuth.instance);

}