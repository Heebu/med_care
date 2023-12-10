import 'package:stacked/stacked.dart';

class HomeDrawerViewModel extends BaseViewModel {
  bool isTools = false;
  bool isAppointments = false;
  bool isProfile = false;

  void profileSwitch() {
    isProfile = !isProfile;
    notifyListeners();
  }

  void toolsSwitch() {
    isTools = !isTools;
    notifyListeners();
  }

  void appointmentSwitch() {
    isAppointments = !isAppointments;
    notifyListeners();
  }
}
