// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intro_slider/intro_slider.dart';
// import 'package:intro_slider/slide_object.dart';
//
// import '../SignIn_SignUp_ForgttenPassword/SignUp/SignUp.dart';
// import '../SignIn_SignUp_ForgttenPassword/Sign_In/SignIn.dart';
//
// class Intro extends StatefulWidget {
//   const Intro({Key? key}) : super(key: key);
//
//   @override
//   State<Intro> createState() => _IntroState();
// }
//
// class _IntroState extends State<Intro> {
//   List<Slide> slides = [];
//
//   late Function goToTab;
//
//   @override
//   void initState() {
//     super.initState();
//
//     slides.add(
//       Slide(
//         title: "MedCare",
//         pathImage: 'assets/images/ola.png',
//         description: 'Where Quality Health Care Matters',
//         styleTitle: TextStyle(
//             color: Colors.white, fontSize: 30.sp, fontWeight: FontWeight.bold),
//         backgroundColor: Colors.blue.shade200,
//       ),
//     );
//
//     slides.add(
//       Slide(
//         title: "Book a Section",
//         styleTitle: TextStyle(
//             color: Colors.white, fontSize: 30.sp, fontWeight: FontWeight.bold),
//         description:
//             "Book a fast and affordable session with our professional Doctors. Therapist and life coaches",
//         pathImage: "assets/images/book_appoint.png",
//         backgroundColor: Colors.indigo.shade500,
//       ),
//     );
//
//     slides.add(
//       Slide(
//         title: "Pharmacies gets closer",
//         styleTitle: TextStyle(
//             color: Colors.indigo.shade900,
//             fontSize: 30.sp,
//             fontWeight: FontWeight.bold),
//         description:
//             "Order from your favorite local pharmacy and get your medical supplies"
//             "delivered at your doorstep",
//         pathImage: "assets/images/online_pharmacy.jpg",
//         backgroundColor: Colors.blue.shade200,
//       ),
//     );
//     slides.add(
//       Slide(
//         title: "Response Actions",
//         styleTitle: TextStyle(
//             color: Colors.blue.shade200,
//             fontSize: 30.sp,
//             fontWeight: FontWeight.bold),
//         description: "We're always available for your service 24/7",
//         pathImage: "assets/images/emergency_team.png",
//         backgroundColor: Color(0xFF1A237E),
//       ),
//     );
//   }
//
//   void onDonePress() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (BuildContext context) {
//           return const SignIn();
//         },
//       ),
//     );
//   }
//
//   void onTabChangedCompleted(index) {}
//
//   Widget renderNextBtn() {
//     return const Icon(
//       Icons.navigate_next,
//       size: 35,
//     );
//   }
//
//   Widget renderDoneBtn() {
//     return Icon(
//       Icons.done,
//       size: 35,
//     );
//   }
//
//   Widget renderSkipBtn() {
//     return Icon(
//       Icons.skip_next,
//       size: 35.sp,
//       color: Colors.white,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IntroSlider(
//         slides: slides,
//         onDonePress: onDonePress,
//         colorActiveDot: Colors.white,
//         colorDot: Colors.black26,
//         showPrevBtn: true,
//         showSkipBtn: true,
//         showNextBtn: true,
//         // skipButtonStyle: ButtonStyle(
//         //   backgroundColor: MaterialStateProperty.all(Colors.white),
//         //   foregroundColor: MaterialStateProperty.all(Colors.blueGrey),
//         // ),
//         nextButtonStyle: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all(Colors.white),
//           foregroundColor: MaterialStateProperty.all(Colors.blueGrey),
//         ),
//         doneButtonStyle: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all(Colors.white),
//         ),
//         onSkipPress: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const SignUp(),
//             ),
//           );
//         },
//         autoScrollInterval: const Duration(seconds: 6),
//       ),
//     );
//   }
// }
