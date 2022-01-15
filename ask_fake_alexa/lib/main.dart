import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        backgroundColor: Color.fromARGB(189, 18, 218, 201),
        body: alexaPage(),
        appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.black,
            centerTitle: true,
            elevation: 0,
            title: Text(
              "اسأل أليكسا",
              style:
                  TextStyle(fontFamily: "Tajawal", fontWeight: FontWeight.bold),
            ))),
  ));
}

class alexaPage extends StatefulWidget {
  const alexaPage({Key? key}) : super(key: key);

  @override
  _alexaPageState createState() => _alexaPageState();
}

class _alexaPageState extends State<alexaPage> {
  int answerNumber = 0;
  void updateNumberImage() {
    setState(() {
      answerNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          updateNumberImage();
        },
        child: Image.asset(
          "assets/answer$answerNumber.png",
          width: MediaQuery.of(context).size.width / 1.5,
        ),
      ),
    );
  }
}
