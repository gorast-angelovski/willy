import 'package:flutter/material.dart';
import 'package:willy/service/auth_service.dart';
import 'package:willy/shared/loading.dart';
import 'globals.dart' as globals;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService _authService = AuthService();
  TextEditingController _e = TextEditingController();
  TextEditingController _p = TextEditingController();
  bool _success = false;
  bool _loading = false;

  @override
  void initState() {
    _e = TextEditingController();
    _p = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _e.dispose();
    _p.dispose();
    super.dispose();
  }

  String _email = "";
  String _password = "";
  String _error = "";

  bool _userNotFound = false;

  logInUser(email, password) {
    final foundUser = globals.users
        .where((user) => user.email == email && user.password == password);
    if (foundUser.isNotEmpty) {
      globals.loggedIn.add(foundUser.first);
      _userNotFound = false;
      return true;
    } else {
      _userNotFound = true;
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      title: widget.title,
      home: _loading ? Loading() : Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: "Email"),
                      onChanged: (v) => setState(() {
                        _email = v;
                      }),
                      controller: _e,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(hintText: "Password"),
                      onChanged: (v) => setState(() {
                        _password = v;
                      }),
                      controller: _p,
                    ),
                  ),
                  if (_userNotFound) ...[
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text(
                        "User not found, please check your credentials.",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ]
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(30), // NEW
                        ),
                        onPressed: () async {
                          setState(() {
                            _loading = true;
                          });
                          dynamic result = await _authService
                              .signInWithEmailAndPassword(_email, _password);
                          if (result == null) {
                            setState(() {
                              _error =
                                  'Could not sign in with those credentials';
                              _loading = false;
                            });
                          } else {
                            Navigator.pushNamed(context, '/landing');
                          }
                        },
                        // onPressed: () {
                        //   setState(() {
                        //     _email = _e.text;
                        //     _password = _p.text;
                        //     _success = logInUser(_email, _password);
                        //     _e.text = "";
                        //     _p.text = "";
                        //   });
                        //   if (_success) {
                        //     Navigator.pushNamed(context, '/landing');
                        //   }
                        // },
                        child: const Text("Sign in"),
                      ),
                    ),
                    Text(
                      _error,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Divider(
                        color: Colors.grey,
                        height: 3,
                      ),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                          child: Text("Don't have an account?"),
                          //
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColorLight,
                              onPrimary: Colors.black54,
                              minimumSize: const Size.fromHeight(25),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/sign-up');
                            },
                            child: const Text("Sign up"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
