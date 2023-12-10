import 'package:flutter/material.dart';

import '../../../Universal Reuseable Widgets/Widgets/reuseable_click_button.dart';
import '../../../Universal Reuseable Widgets/Widgets/text.dart';



class ButtomSheet extends StatefulWidget {
  const ButtomSheet({Key? key}) : super(key: key);

  @override
  State<ButtomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<ButtomSheet> {
  Color colour = Colors.grey;
  Color colours = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        right: 20,
        left: 20,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Header1Text(text: 'Categories'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      colour == Colors.blue.shade900;
                      colours == Colors.blue.shade900;
                    });
                  },
                  child: SnackBarCategories(
                    text: 'Dentist',
                    icon: '🦷',
                    colour: colour,
                    colours: colours,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      colour == Colors.blue.shade900;
                      colours == Colors.blue.shade900;
                    });
                  },
                  child: SnackBarCategories(
                    text: 'Surgeon',
                    icon: '🩺',
                    colour: colour,
                    colours: colours,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      colour == Colors.blue.shade900;
                      colours == Colors.blue.shade900;
                    });
                  },
                  child: SnackBarCategories(
                    text: 'Allergist',
                    icon: '⚕️',
                    colour: colour,
                    colours: colours,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      colour == Colors.blue.shade900;
                      colours == Colors.blue.shade900;
                    });
                  },
                  child: SnackBarCategories(
                    text: 'Urologist',
                    icon: '💊',
                    colour: colour,
                    colours: colours,
                  ),
                ),
              ],
            ),
          ),

          //Experience
          Header1Text(text: 'Experiences'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SnackBarExperience(
                text: '0-2yrs',
              ),
              SnackBarExperience(
                text: '3-5yrs',
              ),
              SnackBarExperience(
                text: '10+yrs',
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          //Apply Button
          ClickButton(
            text: 'Apply',
            color: Colors.blue.shade100,
            size: 25,
          ),
        ],
      ),
    );
  }
}

class SnackBarCategories extends StatelessWidget {
  const SnackBarCategories({
    Key? key,
    required this.icon,
    required this.text,
    required this.colour,
    required this.colours,
  }) : super(key: key);

  final String icon;
  final String text;
  final Color colour;
  final Color colours;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.only(
          bottom: 10, top: 10),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 10,
            width: 10,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: colour,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                icon,
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: colours,
            ),
          ),
        ],
      ),
    );
  }
}

class SnackBarExperience extends StatelessWidget {
  const SnackBarExperience({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
