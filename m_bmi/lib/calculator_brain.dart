import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  CalculatorBrain({required this.height, required this.weight});

  double _bmi = 0;

  calculateBMI() {
    print(height);
    print(weight);
    print(_bmi);
    _bmi = weight / pow(height/100, 2);
    print("fdsffsdfd");
    print(_bmi);
    return _bmi.toStringAsFixed(1);
  }

  getResults() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi >= 18.5) {
      return "Normal";
    } else {
      return "overweight";
    }
  }

  getInterpretation() {
    if (_bmi >= 25) {
      return 'You are higher than normal body weight . Try to exercise more';
    } else if (_bmi >= 18.5) {
      return "You have normal body weight . Good job !";
    } else {
      return "You have a lower than normal body weight . You can eat a bit more .";
    }
  }
}
