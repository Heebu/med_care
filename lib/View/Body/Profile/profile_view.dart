import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Universal Reuseable Widgets/Widgets/profile_text_tile.dart';
import '../HomeHome/home_home.dart';
import 'Appointments/appointment_view.dart';
import 'Orders/order_view.dart';
import 'ProfileEdit/profile_edit_view.dart';
import 'Settings/settings_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //image
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 50.r,
                    child: Icon(
                      Icons.person,
                      size: 50.sp,
                    ),
                  ),
                ),
              ),

              //Profile
              const ProfileListTile(
                route: ProfileEdit(),
                title: 'Profile',
                icon: Icons.person,
                subtitle: 'Edit account',
              ),

              //Orders
              const ProfileListTile(
                route: OrderView(),
                title: 'Orders',
                icon: Icons.shopping_cart,
                subtitle: 'Order requests, recent orders',
              ),

              //Appointments
              const ProfileListTile(
                route: AppointmentView(),
                title: 'Appointment',
                icon: Icons.schedule,
                subtitle: 'View appointment dates',
              ),

              //settings
              const ProfileListTile(
                route: SettingsView(),
                title: 'Settings',
                icon: Icons.settings,
                subtitle: 'Security, log-out and delete account',
              ),

              //Help
              const ProfileListTile(
                route: HomeHome(),
                title: 'Help',
                icon: Icons.help,
                subtitle: 'Help centers, contact us',
              ),

              //P&P
              ProfileListTile(
                route: HomeHome(),
                title: 'Privacy and Policies',
                icon: Icons.person,
                subtitle: 'Terms, privacy policies, guilds, insurance',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
