import 'package:flutter/material.dart';
import 'package:willy/service/email_service.dart';

class RequestDataPage extends StatelessWidget {
  final String title;
  final _formKey = GlobalKey<FormState>();

  final executorEmailController = TextEditingController();
  final executorPinController = TextEditingController();

  RequestDataPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(title),
    ),
        body: Center(child: Column(children: [
          Padding(padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Text(
              'Request your testators data.',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6,
            ),),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: TextFormField(
                    controller: executorEmailController,
                    decoration: const InputDecoration(hintText: "Enter email"),
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Executor email is required';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: TextFormField(
                    controller: executorPinController,
                    decoration:
                    const InputDecoration(hintText: "Enter pin"),
                    validator: (pin) {
                      if (pin == null || pin.isEmpty) {
                        return 'Pin is required';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        await EmailService()
                            .sendEmail(
                          executorEmailController.text,
                          executorPinController.text,
                        );
                      }
                      Navigator.pop(context);
                    },
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.only(top: 40, left: 60, right: 60),
              child: Center(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ Column(children:
                    [ElevatedButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: const Text("Go back")),
                    ],),
                      Column(children: const [Text("or")]),
                      Column(children: [ElevatedButton(onPressed: () {
                        return;
                      }, child: const Text("Send request"))
                      ],)
                    ],)))
        ],)));
  }

}

