import 'package:flutter/material.dart';
import 'package:willy/service/auth_service.dart';

class WillManager extends StatelessWidget {
  final String title;
  final AuthService _authService = AuthService();

  WillManager({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _authService.signOut();
            },
          ),
        ],
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
                            // TODO: enter URL for account's page
                            return;
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
