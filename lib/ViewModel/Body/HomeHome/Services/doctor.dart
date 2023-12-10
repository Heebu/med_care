import 'package:flutter/material.dart';

class SeeADoctor extends StatefulWidget {
  const SeeADoctor({Key? key}) : super(key: key);

  @override
  State<SeeADoctor> createState() => _SeeADoctorState();
}

class _SeeADoctorState extends State<SeeADoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('See a Doctor'),
    );
  }
}
