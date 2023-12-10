import 'package:flutter/material.dart';

class OrderADrug extends StatefulWidget {
  const OrderADrug({Key? key}) : super(key: key);

  @override
  State<OrderADrug> createState() => _OrderADrugState();
}

class _OrderADrugState extends State<OrderADrug> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('Order a Drug'),
    );
  }
}
