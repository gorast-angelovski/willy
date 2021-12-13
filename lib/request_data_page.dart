import 'package:flutter/material.dart';

class RequestDataPage extends StatelessWidget {
  final String title;

  const RequestDataPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
      title: Text(title),
    ),
    body: Center(child: Column(children: [
      Padding( padding: const EdgeInsets.only(top: 50,bottom: 20),
        child: Text(
          'Request your testators data.',
          style: Theme.of(context).textTheme.headline6,
        ),),
      Padding(padding: EdgeInsets.fromLTRB(15,10,15,10), child: TextFormField(decoration: const InputDecoration(hintText: "Enter email"))),
      Padding(padding: EdgeInsets.fromLTRB(15,10,15,10), child: TextFormField(decoration: const InputDecoration(hintText: "Enter pin"))),
      Padding(padding: const EdgeInsets.only(top:40,left: 60,right: 60),
          child: Center(
              child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ Column(children:
                [ElevatedButton(onPressed:() {return;}, child: const Text("Go back")),],),
                  Column(children: const [Text("or")]),
                  Column(children: [ElevatedButton(onPressed:() {return;}, child: const Text("Send request"))],)],) ))
    ],)));
  }

}

