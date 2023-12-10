import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Universal Reuseable Widgets/Widgets/text.dart';
import '../StoresHome/Categories/blood_pressure.dart';
import '../StoresHome/Categories/pancreatics.dart';
import '../StoresHome/Categories/stomach.dart';
import '../StoresHome/selected_category.dart';
import 'BIMCounter/bmi_counter_view.dart';
import 'CalorieCounter/calorie_counter_view.dart';
import 'MedicationReminder/medication_reminder_view.dart';
import 'WalkerCounter/walk_counter_view.dart';

class SimpleToolsView extends StatelessWidget {
  const SimpleToolsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Header1Text(
          text: 'Tools',
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: SizedBox(
                    height: 450.h,
                    child: GridView.count(crossAxisCount: 3, children: const [
                      SelectCategory(
                        navigation: BMICounter(),
                        text: 'BIM Calc',
                        image: 'assets/images/tools/bmi.png',
                      ),
                      SelectCategory(
                        navigation: BloodPressure(),
                        text: 'Blood Pressure Interpreter',
                        image: 'assets/images/tools/pressure.png',
                      ),
                      SelectCategory(
                        navigation: CalorieCounterView(),
                        text: 'Calorie Counter',
                        image: 'assets/images/tools/calorie.png',
                      ),
                      SelectCategory(
                        navigation: Stomach(),
                        text: 'Menstrual Cycle Counter',
                        image: 'assets/images/tools/mens.png',
                      ),
                      SelectCategory(
                        navigation: WalkCounterView(),
                        text: 'Walk Counter',
                        image: 'assets/images/tools/walk_count.png',
                      ),
                      SelectCategory(
                        navigation: ReminderView(),
                        text: 'Medical Remainder',
                        image: 'assets/images/tools/walk_count.png',
                      ),
                      SelectCategory(
                        navigation: ReminderView(),
                        text: 'Emergency Calls',
                        image: 'assets/images/tools/walk_count.png',
                      ),
                      SelectCategory(
                        navigation: Pancreatics(),
                        text: 'Store',
                        image: 'assets/images/tools/more.png',
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
