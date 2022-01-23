import 'package:flutter/cupertino.dart';

class Question {
  late bool answer;
  late String question;
  Question( String q,  bool a) {
    answer = a;
    question = q;
  }
}
