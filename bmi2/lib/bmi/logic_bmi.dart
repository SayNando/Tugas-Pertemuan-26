class BMICalculator {
  double calculateBMI(double weight, double height) {
    return weight / ((height / 100) * (height / 100));
  }

  String getBMIResult(double bmi) {
    if (bmi < 18.5) {
      return 'Kurus, Narkoba lu ya?';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal, Pertahankan body idaman';
    } else if (bmi >= 24.9 && bmi < 29.9) {
      return 'Gemuk, Gpp asal good Looking';
    } else {
      return 'Obesitas, buset Bola, DIET WOY';
    }
  }
}
