import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in email and password

  // register

  // sign out
}