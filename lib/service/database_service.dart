import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({required this.uid});
  // DatabaseService();


  //collection reference
  final CollectionReference accountCollection = Firestore.instance.collection('accounts');

  Future updateUserData(String platform, String usernameOrEmail, String password) async {
    // return await accountCollection.doc(uid).set({
    return await accountCollection.document(uid).setData({
      'platform': platform,
      'usernameOrEmail': usernameOrEmail,
      'password': password,
    });
  }

}