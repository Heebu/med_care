import 'package:flutter/cupertino.dart';
import 'package:med_care/Service/Firebase/firebase_auths.dart';
import 'package:med_care/Universal%20Reuseable%20Widgets/Widgets/snack_bar.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  TextEditingController email = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
  }

  void forgotPassword(context) async {
    isLoading = true;
    notifyListeners();
    String result =
        await FirebaseAuths().firebaseForgotPassword(email.text.trim());
    result == 'success'
        ? Navigator.pop(context)
        : showSnackBar(context, result);
    isLoading = false;
    notifyListeners();
  }
}
