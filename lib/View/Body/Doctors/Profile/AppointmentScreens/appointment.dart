import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  late String date;

  DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2040),
    ).then((value) => setState(() {
          _dateTime = value!;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_dateTime.day.toString()),
          MaterialButton(
            onPressed: _showDatePicker,
            child: const Text('Choose a Date'),
          ),
          Container(
            height: 200,
          ),
          Container()
        ],
      ),
    );
  }
}
