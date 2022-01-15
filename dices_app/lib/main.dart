import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DicePage(),
        backgroundColor: Color(0xff166EBF),
        appBar: AppBar(
            toolbarHeight: 70,
            elevation: 0,
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            title: Text(
              "Check Your Luck !!",
              style: TextStyle(fontFamily: "Roboto"),
            )),
      )));
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceValue = 1;
  int rightDiceValue = 1;
  void update_dice() {
    leftDiceValue = Random().nextInt(6) + 1;
    rightDiceValue = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          update_dice();
                        });
                      },
                      child: Image.asset("assets/$leftDiceValue.png"))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          update_dice();
                        });
                      },
                      child: Image.asset("assets/$rightDiceValue.png"))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "${leftDiceValue + rightDiceValue}",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto"),
            ),
          ),
        ],
      ),
    );
  }
}
