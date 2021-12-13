import 'package:flutter/material.dart';
import 'package:willy/assign_executor_page.dart';
import 'package:willy/images_page.dart';
import 'package:willy/request_data_page.dart';
import 'package:willy/voice_instructions_page.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Willy',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      // home: const MyHomePage(title: 'Willy'),
      routes: {
        '/': (context) => const MyHomePage(title: "Willy"),
        '/request-data': (context) => const RequestDataPage(title: "Willy - Request data"),
        '/voice-instructions': (context) => const VoiceInstructionsPage(title: "Willy - Voice instructions"),
        '/images': (context) => const ImagesPage(title: "Willy - Images"),
        '/assign-executor': (context) => const AssignExecutorPage(title: "Willy - Assign executor"),
      },
      initialRoute: '/',
    );
  }
}
