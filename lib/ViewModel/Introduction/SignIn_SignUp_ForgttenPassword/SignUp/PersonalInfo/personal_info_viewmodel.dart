import 'package:flutter/material.dart';
import 'package:med_care/Service/Firebase/firebase_auths.dart';
import 'package:med_care/Universal%20Reuseable%20Widgets/Widgets/snack_bar.dart';
import 'package:stacked/stacked.dart';

import '../../../../../View/Body/home_page.dart';


class PersonalInfoViewModel extends BaseViewModel {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController sex = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    firstName.dispose();
    lastName.dispose();
    phoneNumber.dispose();
    sex.dispose();
    dob.dispose();
    address.dispose();
    city.dispose();
    state.dispose();
  }

  void continueSignUp(context) async {
    isLoading = true;
    notifyListeners();
    String result = await FirebaseAuths().storeUserInfo(
      firstName.text.trim(),
      lastName.text.trim(),
      phoneNumber.text.trim(),
      sex.text.trim(),
      dob.text.trim(),
      address.text.trim(),
      city.text.trim(),
      state.text.trim(),
    );

    if (result == 'success') {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    } else if (result == 'notVerified') {
      showSnackBar(context, 'Please click the link in your email to verify your account');
      Navigator.pop(context);
    } else {
      showSnackBar(context, result);
    }
  }
}
