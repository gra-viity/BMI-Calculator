import 'dart:math';

class brain {
  final int height;
  final int weight;
  double _bmi;
  brain({this.height, this.weight});

  String calculateBMI() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Under Weight';
    }
  }

  String getBMIDescrpition() {
    if (_bmi >= 25) {
      return 'You have a higher than a normal body weight. Get up and do some exercise';
    } else if (_bmi >= 18.5) {
      return 'Yeah!! You have a normal body weight. Good Job, Keep it up';
    } else {
      return 'You have a lower than noraml body weight. Thats bad, so eat more.';
    }
  }
}
