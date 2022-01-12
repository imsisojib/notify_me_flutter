import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepository{
  final FirebaseAuth mAuth;

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


}