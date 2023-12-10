import 'package:pedometer/pedometer.dart';
import 'package:stacked/stacked.dart';

class WalkCounterViewModel extends BaseViewModel {
  int _stepCount = 0; // Variable to store the step count
  late Pedometer _pedometer; // Pedometer instance
  String status = 'Stop';

  int get stepCount => _stepCount;

  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;

  /// Handle step count changed
  void onStepCount(StepCount event) {
    _stepCount = event.steps;
    DateTime timeStamp = event.timeStamp;
  }

  /// Handle status changed
  void onPedestrianStatusChanged(PedestrianStatus event) {
    status = event.status;
    DateTime timeStamp = event.timeStamp;
    notifyListeners();
  }

  /// Handle the error
  void onPedestrianStatusError(error) {}

  /// Handle the error
  void onStepCountError(error) {}

  Future<void> initPlatformState() async {
    // Init streams
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _stepCountStream = Pedometer.stepCountStream;

    // Listen to streams and handle errors
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);
  }
}
