import 'package:flutter/material.dart';
import '../../../../Universal Reuseable Widgets/Widgets/text.dart';
import 'drug_box.dart';

class PainKiller extends StatefulWidget {
  const PainKiller({Key? key}) : super(key: key);

  @override
  State<PainKiller> createState() => _PainKillerState();
}

class _PainKillerState extends State<PainKiller> {
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
                    text: 'Pain Killer',
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
                    itemBuilder: (context, index) => const DrugCart(
                      image: 'assets/images/pain killers.jpg',
                      drugName: 'Paracetamol',
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
