import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_care/Universal%20Reuseable%20Widgets/Utils/app_colors.dart';
import 'package:med_care/Universal%20Reuseable%20Widgets/Widgets/text.dart';
import 'package:stacked/stacked.dart';
import '../../../../Universal Reuseable Widgets/Widgets/my_icon.dart';
import '../../../../Universal Reuseable Widgets/Widgets/reuseable_click_button.dart';
import '../../../../Universal Reuseable Widgets/Widgets/textfields.dart';
import '../../../../ViewModel/Introduction/SignIn_SignUp_ForgttenPassword/Sign_In/sign_in_viewmodel.dart';
import '../../reuseables/titles.dart';
import '../ForgotPassword/forgot_password.dart';
import '../SignUp/SignUp.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 30.h,
                  left: 20.w,
                  right: 10.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeadTitles(
                      text: '👋Welcome back! Sign in',
                      size: 20,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    TextFieldText(
                      text: 'Email',
                      icon: Icons.mail,
                      controller: model.email,
                    ),
                    TextFieldText(
                      text: 'Password',
                      icon: Icons.lock,
                      controller: model.password,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ForgotPassword()),
                            );
                          },
                          child: Text2(text: 'Forget Password', color: MyAppColors().mainAppColor,)
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    GestureDetector(
                      onTap: () => model.signIn(context),
                      child: model.isLoading == true
                          ?  SizedBox(
                              height: 30.h,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : ClickButton(
                              text: 'Sign In',
                              size: 25.sp,
                              color: MyAppColors().iconColor,
                              boxColor: MyAppColors().mainAppColor,
                            ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUp(),
                                ));
                          },
                          child: Text(
                            'Sign up?',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () => model.googleSignIn(context),
                          child: Text(
                            'Sign in with Google',
                            style: TextStyle(
                                color: Colors.red.shade900, fontSize: 20.sp),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
