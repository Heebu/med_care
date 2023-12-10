import 'package:flutter/material.dart';

import '../../../../Universal Reuseable Widgets/Widgets/text.dart';
import 'drug_box.dart';

class BloodPressure extends StatefulWidget {
  const BloodPressure({Key? key}) : super(key: key);

  @override
  State<BloodPressure> createState() => _BloodPressureState();
}

class _BloodPressureState extends State<BloodPressure> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                  Header2Text(
                    text: 'Blood Pressure',
                  ),
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
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 700,
                  child: ListView.builder(
                    itemBuilder: (context, index) => DrugCart(
                      image: 'assets/images/blood pressure.jpg',
                      drugName: 'pressurer',
                    ),
                    itemCount: 30,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
