import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'calorie_counter_viewmodel.dart';

class CalorieCounterView extends StatelessWidget {
  const CalorieCounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalorieCounterViewModel>.reactive(
      viewModelBuilder: () => CalorieCounterViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Calorie Counter'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Calories Consumed: ${model.caloriesConsumed}'),
                Text('Calories Burned: ${model.caloriesBurned}'),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () {
                    // Show a dialog or navigate to a new screen to input consumed calories
                    // You can use model.addCaloriesConsumed to add calories to the total
                  },
                  child: const Text('Add Calories Consumed'),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () {
                    // Show a dialog or navigate to a new screen to input burned calories
                    // You can use model.addCaloriesBurned to add calories to the total
                  },
                  child: const Text('Add Calories Burned'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
