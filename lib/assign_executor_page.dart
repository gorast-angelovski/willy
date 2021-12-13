import 'package:flutter/material.dart';

class AssignExecutorPage extends StatefulWidget {
  const AssignExecutorPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AssignExecutorPage> createState() => _AssignExecutorState();
}

class _AssignExecutorState extends State<AssignExecutorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(child: Column(children: [
        Padding( padding: const EdgeInsets.only(top: 40,bottom: 20),
          child: Text(
            'Assign executor',
            style: Theme.of(context).textTheme.headline6,
          ),),
        const Padding(padding: EdgeInsets.only(top:20),child:Divider(color: Colors.black, height: 2,)),
        Container(padding: const EdgeInsets.only(left: 25,right: 25), margin: const EdgeInsets.only(top: 10,bottom:10),
        child: const Center(child: Text('An executor is someone you are entrusting your digital assets with.' '\n' 'Please enter your executors valid email address'
            ' and we will send him/her an invitation to be your executor. ', style: TextStyle(fontSize: 18),textAlign: TextAlign.center,)))
      ],)
      ) ,


    );

  }

}