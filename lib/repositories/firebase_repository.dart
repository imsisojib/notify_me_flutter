import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notify_me_app/constants.dart';
import 'package:notify_me_app/models/user_data.dart';

class FirebaseRepository{
  final FirebaseAuth mAuth;
  final CollectionReference collUsers = FirebaseFirestore.instance.collection(Constants.DB_USERS);
  FirebaseRepository({required this.mAuth});
  
  Future<UserCredential?> registerUserByEmailAndPassword(String email, String password) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        throw Exception("The account already exists for that email.");
      }
    } catch (e) {
      throw Exception(e);
    }

    return null;
  }

  Future<UserCredential?> signInUserUsingEmailAndPassword(String email, String password) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        throw Exception("Email or Password might be wrong.");
      }
    } catch (e) {
      throw Exception(e);
    }

    return null;
  }

  Future<void> updateUserInfoIntoDatabase(UserData user) async{
    return collUsers.doc(user.uid).set(user.toJson()).then((value) => null).onError((error, stackTrace) => null);
  }

}