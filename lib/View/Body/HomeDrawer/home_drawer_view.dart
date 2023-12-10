import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../Universal Reuseable Widgets/Widgets/profile_text_tile.dart';
import '../../../ViewModel/Body/HomeDrawer/home_drawer_viewmodel.dart';
import '../HomeHome/Services/services.dart';
import '../HomeHome/home_home.dart';
import '../Profile/Appointments/appointment_view.dart';
import '../Profile/Orders/order_view.dart';
import '../Profile/ProfileEdit/profile_edit_view.dart';
import '../Profile/Settings/settings_view.dart';
import '../SimpleTools/BIMCounter/bmi_counter_view.dart';
import '../SimpleTools/CalorieCounter/calorie_counter_view.dart';
import '../SimpleTools/WalkerCounter/walk_counter_view.dart';
import '../StoresHome/Categories/blood_pressure.dart';
import '../StoresHome/Categories/stomach.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
    this.model,
  });

  final model;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeDrawerViewModel(),
      builder: (context, m, child) {
        return Drawer(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileEdit(),
                              ));
                        },
                        child: Center(child: CircleAvatar(radius: 50.r))),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileEdit(),
                            ));
                      },
                      child: Center(
                        child: Text(
                          '${model.firstName} ${model.lastName}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: Colors.blue.shade900),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    //Profile
                    Row(
                      children: [
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () => m.profileSwitch(),
                            icon: m.isProfile
                                ? const Icon(Icons.keyboard_arrow_up)
                                : const Icon(Icons.keyboard_arrow_down))
                      ],
                    ),

                    m.isProfile
                        ? const Column(
                            children: [
                              //Profile
                              ProfileListTile2(
                                route: ProfileEdit(),
                                title: 'Profile',
                                icon: Icons.person,
                              ),

                              //Orders
                              ProfileListTile2(
                                route: OrderView(),
                                title: 'Orders',
                                icon: Icons.shopping_cart,
                              ),

                              //Appointments
                              ProfileListTile2(
                                route: AppointmentView(),
                                title: 'Appointment',
                                icon: Icons.schedule,
                              ),

                              //settings
                              ProfileListTile2(
                                route: SettingsView(),
                                title: 'Settings',
                                icon: Icons.settings,
                              ),

                              //Help
                              ProfileListTile2(
                                route: HomeHome(),
                                title: 'Help',
                                icon: Icons.help,
                              ),

                              //P&P
                              ProfileListTile2(
                                route: HomeHome(),
                                title: 'Privacy and Policies',
                                icon: Icons.person,
                              )
                            ],
                          )
                        : const SizedBox.shrink(),
                    SizedBox(
                      height: 10.h,
                    ),

                    //appointments
                    Row(
                      children: [
                        Text(
                          'Appointments',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () => m.appointmentSwitch(),
                            icon: m.isAppointments
                                ? const Icon(Icons.keyboard_arrow_up)
                                : const Icon(Icons.keyboard_arrow_down))
                      ],
                    ),
                    m.isAppointments
                        ? const Column(
                            children: [
                              AppointmentWidget(
                                date: 'Monday, Dec 23',
                                time: '12:00 - 13:00',
                                docName: 'Nurse Kunle',
                                description: 'Digestive Advice',
                              ),
                              AppointmentWidget(
                                date: 'Monday, Sep 23',
                                time: '1:00 - 3:30',
                                docName: 'Dr Adedeji',
                                description: 'Moral Counselling',
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                    SizedBox(
                      height: 10.h,
                    ),

                    //tools
                    Row(
                      children: [
                        Text(
                          'Tools',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () => m.toolsSwitch(),
                            icon: m.isTools
                                ? const Icon(Icons.keyboard_arrow_up)
                                : const Icon(Icons.keyboard_arrow_down))
                      ],
                    ),
                    m.isTools
                        ? const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              DrawerListTiles(
                                title: 'BMI',
                                image: 'assets/images/tools/bmi.png',
                                navigator: BMICounter(),
                              ),
                              DrawerListTiles(
                                title: 'Calorie Counter',
                                image: 'assets/images/tools/calorie.png',
                                navigator: CalorieCounterView(),
                              ),
                              DrawerListTiles(
                                title: 'Blood Pressure Interpreter',
                                image: 'assets/images/tools/pressure.png',
                                navigator: BloodPressure(),
                              ),
                              DrawerListTiles(
                                title: 'Menstrual Cycle Counter',
                                image: 'assets/images/tools/mens.png',
                                navigator: Stomach(),
                              ),
                              DrawerListTiles(
                                title: 'Walk Counter',
                                image: 'assets/images/tools/bmi.png',
                                navigator: WalkCounterView(),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
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

class DrawerListTiles extends StatelessWidget {
  const DrawerListTiles({
    super.key,
    required this.title,
    required this.image,
    required this.navigator,
  });

  final String title;
  final String image;
  final Widget navigator;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => navigator,
          ),
        );
      },
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: AssetImage(image),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 12.sp,
      ),
    );
  }
}
