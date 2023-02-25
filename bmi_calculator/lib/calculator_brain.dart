import 'dart:math';

class CalculatorBrain {
  static double height = 0;
  static double weight = 0;
  static double bmi = 0;

  static String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  static String getWeightStatus() {
    calculateBMI();

    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Healthy Weight';
    } else if (bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  static String getInterpretation() {
    calculateBMI();

    if (bmi < 18.5) {
      return 'You have a lower than normal body weight. Consider consulting a doctor.';
    } else if (bmi < 25) {
      return 'You have a normal body weight. Good job!';
    } else if (bmi < 30) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else {
      return 'You have a much higher than normal body weight. Consider consulting a doctor.';
    }
  }
}
