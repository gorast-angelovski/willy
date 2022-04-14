import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:willy/model/account.dart';
import 'package:willy/model/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future<ApplicationUserData> getUserByExecutorEmailAndPin(
      String executorEmail, String executorPin) async {
    QuerySnapshot userSnapshot = await Firestore.instance
        .collection('users')
        .where('executorEmail', isEqualTo: executorEmail)
        .where('executorPin', isEqualTo: executorPin)
        .getDocuments();

    if (userSnapshot.documents.isEmpty) {
      throw Exception("Incorrect email or pin");
    } else {
      return userSnapshot.documents
          .map(_applicationUserDataFromSnapshot)
          .toList()
          .first;
    }
  }

  Stream<List<Account>> getUserAccounts(String uid) {
    var userAccountStream =
        userCollection.document(uid).collection('accounts').snapshots();

    return userAccountStream.map((qShot) => qShot.documents
        .map((doc) => Account(
            doc.data['platform'], doc.data['username'], doc.data['password']))
        .toList());
  }

  Future updateUserExecutorData(
      String executorEmail, String executorPin) async {
    return await userCollection
        .document(uid)
        .setData({'executorPin': executorPin, 'executorEmail': executorEmail});
  }

  Future updateUserData(String name, String surname, String executorPin) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'surname': surname,
      'executorPin': executorPin,
      'executorEmail': ''
    });
  }

  Future updateAccountsData(
      String platform, String username, String password) async {
    return await userCollection
        .document(uid)
        .collection('accounts')
        .document(uid + platform)
        .setData({
      'platform': platform,
      'username': username,
      'password': password,
    });
  }

  //get user doc stream
  Stream<ApplicationUserData> get applicationUserData {
    return userCollection
        .document(uid)
        .snapshots()
        .map(_applicationUserDataFromSnapshot);
  }

  //get accounts doc stream
  Stream<List<Account>> get userAccountsData {
    return userCollection
        .document(uid)
        .collection('accounts')
        .snapshots()
        .map(_userAccountsDataFromSnapshot);
  }

  //delete account
  Future<void> deleteUserAccount(String accountId) {
    return userCollection
        .document(uid)
        .collection('accounts')
        .document(uid + accountId)
        .delete();
  }

  //accounts data from snapshot
  List<Account> _userAccountsDataFromSnapshot(QuerySnapshot snapshot) {
    var accounts = <Account>[];
    for (var doc in snapshot.documents) {
      if (doc.data.isNotEmpty) {
        accounts.add(Account(
            doc.data['platform'], doc.data['username'], doc.data['password']));
      }
    }
    return accounts;
  }

  //user data from snapshot
  ApplicationUserData _applicationUserDataFromSnapshot(
      DocumentSnapshot snapshot) {
    return ApplicationUserData(
        uid: uid,
        name: snapshot.data['name'],
        surname: snapshot.data['surname'],
        executorPin: snapshot.data['executorPin'],
        executorEmail: snapshot.data['executorEmail']);
  }
}
