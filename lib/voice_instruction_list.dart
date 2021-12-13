import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:willy/voice_instruction_card.dart';

class VoiceInstructionList extends StatefulWidget {
  const VoiceInstructionList({Key? key}) : super(key: key);

  @override
  _VoiceInstructionListState createState() => _VoiceInstructionListState();
}

class _VoiceInstructionListState extends State<VoiceInstructionList> {
  List<String> propList = ['Voice Instruction Name','Voice Instruction Name'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: propList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) => VoiceInstructionCard(propList[index]),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => setState(() => propList.add('text')),
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}