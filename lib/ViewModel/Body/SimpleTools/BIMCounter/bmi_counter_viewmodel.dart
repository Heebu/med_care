import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../Universal Reuseable Widgets/Widgets/snack_bar.dart';


class BIMCounterViewModel extends BaseViewModel {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  Color mainColor = Colors.blue.shade900;

  double height = 0.0;
  double weight = 0.0;
  double bmi = 0.0;
  String bmiResult = '0';
  String result = 'Please fill in your details';

  void setValues() {
    if (heightController.text.isNotEmpty && weightController.text.isNotEmpty) {
      height = double.parse(heightController.text);
      weight = double.parse(weightController.text);
      bmi = weight / (height * height);
      bmiResult = bmi.toStringAsFixed(2);
      notifyListeners();
    }
  }

  String getFormattedBMI() {
    return bmi.toStringAsFixed(2); // Format to 2 decimal places
  }

  void resultCalc(context) {
    setValues();
    if (height == 0.0 && weight == 0.0 && bmi == 0.0) {
      result = 'Input your details';
      notifyListeners();
    } else if (bmi > 25.0) {
      result = 'you are over weight';
      mainColor = Colors.red.shade900;
      notifyListeners();
    } else if (bmi < 18.5) {
      result = 'you are under weight';
      mainColor = Colors.lightBlue;
      notifyListeners();
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      result = 'you are normal';
      mainColor = Colors.green.shade900;
      notifyListeners();
    } else {
      showSnackBar(context, 'Please fill in the text fields');
    }
  }
}

// ... Other parts of your code remain the same
