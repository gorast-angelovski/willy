import 'package:flutter/material.dart';

class VoiceInstructionCard extends StatelessWidget {
  String instructionName;
  VoiceInstructionCard(this.instructionName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(child: Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColorDark, width: 3)),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, 
          children: [Expanded(child: Center(child: Text(instructionName, style: const TextStyle(fontSize: 22),) ),), const Icon(Icons.delete)],),
        Row(children: [
          Padding(padding: const EdgeInsets.fromLTRB(130, 20, 130, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: const [Icon(Icons.fast_rewind)]),
                Column(children: const [Icon(Icons.stop)]),
                Column(children: const [Icon(Icons.fast_forward)])
              ],),)
        ],)


      ],),
    ),);
  }

}