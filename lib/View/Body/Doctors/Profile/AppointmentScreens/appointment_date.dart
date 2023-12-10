import 'package:flutter/material.dart';

import '../../../../../Universal Reuseable Widgets/Widgets/reuseable_click_button.dart';
import '../../../../../Universal Reuseable Widgets/Widgets/text.dart';

class AppointmentDate extends StatefulWidget {
  const AppointmentDate({Key? key}) : super(key: key);

  @override
  State<AppointmentDate> createState() => _AppointmentDateState();
}

class _AppointmentDateState extends State<AppointmentDate> {
  DateTime _dateTime = DateTime.now();
  TimeOfDay _timing = TimeOfDay.now();

  void _SelectADate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    ).then(
      (value) => setState(
        () {
          _dateTime = value!;
        },
      ),
    );
  }

  void _SelectTime() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then(
      (value) => setState(
        () {
          _timing = value!;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
          ),
          title: Header3Text(
            text: 'Schedules',
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                MaterialButton(
                  color: Colors.blue.shade900,
                  elevation: 10,
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                  onPressed: _SelectADate,
                  child: Text(
                    'Pick a Date',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  color: Colors.blue.shade900,
                  elevation: 10,
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                  onPressed: _SelectTime,
                  child: const Text(
                    'Pick a Time',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: _SelectTime,
                child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 30),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.black45,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 70,
                        width: 70,
                        child: const Icon(
                          Icons.access_time,
                          size: 30,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date',
                            style: TextStyle(
                                color: Colors.blue.shade200, fontSize: 20),
                          ),
                          Text(
                            '${_dateTime.day} / ${_dateTime.month}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Time',
                            style: TextStyle(
                                color: Colors.blue.shade200, fontSize: 20),
                          ),
                          Text(
                            _timing.format(context),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  ),
                ),
              ),
              ClickButton(
                text: 'Book Now',
                color: Colors.blue.shade50,
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
