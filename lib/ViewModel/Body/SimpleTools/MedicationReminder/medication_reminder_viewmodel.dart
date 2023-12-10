import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:stacked/stacked.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import '../../../../View/Body/SimpleTools/MedicationReminder/medication_reminder_view.dart';


class ReminderViewModel extends BaseViewModel {
  TextEditingController medicationNameController =
  TextEditingController();
  TextEditingController timeController = TextEditingController();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  ReminderViewModel() {
    // Initialize the timezone data
    tzdata.initializeTimeZones();
  }

  Future<void> scheduleNotification(Reminder reminder) async {
    final DateTime now = DateTime.now();
    final tz.TZDateTime notificationTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      reminder.time.hour,
      reminder.time.minute,
    );

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      importance: Importance.high,
      priority: Priority.max,
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      reminder.id,
      'Medication Reminder',
      'Time to take ${reminder.medicationName}',
      notificationTime,
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
