import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:notify_me_app/models/response_model.dart';
import 'package:notify_me_app/repositories/firebase_repository.dart';

class FirebaseProvider extends ChangeNotifier{
  final FirebaseRepository firebaseRepository;

  //common
  bool _isLoading = false;

  //getter
  bool get isLoading => _isLoading;

  //setter
  void updateLoading(bool loading){
    _isLoading = loading;
    notifyListeners();
  }

  FirebaseProvider({required this.firebaseRepository});

  Future<ResponseModel> login(String email, String password) async{
    updateLoading(true);
    try{
      UserCredential? userCredential = await firebaseRepository.signInUserUsingEmailAndPassword(email, password);
      if(userCredential!=null){
        updateLoading(false);
        return ResponseModel(true, "Login Successful.");
      }
    }catch(e){
      updateLoading(false);
      return ResponseModel(false, "$e");
    }
    updateLoading(false);
    return ResponseModel(false, "Something error has occurred. Please try again later");

  }

  Future<ResponseModel> register(String email, String password) async{
    updateLoading(true);
    try{
      UserCredential? userCredential = await firebaseRepository.registerUserByEmailAndPassword(email, password);
      if(userCredential!=null){
        updateLoading(false);
        return ResponseModel(true, "Registration Successful.");
      }
    }catch(e){
      updateLoading(false);
      return ResponseModel(false, "$e");
    }
    updateLoading(false);
    return ResponseModel(false, "Something error has occurred. Please try again later");

  }


}