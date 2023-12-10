import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class HomePageViewModel extends BaseViewModel {
  int currentPage = 0;
  final pageController = PageController();
  String titleBar = 'MedCare';

  String firstName = '';
  String lastName = '';
  String uid = FirebaseAuth.instance.currentUser!.uid;

  var pharmacyStream =
      FirebaseFirestore.instance.collection('pharmacies').snapshots();

  void getName() async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('users').doc(uid);
    DocumentSnapshot docSnapshot = await docRef.get();
    firstName = docSnapshot.get('firstName');
    lastName = docSnapshot.get('lastName');
    notifyListeners();
  }

  void onChangePage(index) {
    currentPage = index;
    if (currentPage == 0) {
      titleBar = "MedCare";
    } else if (currentPage == 1) {
      titleBar = "Doctors";
    } else if (currentPage == 2) {
      titleBar = "Store";
    } else if (currentPage == 3) {
      titleBar = "Blog Articles";
    } else if (currentPage == 4) {
      titleBar = "Pharmacies";
    }
    notifyListeners();
  }

  void selectPage(index) {
    pageController.jumpToPage(index);
    currentPage = index;
    notifyListeners();
  }
}
