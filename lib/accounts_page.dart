import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:willy/account_card.dart';
import 'package:willy/service/database_service.dart';
import 'package:willy/shared/loading.dart';

import 'account_form.dart';
import 'model/account.dart';
import 'model/user.dart';

class AccountsPage extends StatefulWidget {
  final String title;

  const AccountsPage({required this.title});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  List<Account> accounts = [];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ApplicationUser>(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 0),
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
              child: StreamBuilder<List<Account>>(
                stream: DatabaseService(uid: user.uid).userAccountsData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Account>? accounts = snapshot.data;
                    return ListView.builder(
                      itemBuilder: (ctx, index) {
                        return AccountCard(
                          Account(
                            accounts![index].getPlatform(),
                            accounts[index].getUserNameOrEmail(),
                            accounts[index].getPassword(),
                          ),
                        );
                      },
                      itemCount: accounts?.length,
                    );
                  } else {
                    return Loading();
                  }
                },
                // itemCount: accounts.length,
                // scrollDirection: Axis.vertical,
                // shrinkWrap: true,
                // itemBuilder: (context, index) => AccountCard(accounts[index]),
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
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AccountForm(
                                    title: 'Willy - Manage your account'),
                              ),
                              // arguments: {'onAddAccount': onAddAccount},
                            );
                            // );
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
