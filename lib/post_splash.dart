import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'View/Body/home_page.dart';
import 'View/Introduction/reuseables/intro.dart';


class PreSplash extends StatelessWidget {
  const PreSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show the splash screen while checking the user's login status
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      height: 400.h,
                      width: 400.w,
                      child:
                      Image.asset('assets/images/medcare.png', fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    'MedCare',
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  const Text(
                    'Where Quality Health Care Matters...',
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          );
        } else {
          // Check if the user is logged in or not
          if (snapshot.hasData && snapshot.data != null) {
            return const MyHomePage();
            // User is logged in, navigate to the Home screen
          } else {
            // User is not logged in, navigate to the Sign In screen
            return const IntroScreen();
          }
        }
      },
    );
  }
}
