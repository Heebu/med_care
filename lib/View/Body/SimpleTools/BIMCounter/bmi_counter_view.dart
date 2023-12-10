import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_care/Universal%20Reuseable%20Widgets/Widgets/textfields.dart';
import 'package:stacked/stacked.dart';

import '../../../../Universal Reuseable Widgets/Widgets/reuseable_click_button.dart';
import '../../../../ViewModel/Body/SimpleTools/BIMCounter/bmi_counter_viewmodel.dart';


class BMICounter extends StatelessWidget {
  const BMICounter({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => BIMCounterViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('BMI Calculator'),
            centerTitle: true,
            backgroundColor: model.mainColor,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(300.r),
                          color: model.mainColor,
                        ),
                        height: 200.h,
                        width: 300.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              model.bmiResult,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              model.result,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          child: TextFieldText(
                            text: 'Height (m)',
                            icon: Icons.height,
                            controller: model.heightController,
                            textInputType: TextInputType.number,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          child: TextFieldText(
                            text: 'Weight (Kg)',
                            icon: Icons.height,
                            controller: model.weightController,
                            textInputType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        // model.bmiCalc();
                        model.resultCalc(context);
                      },
                      child: SizedBox(
                        width: 200.h,
                        child: ClickButton(
                          text: 'BMI',
                          size: 20,
                          color: Colors.white,
                          boxColor: Colors.grey,
                        ),
                      ),
                    )
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
