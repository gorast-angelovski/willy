import 'package:firebase_auth/firebase_auth.dart';
import 'package:willy/model/user.dart';

import 'database_service.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // sign in anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _firebaseAuth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register
  Future registerWithEmailAndPassword(String name, String surname, String email,
      String password, String executorPin) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      await DatabaseService(uid: user.uid).updateUserData(name, surname, executorPin, "");
      await DatabaseService(uid: user.uid).updateAccountsData('platform', 'username', 'password');
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // ApplicationUser from FirebaseUser
  ApplicationUser _userFromFirebaseUser(FirebaseUser user) {
    if (user != null) {
      return ApplicationUser(uid: user.uid);
    } else {
      return ApplicationUser(uid: 'no-content');
    }
  }

  // auth change user stream
  Stream<ApplicationUser> get user {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebaseUser);
  }
}
