import 'package:flutter/material.dart';

class AccountForm extends StatelessWidget {
  final String title;
  final _formKey = GlobalKey<FormState>();

  final platformController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  AccountForm({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    Function(String platform, String username, String password) onAddAccount =
        arguments['onAddAccount'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: Text(
                  'Add/Edit account',
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        controller: platformController,
                        decoration: InputDecoration(hintText: 'Platform name'),
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return 'Platform name is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        controller: usernameController,
                        decoration:
                            InputDecoration(hintText: 'Username or email'),
                        validator: (date) {
                          if (date == null || date.isEmpty) {
                            return 'Username is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(hintText: "Password"),
                        validator: (time) {
                          if (time == null || time.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            onAddAccount(
                                platformController.text,
                                usernameController.text,
                                passwordController.text);

                          }
                          Navigator.pop(context);
                        },
                        child: Text('Save'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
