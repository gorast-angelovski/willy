import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:willy/model/account.dart';
import 'package:willy/model/user.dart';
import 'package:willy/service/database_service.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/mailer.dart';

class EmailService {
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  sendEmail(String executorEmail, String executorPin) async {
    DatabaseService databaseService = DatabaseService(uid: "test");
    ApplicationUserData user = await databaseService
        .getUserByExecutorEmailAndPin(executorEmail, executorPin);

    Stream<List<Account>> accountStream =
        databaseService.getUserAccounts(user.uid);

    List<Account> accounts = [];
    accountStream.map(
        (accountList) => accountList.map((account) => accounts.add(account)));

    String username = 'napijse@gmail.com';
    String password = 'wrongPassword';
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Willy')
      ..recipients.add(user.executorEmail)
      ..subject = "Digital assets of " + user.name + " " + user.surname
      ..text = accounts.toString();

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
