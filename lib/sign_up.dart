import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _n = TextEditingController();
  TextEditingController _s = TextEditingController();
  TextEditingController _e = TextEditingController();
  TextEditingController _p = TextEditingController();
  TextEditingController _ep = TextEditingController();

  @override
  void initState() {
    _n = TextEditingController();
    _s = TextEditingController();
    _e = TextEditingController();
    _p = TextEditingController();
    _ep = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _n.dispose();
    _s.dispose();
    _e.dispose();
    _p.dispose();
    _ep.dispose();
    super.dispose();
  }

  String _name = "";
  String _surname = "";
  String _email = "";
  String _password = "";
  String _executorPin = "";

  addUser(name, surname, email, password, executorPin) {
    setState(() {
      globals.users.add(globals.User(name, surname, email, password, executorPin));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      title: widget.title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: "Name"),
                      onChanged: (v) => setState(() {
                        _name = v;
                      }),
                      controller: _n,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: "Surname"),
                      onChanged: (v) => setState(() {
                        _surname = v;
                      }),
                      controller: _s,
                    ),
                  ),
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                          hintText:
                              "Set Executor Pin (you can change this later)"),
                      onChanged: (v) => setState(() {
                        _executorPin = v;
                      }),
                      controller: _ep,
                    ),
                  ),
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
                        onPressed: () {
                          setState(() {
                            _name = _n.text;
                            _surname = _s.text;
                            _email = _e.text;
                            _password = _p.text;
                            _executorPin = _ep.text;
                            addUser(_name, _surname, _email, _password,
                                _executorPin);
                            _n.text = "";
                            _s.text = "";
                            _e.text = "";
                            _p.text = "";
                            _ep.text = "";
                          });

                          Navigator.pushNamed(context, '/landing');
                        },
                        child: const Text("Sign up"),
                      ),
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
                          child: Text("Already have an account?"),
                          //
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColorLight,
                              onPrimary: Colors.black54,
                              minimumSize: const Size.fromHeight(25), // NEW
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/sign-in');
                            },
                            child: const Text("Sign in"),
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


