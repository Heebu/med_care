import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ScheduleViewModel extends BaseViewModel {
  DateTime dateTime = DateTime.now();
  TimeOfDay timing = TimeOfDay.now();

  void selectADate(context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    ).then(
      (value) {
        dateTime = value!;
        notifyListeners();
      },
    );
  }

  void selectTime(context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then(
      (value) {
        timing = value!;
        notifyListeners();
      },
    );
  }
}
