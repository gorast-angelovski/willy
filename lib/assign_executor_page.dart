import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:willy/service/database_service.dart';
import 'package:willy/shared/loading.dart';

import 'model/user.dart';

class AssignExecutorPage extends StatefulWidget {
  const AssignExecutorPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AssignExecutorPage> createState() => _AssignExecutorState();
}

class _AssignExecutorState extends State<AssignExecutorPage> {
  final _formKey = GlobalKey<FormState>();

  late String _currentExecutorPin;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ApplicationUser>(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Text(
                'Assign executor',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Divider(
                  color: Colors.black,
                  height: 2,
                )),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: const Center(
                child: Text(
                  'An executor is someone you are entrusting your digital assets with.'
                  '\n'
                  'Please enter your executors valid email address'
                  ' and we will send him/her an invitation to be your executor. ',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            StreamBuilder<ApplicationUserData>(
                stream: DatabaseService(uid: user.uid).applicationUserData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    ApplicationUserData? loggedInUserData = snapshot.data;
                    return Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'Update your executor pin.',
                            style: TextStyle(fontSize: 18),
                          ),
                          TextFormField(
                            initialValue: loggedInUserData!.executorPin,
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter a pin' : null,
                            onChanged: (val) =>
                                setState(() => _currentExecutorPin=val),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(30),
                              maximumSize: const Size.fromHeight(32),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await DatabaseService(uid: loggedInUserData.uid)
                                    .updateUserData(
                                        loggedInUserData.name,
                                        loggedInUserData.surname,
                                        _currentExecutorPin
                                );
                              }
                            },
                            child: const Text("Update Executor Pin"),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Loading();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
