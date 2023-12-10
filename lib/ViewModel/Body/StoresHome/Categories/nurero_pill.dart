import 'package:flutter/material.dart';

class NueroPill extends StatefulWidget {
  const NueroPill({Key? key}) : super(key: key);

  @override
  State<NueroPill> createState() => _NueroPillState();
}

class _NueroPillState extends State<NueroPill> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue.shade50),
      body: Center(
        child: Text('Nureo Pills'),
      ),
    );
  }
}
