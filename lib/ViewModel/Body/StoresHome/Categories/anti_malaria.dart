import 'package:flutter/material.dart';

class AntiMalaria extends StatefulWidget {
  const AntiMalaria({Key? key}) : super(key: key);

  @override
  State<AntiMalaria> createState() => _AntiMalariaState();
}

class _AntiMalariaState extends State<AntiMalaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue.shade50),
      body: Center(
        child: Text('Anti Malaria'),
      ),
    );
  }
}
