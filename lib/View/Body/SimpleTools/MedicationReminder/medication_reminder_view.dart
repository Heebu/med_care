import 'package:flutter/material.dart';
import 'package:med_care/Universal%20Reuseable%20Widgets/Widgets/snack_bar.dart';
import 'package:stacked/stacked.dart';

import 'medication_reminder_viewmodel.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReminderViewModel>.reactive(
      viewModelBuilder: () => ReminderViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Medication Reminder'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Medication Name:',
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                controller: model.medicationNameController,
                decoration: const InputDecoration(
                  hintText: 'Enter medication name',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Time:',
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                controller: model.timeController,
                decoration: InputDecoration(
                  hintText: 'Enter time (HH:MM)',
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  final medicationName = model.medicationNameController.text;
                  final time = model.timeController.text;

                  if (medicationName.isNotEmpty && time.isNotEmpty) {
                    final hourMinute = time.split(':');
                    final hour = int.tryParse(hourMinute[0]);
                    final minute = int.tryParse(hourMinute[1]);

                    if (hour != null && minute != null) {
                      final reminder = Reminder(
                        id: DateTime.now().millisecondsSinceEpoch,
                        medicationName: medicationName,
                        time: TimeOfDay(hour: hour, minute: minute),
                      );

                      model.scheduleNotification(reminder);
                      showSnackBar(context, 'done');
                    } else {
                      showSnackBar(context, 'invalid format');
                    }
                  } else {
                    showSnackBar(context, 'empty text fields');

                    // Handle empty fields
                    // You can show an error message here
                  }
                },
                child: const Text('Schedule Reminder'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Reminder {
  final int id;
  final String medicationName;
  final TimeOfDay time;

  Reminder({
    required this.id,
    required this.medicationName,
    required this.time,
  });
}
