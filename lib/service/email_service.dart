import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:willy/model/account.dart';

final Email send_email = Email(
  body: 'body of email',
  subject: 'subject of email',
  recipients: ['example1@ex.com'],
  cc: ['example_cc@ex.com'],
  bcc: ['example_bcc@ex.com'],
  attachmentPaths: ['/path/to/email_attachment.zip'],
  isHTML: false,
);

// TODO ova e povrzano nesto so prakjanje mejl
// await
// FlutterEmailSender.send(send_email);

class EmailService {
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future<List<Account>> getUserByExecutorEmailAndPin(
      String executorEmail, String executorPin) async {
    // TODO ova e kverito za da se zeme od bazata
    var snapshot = Firestore.instance
        .collection('users')
        .where('executorEmail', isEqualTo: executorEmail)
        .where('executorPin', isEqualTo: executorPin)
        .get();
    return null;
  }
}
