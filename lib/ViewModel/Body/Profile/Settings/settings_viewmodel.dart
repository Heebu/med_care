import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_care/Service/Firebase/firebase_auths.dart';
import 'package:med_care/Universal%20Reuseable%20Widgets/Widgets/snack_bar.dart';
import 'package:stacked/stacked.dart';

import '../../../../Universal Reuseable Widgets/Functions/theme_settings.dart';
import '../../../../Universal Reuseable Widgets/Widgets/textfields.dart';
import '../../../../View/Introduction/SignIn_SignUp_ForgttenPassword/Sign_In/SignIn.dart';


class SettingsViewModel extends BaseViewModel {
  String? email = FirebaseAuth.instance.currentUser?.email;
  TextEditingController passwordController = TextEditingController();

  void changeModes(context) async {
    await ThemeService().toggleTheme();
    notifyListeners();
  }

  void changePassword(context) async {
    if (email != null) {
      try {
        String result = await FirebaseAuths().firebaseForgotPassword(email!);
        result == 'success'
            ? showSnackBar(
                context, 'a link has been sent to your email account')
            : showSnackBar(context, result);
      } catch (e) {
        showSnackBar(context, e.toString());
      }
    } else {
      showSnackBar(context, 'an unexpected error occurred');
    }
  }

  void logOut(context) async {
    try {
      String result = await FirebaseAuths().firebaseSignOut(context);
      if (result == 'success') {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignIn(),
            ));
        showSnackBar(context, 'Successfully Logged out');
      } else {
        showSnackBar(context, result);
      }
    } catch (e) {
      showSnackBar(context, 'an unexpected error occurred');
    }
  }

  void deleteAccount(context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirm Password'),
            content: SizedBox(
              height: 100.h,
              child: TextFieldText(
                text: 'Password',
                icon: Icons.password,
                controller: passwordController,
                textInputType: TextInputType.visiblePassword,
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () async {
                    if (passwordController.text.isNotEmpty) {
                      String result = await FirebaseAuths().deleteAccount(
                          context, passwordController.text.trim());
                      if (result == 'success') {
                        Navigator.popUntil(context, (route) => route.isFirst);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ));
                      }
                    }
                  },
                  child: const Text('Delete'))
            ],
          );
        });
  }
}
