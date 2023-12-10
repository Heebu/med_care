import 'package:flutter/material.dart';

class Pancreatics extends StatefulWidget {
  const Pancreatics({Key? key}) : super(key: key);

  @override
  State<Pancreatics> createState() => _PancreaticsState();
}

class _PancreaticsState extends State<Pancreatics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue.shade50),
      body: Center(
        child: Text('Pancreatics'),
      ),
    );
  }
}
