import 'package:flutter/material.dart';
import 'package:willy/account.dart';

class AccountCard extends StatelessWidget {
  final Account _account;

  AccountCard(this._account);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Card(
        // TODO Robert: Leave or delete the following line
        color: Theme.of(context).primaryColorLight,
        elevation: 5,
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
                    onPressed: () {
                      return;
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
    );
  }
}