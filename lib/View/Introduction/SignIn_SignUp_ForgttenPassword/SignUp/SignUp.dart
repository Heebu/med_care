import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../../Universal Reuseable Widgets/Widgets/reuseable_click_button.dart';
import '../../../../Universal Reuseable Widgets/Widgets/textfields.dart';
import '../../../../ViewModel/Introduction/SignIn_SignUp_ForgttenPassword/SignUp/sign_up_viewmodel.dart';
import '../../reuseables/titles.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: SingleChildScrollView(
              child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                top: 50.h,
                left: 20.w,
                right: 10.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HeadTitles(
                    text: 'Create an account',
                    size: 20.sp,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextFieldText(
                    text: 'Email',
                    icon: Icons.mail,
                    controller: model.email,
                  ),

                  //password
                  Password(
                    passwordController: model.password,
                    text: 'Password',
                  ),

                  SizedBox(
                    height: 50.h,
                  ),
                  model.isLoading == true
                      ? SizedBox(
                          height: 30.h,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : GestureDetector(
                          onTap: () => model.signUp(context),
                          child: ClickButton(
                            text: 'Register',
                            size: 20.sp,
                            color: Colors.blueGrey.shade200,
                            boxColor: Colors.blue.shade900,
                          ),
                        ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => model.googleSignUp(context),
                        child: Text(
                          'Google Sign-Up!',
                          style: TextStyle(
                            color: Colors.red.shade900,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Sign-In?',
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
