import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_care/Universal%20Reuseable%20Widgets/Utils/app_colors.dart';
import 'package:stacked/stacked.dart';
import '../../../../../Universal Reuseable Widgets/Widgets/reuseable_click_button.dart';
import '../../../../../Universal Reuseable Widgets/Widgets/textfields.dart';
import '../../../../../ViewModel/Introduction/SignIn_SignUp_ForgttenPassword/SignUp/PersonalInfo/personal_info_viewmodel.dart';
import '../../../reuseables/titles.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PersonalInfoViewModel>.nonReactive(
      viewModelBuilder: () => PersonalInfoViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 10.w,
                ),
                child: Column(
                  children: [
                    HeadTitles(
                      text: 'Personally fill in the following to get started.',
                      size: 15.sp,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFieldText(
                      text: 'First Name',
                      icon: Icons.person_pin,
                      controller: model.firstName,
                      textInputType: TextInputType.name,
                    ),
                    TextFieldText(
                      text: 'Last Name',
                      icon: Icons.person_pin,
                      controller: model.lastName,
                      textInputType: TextInputType.name,
                    ),
                    TextFieldText(
                      text: 'Phone Number',
                      icon: Icons.phone_android,
                      controller: model.phoneNumber,
                      textInputType: TextInputType.number,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: TextFieldText(
                            text: 'Sex',
                            icon: Icons.transgender,
                            controller: model.sex,
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: TextFieldText(
                            text: 'Date of Birth',
                            icon: Icons.date_range,
                            textInputType: TextInputType.datetime,
                            controller: model.dob,
                          ),
                        ),
                      ],
                    ),
                    TextFieldText(
                      text: 'Address',
                      icon: Icons.location_on,
                      controller: model.address,
                      textInputType: TextInputType.streetAddress,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: TextFieldText(
                            text: 'City',
                            icon: Icons.location_city,
                            textInputType: TextInputType.streetAddress,
                            controller: model.city,
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: TextFieldText(
                            text: 'State',
                            icon: Icons.location_on_outlined,
                            controller: model.state,
                            textInputType: TextInputType.streetAddress,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () => model.continueSignUp(context),
                      child: ClickButton(
                        text: 'Continue',
                        size: 25,
                        color: Colors.blueGrey.shade200,
                        boxColor: MyAppColors().mainAppColor,
                      ),
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
