import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Text(
                'Hi ' +
                    globals.loggedIn.first.name +
                    ' ' +
                    globals.loggedIn.first.surname +
                    '!',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
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
                          Navigator.pushNamed(context, '/assign-executor');
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
                          Navigator.pushNamed(context, '/manage-will');
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
                          Navigator.pushNamed(context, '/send_will');
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
