import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:willy/model/account.dart';
import 'package:willy/service/database_service.dart';

import 'model/user.dart';

class AccountCard extends StatelessWidget {
  final Account _account;

  AccountCard(this._account);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ApplicationUser>(context);

    return Column(
        children: [
          Card(
            // TODO Robert: Leave or delete the following line
            // color: Theme.of(context).primaryColorLight,
            elevation: 3,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  title: Text(
                    _account.getPlatform(),
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          return;
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await DatabaseService(uid: user.uid).deleteUserAccount(_account.getPlatform());
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(
                    Icons.input,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  title: Text(
                    _account.getUserNameOrEmail(),
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(
                    Icons.vpn_key,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  title: Text(
                    _account.getPassword(),
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}
