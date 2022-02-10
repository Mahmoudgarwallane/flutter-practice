import 'package:flutter/material.dart';
import 'package:m_bmi/widgets/reusable_card.dart';
import 'package:m_bmi/constants.dart';
import 'package:m_bmi/widgets/calculate_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {Key? key,
      required this.bmi,
      required this.interpretation,
      required this.result})
      : super(key: key);
  final String bmi;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    print(bmi);
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(13),
            alignment: Alignment.bottomLeft,
            child: Text(
              "Your Result",
              style: kResultTextStyle,
            ),
          )),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kInactiveColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    result,
                    style: TextStyle(color: Colors.green, fontSize: 22),
                  ),
                  Text(
                    bmi,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: CalculateButton(
                  text: "Re-Calculate",
                  onTap: () {
                    Navigator.pop(context);
                  }))
        ],
      ),
    );
  }
}
