import 'package:flutter/material.dart';
import 'package:willy/voice_instruction_list.dart';

class VoiceInstructionsPage extends StatefulWidget {
  const VoiceInstructionsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<VoiceInstructionsPage> createState() => _MyVoiceInstructionsPage();
}

class _MyVoiceInstructionsPage extends State<VoiceInstructionsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(child: Column(children: [
        Padding( padding: const EdgeInsets.only(top: 40,bottom: 20),
          child: Text(
            'Voice instructions',
            style: Theme.of(context).textTheme.headline6,
          ),),
        const Padding(padding: EdgeInsets.only(top:20),child:Divider(color: Colors.black, height: 2,)),

        Expanded(child: VoiceInstructionList()),
        Padding(padding: const EdgeInsets.only(bottom:20,left: 60,right: 60),
            child: Center(
                child: Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Column(children:
                  // [ElevatedButton(onPressed:() {return;}, child: const Text("Go back")),],),
                    Column(children: [ElevatedButton(onPressed:() {return;}, child: const Text("Add instruction"))],)],) ))

      ],)
    ) ,


    );

  }

}