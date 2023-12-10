import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../DoctorCartegories/more_carts.dart';

class DoctorsViewModel extends BaseViewModel {
  String pageToView = 'Physician';

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
