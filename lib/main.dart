import 'package:flutter/material.dart';
import 'package:willy/account_form.dart';
import 'package:willy/accounts_page.dart';
import 'package:willy/assign_executor_page.dart';
import 'package:willy/images_page.dart';
import 'package:willy/landing_page.dart';
import 'package:willy/request_data_page.dart';
import 'package:willy/sign_in.dart';
import 'package:willy/sign_up.dart';
import 'package:willy/voice_instructions_page.dart';
import 'package:willy/will_manager_page.dart';
import 'home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Willy',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // home: const MyHomePage(title: 'Willy'),
      routes: {
        '/': (context) => const MyHomePage(title: "Willy"),
        '/request-data': (context) => const RequestDataPage(title: "Willy - Request data"),
        '/voice-instructions': (context) => const VoiceInstructionsPage(title: "Willy - Voice instructions"),
        '/images': (context) => const ImagesPage(title: "Willy - Images"),
        '/assign-executor': (context) => const AssignExecutorPage(title: "Willy - Assign executor"),
        '/manage-will': (context) => const WillManager(title: "Willy - Manage your will"),
        '/manage-accounts': (context) => const AccountsPage(title: "Willy - Manage your accounts"),
        '/add-account': (context) => AccountForm(title: 'Willy - Manage your account'),
        '/sign-up': (context) => const SignUpPage(title: 'Willy - Sign Up'),
        '/sign-in': (context) => const SignInPage(title: 'Willy - Sign In'),
        '/landing': (context) => const LandingPage(title: 'Willy - Welcome'),

      },
      initialRoute: '/',
    );
  }
}
