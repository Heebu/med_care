import 'package:stacked/stacked.dart';

class CalorieCounterViewModel extends BaseViewModel {
  int caloriesConsumed = 0;
  int caloriesBurned = 0;

  void addCaloriesConsumed(int amount) {
    caloriesConsumed += amount;
    notifyListeners();
  }

  void addCaloriesBurned(int amount) {
    caloriesBurned += amount;
    notifyListeners();
  }
}
