import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:willy/model/account.dart';
import 'package:willy/model/user.dart';
import 'package:willy/service/database_service.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/mailer.dart';

class EmailService {
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  sendEmail(String uid, String executorEmail, String executorPin) async {
    DatabaseService databaseService = DatabaseService(uid: uid);
    ApplicationUserData user = await databaseService
        .getUserByExecutorEmailAndPin(executorEmail, executorPin);
    print("uid?" + user.uid);

    Stream<List<Account>> accountStream = databaseService.userAccountsData;

    List<Account> accounts = await accountStream.first;
    // print(accoun);
    String accountString = 'Your inherited accounts:\n';
    for (var i = 0; i < accounts.length; i++) {
      accountString += 'Account' +
          (i + 1).toString() +
          '\nPlatform: ' +
          accounts[i].getPlatform() +
          '\nUsername: ' +
          accounts[i].getUserNameOrEmail() +
          '\nPassword: ' +
          accounts[i].getPassword() +
          '\n';
    }

    String username = 'napijse@gmail.com';
    String password = 'kafana54%';
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Willy')
      ..recipients.add(user.executorEmail)
      ..subject = "Digital assets of " + user.name + " " + user.surname
      ..text = accountString;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      print(e);
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
