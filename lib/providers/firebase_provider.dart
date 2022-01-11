import 'package:flutter/cupertino.dart';
import 'package:notify_me_app/repository/firebase_repository.dart';

class FirebaseProvider extends ChangeNotifier{
  final FirebaseRepository firebaseRepository;
  FirebaseProvider({required this.firebaseRepository});



}