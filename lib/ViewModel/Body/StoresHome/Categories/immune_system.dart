import 'package:flutter/material.dart';

class ImmuneSystem extends StatefulWidget {
  const ImmuneSystem({Key? key}) : super(key: key);

  @override
  State<ImmuneSystem> createState() => _ImmuneSystemState();
}

class _ImmuneSystemState extends State<ImmuneSystem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue.shade50),
      body: Center(
        child: Text('Immune System'),
      ),
    );
  }
}
