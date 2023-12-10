import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_care/Universal%20Reuseable%20Widgets/Widgets/snack_bar.dart';
import 'package:stacked/stacked.dart';

import '../../../../Service/Firebase/firebase_auths.dart';
import '../../../../View/Body/home_page.dart';

class SignInViewModel extends BaseViewModel{
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

   void signIn(context) async{
    isLoading = true;
    notifyListeners();
    String result = await FirebaseAuths().firebaseSignIn(email.text.trim(), password.text.trim());
    isLoading = false;
    notifyListeners();
    result == 'success'? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage(),))
        : showSnackBar(context, result);
  }

  void googleSignIn(context) async{
    isLoading = true;
    notifyListeners();
    String result = await FirebaseAuths().signInWithGoogle();
    isLoading = false;
    notifyListeners();
    result == 'success'? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage(),))
        : showSnackBar(context, result);
  }
}