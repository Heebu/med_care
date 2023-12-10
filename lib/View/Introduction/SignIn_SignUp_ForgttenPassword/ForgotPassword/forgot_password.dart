import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../../Universal Reuseable Widgets/Widgets/reuseable_click_button.dart';
import '../../../../Universal Reuseable Widgets/Widgets/textfields.dart';
import '../../../../ViewModel/Introduction/SignIn_SignUp_ForgttenPassword/ForgotPassword/forgot_password_viewmodel.dart';
import '../../reuseables/titles.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ForgotPasswordViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.grey.shade300,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 10.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HeadTitles(
                    text: 'Forgot password',
                    size: 20,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  TextFieldText(
                    text: 'Email',
                    icon:  Icons.mail,
                    controller: model.email,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () => model.forgotPassword(context),
                    child: model.isLoading == true
                        ? SizedBox(
                            height: 30.h,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : ClickButton(
                            text: 'Reset Code',
                            size: 25.sp,
                            color: Colors.blue.shade900,
                          ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70.w),
                    child: Text(
                      'We will send a code '
                      'to the email address'
                      'to regain your password',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blueGrey, fontSize: 20.sp),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
