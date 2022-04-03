import 'package:flutter/material.dart';
import 'package:willy/service/auth_service.dart';
import 'package:willy/sign_in.dart';
import 'package:willy/voice_instructions_page.dart';

import 'accounts_page.dart';
import 'images_page.dart';

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const SignInPage(title: 'Willy - Sign In'),
                  )
              );
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const AccountsPage(title: "Willy - Manage your accounts"),
                              ),
                            );
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const ImagesPage(title: "Willy - Images"),
                              ),
                            );
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const VoiceInstructionsPage(title: "Willy - Voice instructions"),
                              ),
                            );
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
