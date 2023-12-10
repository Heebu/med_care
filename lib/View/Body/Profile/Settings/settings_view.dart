import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../Universal Reuseable Widgets/Functions/theme_settings.dart';
import '../../../../Universal Reuseable Widgets/Widgets/profile_text_tile.dart';
import '../../../../ViewModel/Body/Profile/Settings/settings_viewmodel.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              children: [
                //light and dark mode
                GestureDetector(
                  onTap: () => model.changeModes(context),
                  child: SettingsListTile(
                    trailingIcon: ThemeService().isDarkMode
                        ? Icons.light_mode
                        : Icons.dark_mode,
                    title: 'Dark Mode',
                    icon: Icons.mode_night_outlined,
                    subtitle: 'Tap to switch modes',
                  ),
                ),

                //change password
                GestureDetector(
                  onTap: () => model.changePassword(context),
                  child: const SettingsListTile(
                    trailingIcon: Icons.lock,
                    title: 'Change Password',
                    icon: Icons.password,
                    subtitle: 'Tap to switch modes',
                  ),
                ),

                //log out
                GestureDetector(
                  onTap: () => model.logOut(context),
                  child: const SettingsListTile(
                    trailingIcon: Icons.exit_to_app,
                    title: 'Log out',
                    icon: Icons.logout,
                    subtitle: 'Log out this account',
                  ),
                ),

                //delete account
                GestureDetector(
                  onTap: () => model.deleteAccount(context),
                  child: const SettingsListTile(
                    trailingIcon: Icons.delete_forever,
                    title: 'Delete Account',
                    icon: Icons.remove_circle_outline_outlined,
                    subtitle: 'Delete this account',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
