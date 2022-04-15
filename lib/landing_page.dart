import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:willy/model/user.dart';
import 'package:willy/request_data_page.dart';
import 'package:willy/service/database_service.dart';
import 'package:willy/shared/loading.dart';
import 'package:willy/will_manager_page.dart';
import 'assign_executor_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ApplicationUser>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            StreamBuilder<ApplicationUserData>(
                stream: DatabaseService(uid: user.uid).applicationUserData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    ApplicationUserData? loggedInUserData = snapshot.data;

                    return Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 20),
                      child: Text(
                        'Hi ' +
                            loggedInUserData!.name +
                            ' ' +
                            loggedInUserData.surname +
                            '!',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    );
                  } else {
                    return Loading();
                  }
                }),
            Text(
              'Welcome to Willy.',
              style: Theme.of(context).textTheme.headline5,
            ),
            const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Divider(
                  color: Colors.black,
                  height: 2,
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: SizedBox(
                height: 300,
                child: Column(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(30),
                          maximumSize: const Size.fromHeight(32),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AssignExecutorPage(
                                    title: "Willy - Assign executor"),
                              ));
                        },
                        child: const Text("Assign Executor"),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(30), // NEW
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WillManager(
                                    title: "Willy - Manage your will"),
                              ));
                        },
                        child: const Text("Manage Will"),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(30), // NEW
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RequestDataPage(title: "Willy - Request data"),
                              ));
                        },
                        child: const Text("Send Will"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Divider(
                  color: Colors.black,
                  height: 3,
                )),
          ],
        ),
      ),
    );
  }
}
