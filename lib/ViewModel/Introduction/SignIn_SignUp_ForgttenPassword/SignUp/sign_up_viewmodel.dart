import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:med_care/Service/Firebase/firebase_auths.dart';
import 'package:med_care/Universal%20Reuseable%20Widgets/Widgets/snack_bar.dart';
import 'package:stacked/stacked.dart';

import '../../../../View/Introduction/SignIn_SignUp_ForgttenPassword/SignUp/PersonalInfo/personal_info.dart';

class SignUpViewModel extends BaseViewModel{
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;


  void isObscured(bool password){
    password = !password;
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

  void signUp (context)async{
    isLoading = true;
    notifyListeners();

      String result = await FirebaseAuths().firebaseSignUp(email.text.trim(), password.text.trim());
      result == 'success'?
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) =>
            const PersonalInfo(),
        ),
      ):
      showSnackBar(context, result);
    isLoading = false;
    notifyListeners();
  }
  void googleSignUp(context) async{
    isLoading = true;
    notifyListeners();
    String result = await FirebaseAuths().signUpWithGoogle();
    isLoading = false;
    notifyListeners();

    if (result == 'success') {
      String? emailAddress = FirebaseAuth.instance.currentUser?.email;
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) =>
           const PersonalInfo(),
        ),);
    }
        else {
      showSnackBar(context, result);
    }
  }



}