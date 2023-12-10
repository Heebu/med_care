import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_care/ViewModel/Introduction/intro_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../../Universal Reuseable Widgets/Utils/app_colors.dart';
import '../../../Universal Reuseable Widgets/Utils/my_sizez.dart';
import '../../../Universal Reuseable Widgets/Widgets/intro_screen_widget.dart';
import '../../../Universal Reuseable Widgets/Widgets/text.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(viewModelBuilder: () => IntroViewModel(), builder: (context, model, child) =>
        Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: model.pageController,
            onPageChanged: (page){
              model.pageUnChange(page);
            },
            children: [
            const IntroScreenWidgets(title: 'MedCare By MedFlex', imagePath: 'assets/images/ola.png', description: 'Where quality health matters', backgroundColor: Colors.blue, textColor: Colors.white),
            IntroScreenWidgets(title: 'Book a Section', imagePath: 'assets/images/book_appoint.png', description: 'Book a fast and affordable session with our professional Doctors. Therapist and life coaches', backgroundColor: Colors.white, textColor: MyAppColors().mainAppColor),
            const IntroScreenWidgets(title: 'Pharmacies gets closer', imagePath: 'assets/images/online_pharmacy.jpg', description: 'Order from your favorite local pharmacy and get your medical supplies delivered at your doorste', backgroundColor: Colors.blue, textColor: Colors.white),
            IntroScreenWidgets(title: 'Response Actions', imagePath: 'assets/images/emergency_team.png', description: "We're always available for your service 24/7", backgroundColor: Colors.white, textColor: MyAppColors().mainAppColor),
          ],),
          model.pageNumber==0? Align(alignment: Alignment.bottomCenter, child:
          GestureDetector(
            onTap: (){
              model.nextPage();
            },
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 20.h),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(color: MyAppColors().mainAppColor, borderRadius: BorderRadius.circular(MySizes().border2Size)),
                child: Text2(text: 'Next', color: Colors.white,)),
          )
            ,): const SizedBox.shrink(),
          0 < model.pageNumber && 3> model.pageNumber? Align(alignment: Alignment.bottomCenter, child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            GestureDetector(
              onTap: (){
                model.previousPage();
              },
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  decoration: BoxDecoration(color: MyAppColors().mainAppColor, borderRadius: BorderRadius.circular(MySizes().border2Size)),
                  child: Text2(text: 'Previous', color: Colors.white,)),
            ),
            GestureDetector(
              onTap: (){
                model.nextPage();
              },
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  decoration: BoxDecoration(color: MyAppColors().mainAppColor, borderRadius: BorderRadius.circular(MySizes().border2Size)),
                  child: Text2(text: 'Next', color: Colors.white,)),
            )
          ],)
            ,): SizedBox.shrink(),
          model.pageNumber ==3 ? Align(alignment: Alignment.bottomCenter, child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            GestureDetector(
              onTap: (){
                model.previousPage();
              },
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  decoration: BoxDecoration(color: MyAppColors().mainAppColor, borderRadius: BorderRadius.circular(MySizes().border2Size)),
                  child: Text2(text: 'Previous', color: Colors.white,)),
            ),
            GestureDetector(
              onTap: (){
                model.moveToLogInScreen(context);
              },
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  decoration: BoxDecoration(color: MyAppColors().mainAppColor, borderRadius: BorderRadius.circular(MySizes().border2Size)),
                  child: Text2(text: 'Get Started', color: Colors.white,)),
            )
          ],)
            ,): const SizedBox.shrink(),
        ],
      ),


    ),);
  }
}


