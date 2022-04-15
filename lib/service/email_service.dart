import 'package:cloud_firestore/cloud_firestore.dart';
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

    // TODO: send a list of accounts
    // List<Account> accounts
    // List<Account> accounts = await accountStream.;
    //     DatabaseService(uid: user.uid).userAccountsData.documents;
    // print(accounts);
    // Future<List<List<Account>>> accounts() async {
    //   print(accountStream.first);
    //   return await accountStream.toList();
    // }

    String username = 'napijse@gmail.com';
    String password = 'wrongPW';
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Willy')
      ..recipients.add(user.executorEmail)
      ..subject = "Digital assets of " + user.name + " " + user.surname
      ..text = accountStream.toString();

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
