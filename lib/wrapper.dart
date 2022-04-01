import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:willy/landing_page.dart';
import 'package:willy/model/user.dart';

import 'home_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<ApplicationUser>(context);

    if (user == null){
      return const MyHomePage(
        title: 'Willy',
      );
    } else {
      return LandingPage(title: "Willy - Welcome");
    }
  }
}
