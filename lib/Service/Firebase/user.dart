import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

class User extends BaseViewModel {
  String? firstName;
  String? lastName;
  String? sex;
  String? city;
  String? email;
  String? address;
  String? dob;
  String? phoneNumber;
  String? state;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  void getNames() async {
    DocumentReference docRef =
    FirebaseFirestore.instance.collection('users').doc(uid);
    DocumentSnapshot docSnapshot = await docRef.get();
    firstName = docSnapshot.get('firstName');
    User().lastName = docSnapshot.get('lastName');
    User().email = docSnapshot.get('email');
    User().dob = docSnapshot.get('date of birth');
    User().address = docSnapshot.get('address');
    User().phoneNumber = docSnapshot.get('phoneNumber');
    User().city = docSnapshot.get('city');
    User().state = docSnapshot.get('state');
    notifyListeners();

    print(firstName);
  }
}
