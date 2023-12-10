import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_care/splash_screen.dart';
import 'Universal Reuseable Widgets/Functions/theme_settings.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(apiKey:'AIzaSyAsrIUw4B1EEOEwT_SL2uhTDWMCLOzsiJo',appId:'1:725106343747:android:64470948176e82fe0c39f6',messagingSenderId:'725106343747',projectId:'medflex-187bf'));
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeService().addThemeChangedListener(() {});

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScreenUtilInit(
        designSize: const Size(450.0, 700.0),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          ScreenUtil.init(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MedCare',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  color: ThemeService().isDarkMode
                      ? Colors.blueGrey.shade900
                      : Colors.blue.shade900,
                  iconTheme: const IconThemeData(color: Colors.white)),
              scaffoldBackgroundColor: ThemeService().isDarkMode
                  ? Colors.blue.shade50
                  : Colors.grey.shade50,
              colorScheme: ThemeService().isDarkMode
                  ? ColorScheme.fromSeed(seedColor: Colors.black)
                  : ColorScheme.fromSeed(seedColor: Colors.blue.shade900),
              useMaterial3: true,
            ),
            home: const
                //PostView(),

                SplashScreen(),
          );
        },
      ),
    );
  }
}


