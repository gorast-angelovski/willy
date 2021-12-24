import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: Text(
                'Welcome to Willy!',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Text(
              'Your digital assets manager.',
              style: Theme.of(context).textTheme.headline5,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Divider(
                color: Colors.black,
                height: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 5, 0),
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.arrow_forward),
                    title: Text(
                      "If you are new here - you should sign up",
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_forward),
                    title: Text(
                      "If you already have an account - you should sign in",
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_forward),
                    title: Text(
                      "If you are an executor - request data",
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Divider(
                color: Colors.black,
                height: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 60, right: 60),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/sign-in');
                            },
                            child: const Text("Sign in")),
                      ],
                    ),
                    Column(children: const [Text("or")]),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/sign-up');
                          },
                          child: const Text("Sign up"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, right: 5, top: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/request-data');
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text("Request data"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
