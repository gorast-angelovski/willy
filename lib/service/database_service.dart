import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:willy/model/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');
  final CollectionReference accountsCollection =
      Firestore.instance.collection('accounts');

  Future updateUserData(String name, String surname, String executorPin) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'surname': surname,
      'executorPin': executorPin,
    });
  }
  Future updateAccountsData(String platform, String username, String password) async {
    return await accountsCollection.document(uid).setData({
      'platform': platform,
      'username': username,
      'password': password,
    });
  }

  //user data from snapshot
  ApplicationUserData _applicationUserDataFromSnapshot(DocumentSnapshot snapshot){
    return ApplicationUserData(
        uid: uid,
        name: snapshot.data['name'],
        surname: snapshot.data['surname'],
        executorPin: snapshot.data['executorPin']
    );
  }

  //get user doc stream
  Stream<ApplicationUserData> get applicationUserData{
    return userCollection.document(uid).snapshots()
        .map(_applicationUserDataFromSnapshot);
  }
}
