import 'package:flutter/material.dart';

class Stomach extends StatefulWidget {
  const Stomach({Key? key}) : super(key: key);

  @override
  State<Stomach> createState() => _StomachState();
}

class _StomachState extends State<Stomach> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue.shade50),
      body: Center(
        child: Text('Stomach'),
      ),
    );
  }
}
