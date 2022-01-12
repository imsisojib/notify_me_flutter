import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:notify_me_app/models/response_model.dart';
import 'package:notify_me_app/models/user_data.dart';
import 'package:notify_me_app/repositories/firebase_repository.dart';
import 'package:notify_me_app/router/routes.dart';

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

  //define route according to authentication
  String getRouteAccordingToAuthentication(){

    if(firebaseRepository.mAuth.currentUser!=null){
     if(!firebaseRepository.mAuth.currentUser!.emailVerified){
       //email not verifies
       firebaseRepository.mAuth.currentUser!.sendEmailVerification(); //sending verification link to mail.
       return Routes.VERIFICATION_AWAITING;

     }else{
       //email verified and login
       return Routes.getHomeScreen();
     }
    }

    return Routes.getHomeScreen();
  }

  bool isEmailVerified(){
    return firebaseRepository.mAuth.currentUser!.emailVerified;
  }

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

        //add user data to db
        var emailSplited = email.split("@");
        await firebaseRepository.updateUserInfoIntoDatabase(UserData(uid: userCredential.user!.uid,email: userCredential.user!.email,userName: emailSplited[0]));

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