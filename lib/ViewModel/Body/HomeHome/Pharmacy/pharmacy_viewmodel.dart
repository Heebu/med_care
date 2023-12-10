import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../Doctors/Profile/DoctorCartegories/more_carts.dart';

class PharmacyViewModel extends BaseViewModel {
  String clicked = 'Drugs';
  String pageToView = 'Clinics';

  void onClicked(String click) {
    clicked = click;
    notifyListeners();
  }

  void changeCart(String cart) {
    pageToView = cart;
    notifyListeners();
  }

  void navigateToMoreCart(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MoreCartsView(),
        ));
  }
}
