import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

class HomeHomeViewModel extends BaseViewModel {
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
}
