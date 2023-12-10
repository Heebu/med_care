import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../Universal Reuseable Widgets/Widgets/reuseable_click_button.dart';
import '../../../../Universal Reuseable Widgets/Widgets/textfields.dart';
import '../../../../ViewModel/Body/Profile/ProfileEdit/profile_edit_viewmodel.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProfileEditViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Edit Profile'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Profile Image
                    Center(
                      child: SizedBox(
                        height: 100.h,
                        width: 100.w,
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 50.r,
                                child: Icon(
                                  Icons.person,
                                  size: 50.sp,
                                ),
                              ),
                            ),

                            //pick an image
                            Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                radius: 20.r,
                                //backgroundColor: Colors.green.shade100,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    //Name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          child: TextFieldText(
                            controller: model.firstNameController,
                            text: 'First name',
                            icon: Icons.person,
                            textInputType: TextInputType.name,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          child: TextFieldText(
                            controller: model.lastNameController,
                            text: 'Last name',
                            icon: Icons.person,
                            textInputType: TextInputType.name,
                          ),
                        ),
                      ],
                    ),

                    //More Info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          child: TextFieldText(
                            controller: model.dobController,
                            text: 'Date of Birth',
                            icon: Icons.calendar_month,
                            textInputType: TextInputType.datetime,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          child: TextFieldText(
                            controller: model.phoneNumberController,
                            text: 'Phone Number',
                            icon: Icons.phone_android,
                            textInputType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),

                    //Address
                    TextFieldText(
                      controller: model.addressController,
                      text: 'Address',
                      icon: Icons.location_on,
                      textInputType: TextInputType.streetAddress,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          child: TextFieldText(
                            controller: model.cityController,
                            text: 'City',
                            icon: Icons.location_city,
                            textInputType: TextInputType.streetAddress,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          child: TextFieldText(
                            controller: model.stateController,
                            text: 'State',
                            icon: Icons.location_on_outlined,
                            textInputType: TextInputType.streetAddress,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 100.h,
                    ),
                    //Submit
                    ClickButton(
                      text: 'Submit',
                      boxColor: Colors.blue.shade900,
                      color: Colors.white,
                      size: 20,
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
