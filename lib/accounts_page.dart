import 'package:flutter/material.dart';
import 'package:willy/account_card.dart';

import 'account.dart';

class AccountsPage extends StatefulWidget {
  final String title;

  const AccountsPage({required this.title});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {

  Account account = Account("Facebook", "mail@mail.com", "facebookPassword432");
  List<Account> accounts = [];

  void onAddAccount(String platform, String username, String password) {
    Account newAccount = Account(platform, username, password);
    setState(() {
      accounts.add(newAccount);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Text(
                'Accounts',
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
            Expanded(
              child: ListView.builder(
                itemCount: accounts.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) => AccountCard(accounts[index]),
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
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/add-account',
                              arguments: {'onAddAccount': onAddAccount},
                            );
                          },
                          child: const Text("Add account"),
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
