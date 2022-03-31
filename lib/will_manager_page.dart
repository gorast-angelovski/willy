import 'package:flutter/material.dart';

class WillManager extends StatelessWidget {
  final String title;

  const WillManager({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: Text(
                'Manage your will',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Divider(
                color: Colors.black,
                height: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 60, right: 60),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(25),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/manage-accounts');
                          },
                          child: const Text(
                            "MANAGE ACCOUNTS",
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(25),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/images');
                          },
                          child: const Text(
                            "MANAGE IMAGES",
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(25),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/voice-instructions');
                          },
                          child: const Text(
                            "MANAGE VOICE INSTRUCTIONS",
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(35),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Go back"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
