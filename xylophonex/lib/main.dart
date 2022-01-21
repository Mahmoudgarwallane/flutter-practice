import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();
  Widget xylotile(int noteNumber, Color color) {
    return Expanded(
      flex: 1,
      child: TextButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
        child: Text(
          "$noteNumber",
          style: TextStyle(
              fontSize: 25, color: Colors.black
              ),
        ),
        onPressed: () {
          player.play("note$noteNumber.wav");
        },
      ),
    );
  }

  List twinkl = [1, 1, 5, 5, 6, 6, 5, 0, 4, 4, 3, 3, 2, 2, 1];
  List ciao = [
    3,
    6,
    7,
    8,
    6,
    0,
    3,
    6,
    7,
    8,
    6,
    0,
    3,
    6,
    7,
    8,
    10,
    7,
    6,
    8,
    10,
    7,
    6,
    3,
    10,
    3,
    10,
    3,
    0,
    2,
    3,
    4,
    4,
    4,
    0,
    3,
    2,
    4,
    3,
    0,
    2,
    1,
    7,
    10,
    3,
    10,
    7,
    10,
    8,
    10,
    6
  ];
  void play_dodo(List pattern) async {
    for (int i in pattern) {
      if (i == 0) {
        sleep(Duration(seconds: 2));
      } else if (i == 10) {
        sleep(Duration(milliseconds: 600));
      } else {
        await player.play("note$i.wav");
        sleep(Duration(milliseconds: 400));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            play_dodo(ciao);
          },
          backgroundColor: Colors.blueAccent,
          child: Text("🎹"),
        ),
        backgroundColor: Color(0xff03045E),
        body: SafeArea(
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  xylotile(1, Color(0xff03045E)),
                  xylotile(2, Color(0xff023E8A)),
                  xylotile(3, Color(0xff0077B6)),
                  xylotile(4, Color(0xff0096C7)),
                  xylotile(5, Color(0xff00B4D8)),
                  xylotile(6, Color(0xff48CAE4)),
                  xylotile(7, Color(0xff90E0EF)),
                  xylotile(8, Color(0xffffffff)),
                ]),
          ),
        ),
      ),
    );
  }
}
