import 'package:flutter/material.dart';

import '../../../../Universal Reuseable Widgets/Widgets/text.dart';
import 'drug_box.dart';

class Antibiotics extends StatefulWidget {
  const Antibiotics({Key? key}) : super(key: key);

  @override
  State<Antibiotics> createState() => _AntibioticsState();
}

class _AntibioticsState extends State<Antibiotics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Header2Text(
          text: 'Antimalarial',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              size: 40,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) => const DrugCart(
            image: 'assets/images/anti malaria.jpg',
            drugName: 'Armathem',
          ),
          itemCount: 30,
        )),
      ),
    );
  }
}
